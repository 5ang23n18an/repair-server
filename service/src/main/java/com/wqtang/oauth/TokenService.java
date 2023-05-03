package com.wqtang.oauth;

import com.google.common.collect.Maps;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.po.user.LoginUser;
import com.wqtang.util.IPAddressUtils;
import com.wqtang.util.RedisUtils;
import com.wqtang.util.SecurityUtils;
import com.wqtang.util.ServletUtils;
import eu.bitwalker.useragentutils.UserAgent;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author Wenqian Tang
 * @date 2023/3/15
 */
@Component
public class TokenService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenService.class);

    @Value("${token.timeout}")
    private int timeout;
    @Value("${token.signingKey}")
    private String signingKey;
    @Value("${token.renewThreshold}")
    private int renewThreshold;

    @Lazy
    @Resource(name = "authenticationManager")
    private AuthenticationManager authenticationManager;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;
    @Resource(name = "IPAddressUtils")
    private IPAddressUtils ipAddressUtils;

    /**
     * 使用UsernamePassword模式, 验证用户信息. 验证通过后, 颁发令牌token
     *
     * @param username
     * @param password
     * @return
     */
    public String authenticateAndCreateAccessToken(String username, String password) {
        // 验证用户信息
        ServletUtils.getHttpServletRequest().setAttribute("password", password);
        Authentication userAuthentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        // 记录用户信息
        SecurityUtils.setAuthentication(userAuthentication);
        // 颁发令牌token
        return createAccessToken(((LoginUser) userAuthentication.getPrincipal()));
    }

    /**
     * 创建令牌token
     *
     * @param loginUser
     * @return
     */
    private String createAccessToken(LoginUser loginUser) {
        loginUser.setToken(UUID.randomUUID().toString());
        setUserAgent(loginUser);
        refreshToken(loginUser);
        Map<String, Object> claims = Maps.newHashMapWithExpectedSize(1);
        claims.put("login_user_key", loginUser.getToken());
        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, signingKey.getBytes(StandardCharsets.UTF_8))
                .setClaims(claims)
                .compact();
    }

    /**
     * 设置用户代理信息
     *
     * @param loginUser
     */
    private void setUserAgent(LoginUser loginUser) {
        HttpServletRequest servletRequest = ServletUtils.getHttpServletRequest();
        String userAgentString = servletRequest.getHeader(HttpHeaders.USER_AGENT);
        UserAgent userAgent = UserAgent.parseUserAgentString(userAgentString);
        String ip = IPAddressUtils.getIPAddressFromHttpServletRequest();
        loginUser.setIpAddr(ip);
        loginUser.setLoginLocation(ipAddressUtils.getLocationByIPAddress(ip));
        loginUser.setBrowser(userAgent.getBrowser().getName());
        loginUser.setOs(userAgent.getOperatingSystem().getName());
    }

    /**
     * 刷新令牌有效期
     *
     * @param loginUser
     */
    private void refreshToken(LoginUser loginUser) {
        Date loginTime = Calendar.getInstance().getTime(), expireTime = DateUtils.addMinutes(loginTime, timeout);
        loginUser.setLoginTime(loginTime);
        loginUser.setExpireTime(expireTime);
        String loginToken = loginUser.getToken();
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.LOGIN_TOKEN, loginToken);
        redisUtils.set(redisKey, loginUser, timeout, TimeUnit.MINUTES);
    }

    /**
     * 获取用户身份信息
     *
     * @param servletRequest
     * @return
     */
    public LoginUser getLoginUser(HttpServletRequest servletRequest) {
        // 获取请求携带的令牌
        String token = getTokenFromHttpServletRequest(servletRequest);
        if (StringUtils.isEmpty(token)) {
            LOGGER.warn("token is empty");
            return null;
        }
        try {
            Claims claims = parseToken(token);
            // 解析对应的权限以及用户信息
            String userKey = MapUtils.getString(claims, "login_user_key");
            String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.LOGIN_TOKEN, userKey);
            return redisUtils.getAndCast(redisKey, LoginUser.class);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            return null;
        }
    }

    /**
     * 从 HttpServletRequest 中提取token信息
     *
     * @param servletRequest
     * @return
     */
    private String getTokenFromHttpServletRequest(HttpServletRequest servletRequest) {
        String token = servletRequest.getHeader(HttpHeaders.AUTHORIZATION);
        if (StringUtils.isEmpty(token) || !token.startsWith("Bearer ")) {
            return token;
        }
        return token.substring(7);
    }

    /**
     * 从token中获取数据声明
     *
     * @param token
     * @return
     */
    private Claims parseToken(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(signingKey.getBytes(StandardCharsets.UTF_8))
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 设置用户身份信息
     */
    public void setLoginUser(LoginUser loginUser) {
        if (loginUser != null && StringUtils.isNotEmpty(loginUser.getToken())) {
            refreshToken(loginUser);
        }
    }

    /**
     * 删除用户身份信息
     */
    public void deleteLoginUser(String token) {
        if (StringUtils.isNotEmpty(token)) {
            String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.LOGIN_TOKEN, token);
            redisUtils.delete(redisKey);
        }
    }

    /**
     * 验证令牌剩余有效期. 不足20分钟时, 自动刷新缓存, 完成续签
     *
     * @param loginUser
     * @return 令牌
     */
    public void renewToken(LoginUser loginUser) {
        Date currentTime = Calendar.getInstance().getTime(), expireTime = loginUser.getExpireTime();
        if (expireTime.before(DateUtils.addMinutes(currentTime, renewThreshold))) {
            refreshToken(loginUser);
        }
    }

}
