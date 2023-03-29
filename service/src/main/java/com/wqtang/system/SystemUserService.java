package com.wqtang.system;

import com.wqtang.auth.TokenService;
import com.wqtang.config.redis.RedisConfig;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.SystemConfigKeyEnum;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.object.po.user.LoginUser;
import com.wqtang.object.vo.request.system.SystemUserLoginRequest;
import com.wqtang.object.vo.request.system.SystemUserModifyPasswordRequest;
import com.wqtang.util.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Service
public class SystemUserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemUserService.class);

    @Value("${captcha.timeout}")
    private long captchaTimeout;

    @Resource(name = "tokenService")
    private TokenService tokenService;
    @Resource(name = "systemMenuService")
    private SystemMenuService systemMenuService;
    @Resource(name = "systemConfigService")
    private SystemConfigService systemConfigService;
    @Resource(name = "systemUserMapper")
    private SystemUserMapper systemUserMapper;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;
    @Resource(name = "emailUtils")
    private EmailUtils emailUtils;
    @Resource(name = "passwordEncoder")
    private PasswordEncoder passwordEncoder;

    public String login(SystemUserLoginRequest request) {
        String token = StringUtils.isNotEmpty(request.getApp()) ?
                loginFromApp(request.getUsername(), request.getPassword(), request.getApp()) :
                loginFromWeb(request.getUsername(), request.getPassword(), request.getCode(), request.getUuid());
        recordLoginInfo(SecurityUtils.getCurrentUserId());
        return token;
    }

    private String loginFromApp(String username, String password, String app) {
        if (!"repair".equals(app)) {
            LOGGER.error("Invalid parameter is received in `SystemUserService.loginFromApp`, app = {}", app);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "Illegal login information from application, login prohibited", "非法的APP登录信息，禁止登录");
        }
        return tokenService.authenticateAndCreateAccessToken(username, password);
    }

    private String loginFromWeb(String username, String password, String code, String uuid) {
        if (systemConfigService.isSystemConfigAvailable(SystemConfigKeyEnum.CAPTCHA.getKey())) {
            validateCaptcha(code, RedisConfig.KEY_CAPTCHA_PREFIX + uuid);
        }
        return tokenService.authenticateAndCreateAccessToken(username, password);
    }

    private void validateCaptcha(String inputCode, String redisKey) {
        String expectedCode = redisUtils.getAndCast(redisKey, String.class);
        if (expectedCode == null) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "The verification code has expired, please get it again", "验证码已过期，请重新获取");
        }
        if (!expectedCode.equals(inputCode)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "Wrong verification code", "验证码错误");
        }
    }

    public SystemUser getByUsername(String username) {
        return systemUserMapper.getByUsername(username);
    }

    public void emailVerification(String email) {
        // 随机生成一个6位的验证码
        String code = RandomCodeUtils.generateRandomDigits();
        // 发送邮件
        String subject = "用户邮箱验证";
        String text = "欢迎使用密码重置服务。您的验证码是: " + code + ", 有效期为2分钟。如非本人操作，请检查帐号安全。";
        emailUtils.send(email, subject, text);
        // 在邮件发送成功后, 将该邮箱号以及对应的验证码缓存起来, 并设置好超时时间, 以此作为有效时长
        String redisKey = RedisConfig.KEY_EMAIL_PREFIX + email;
        redisUtils.set(redisKey, code, captchaTimeout, TimeUnit.MINUTES);
    }

    public void modifyPassword(SystemUserModifyPasswordRequest request) {
        String username = request.getUsername();
        SystemUser systemUser = getByUsername(username);
        if (systemUser == null) {
            throw new BusinessException(ErrorEnum.USER_NOT_FOUND);
        }
        String email = request.getEmail();
        if (!systemUser.getEmail().equals(email)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "Please fill in your email when registering", "请输入注册时填写的邮箱号");
        }
        validateCaptcha(request.getVerificationCode(), RedisConfig.KEY_EMAIL_PREFIX + email);
        String rawPassword = request.getPassword();
        systemUserMapper.updatePasswordByUsername(username, passwordEncoder.encode(rawPassword));
    }

    private void recordLoginInfo(Long userId) {
        SystemUser systemUser = new SystemUser();
        systemUser.setUserId(userId);
        systemUser.setLoginIp(IPAddressUtils.getIPAddress());
        systemUser.setLoginDate(Calendar.getInstance().getTime());
        systemUserMapper.updateLoginInfo(systemUser);
    }

    public void refreshLoginUserPermissions() {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        if (loginUser.getUser() != null && !loginUser.getUser().isAdmin()) {
            loginUser.setPermissions(systemMenuService.getPermissionsByUser(loginUser.getUser()));
            loginUser.setUser(getByUsername(loginUser.getUser().getUsername()));
            tokenService.setLoginUser(loginUser);
        }
    }

    public List<SystemUser> listAllocatedRolesByUser(SystemUser user) {
        return null;
    }

    public List<SystemUser> listUnallocatedRolesByUser(SystemUser user) {
        return null;
    }

}
