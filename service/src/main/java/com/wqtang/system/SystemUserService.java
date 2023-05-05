package com.wqtang.system;

import com.wqtang.oauth.TokenService;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.enumerate.SystemConfigEnum;
import com.wqtang.object.exception.BusinessException;
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
    private SystemMenuService menuService;
    @Resource(name = "systemConfigService")
    private SystemConfigService configService;
    @Resource(name = "systemUserMapper")
    private SystemUserMapper userMapper;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;
    @Resource(name = "emailUtils")
    private EmailUtils emailUtils;
    @Resource(name = "passwordEncoder")
    private PasswordEncoder passwordEncoder;

    public void register(SystemUserLoginRequest request) {
        if (!configService.isSystemConfigAvailable(SystemConfigEnum.REGISTER)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "目前系统没有开放注册功能");
        }
        if (configService.isSystemConfigAvailable(SystemConfigEnum.CAPTCHA)) {
            validateCaptcha(request.getCode(), RedisUtils.getRedisKey(RedisKeyEnum.CAPTCHA, request.getEmail()));
        }
        checkRegisterRequest(request);
        SystemUser user = new SystemUser();
        user.setUsername(request.getUsername());
        user.setNickname(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEmail(request.getEmail());
        userMapper.insert(user);
    }

    private void checkRegisterRequest(SystemUserLoginRequest request) {
        String username = request.getUsername(), password = request.getPassword();
        if (StringUtils.isBlank(username)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "密码不能为空");
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "用户名的长度必须在" + UserConstants.USERNAME_MIN_LENGTH + "到" + UserConstants.USERNAME_MAX_LENGTH + "个字符之间");
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "密码的长度必须在" + UserConstants.PASSWORD_MIN_LENGTH + "到" + UserConstants.PASSWORD_MAX_LENGTH + "个字符之间");
        }
        if (getByUsername(username) != null) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该用户名已存在");
        }
    }

    public String login(SystemUserLoginRequest request) {
        if (StringUtils.isNotEmpty(request.getApp())) {
            // login from app
            if (!"repair".equals(request.getApp())) {
                LOGGER.error("Invalid parameter is received, app = {}", request.getApp());
                throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "非法的APP登录信息，禁止登录");
            }
        } else {
            // login from web
            if (configService.isSystemConfigAvailable(SystemConfigEnum.CAPTCHA)) {
                validateCaptcha(request.getCode(), RedisUtils.getRedisKey(RedisKeyEnum.CAPTCHA, request.getUuid()));
            }
        }
        String token = tokenService.authenticateAndCreateAccessToken(request.getUsername(), request.getPassword());
        recordLoginInfo(SecurityUtils.getCurrentUserId());
        return token;
    }

    private void validateCaptcha(String inputCode, String redisKey) {
        String expectedCode = redisUtils.getAndCast(redisKey, String.class);
        if (expectedCode == null) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "验证码已过期，请重新获取");
        }
        if (!expectedCode.equals(inputCode)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "验证码错误");
        }
        redisUtils.delete(redisKey);
    }

    public SystemUser getByUsername(String username) {
        return userMapper.getByUsername(username);
    }

    public void verifyByEmail(String email) {
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.CAPTCHA, email);
        if (redisUtils.get(redisKey) != null) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "验证码已发送, 请注意查收");
        }
        // 随机生成一个6位的验证码
        String code = RandomCodeUtils.generateRandomDigits();
        // 发送邮件
        String subject = "用户邮箱验证";
        String text = "欢迎使用密码重置服务。您的验证码是：" + code + "，有效期为2分钟。如非本人操作，请检查帐号安全。";
        emailUtils.send(email, subject, text);
        // 在邮件发送成功后, 将该邮箱号以及对应的验证码缓存起来, 并设置好超时时间, 以此作为有效时长
        redisUtils.set(redisKey, code, captchaTimeout, TimeUnit.MINUTES);
    }

    public void modifyPassword(SystemUserModifyPasswordRequest request) {
        SystemUser user = getByUsername(request.getUsername());
        if (user == null) {
            throw new BusinessException(ErrorEnum.USER_NOT_FOUND);
        }
        if (!user.getEmail().equals(request.getEmail())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "请输入注册时填写的邮箱号");
        }
        validateCaptcha(request.getVerificationCode(), RedisUtils.getRedisKey(RedisKeyEnum.CAPTCHA, request.getEmail()));
        userMapper.updatePasswordByUsername(request.getUsername(), passwordEncoder.encode(request.getPassword()));
    }

    private void recordLoginInfo(Long userId) {
        SystemUser user = new SystemUser();
        user.setUserId(userId);
        user.setLoginIp(IPAddressUtils.getIPAddressFromHttpServletRequest());
        user.setLoginDate(Calendar.getInstance().getTime());
        userMapper.update(user);
    }

    public void refreshLoginUserPermissions() {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        if (loginUser.getUser() != null && !loginUser.getUser().isAdmin()) {
            loginUser.setPermissions(menuService.getPermissionsByUser(loginUser.getUser()));
            loginUser.setUser(getByUsername(loginUser.getUser().getUsername()));
            tokenService.setLoginUser(loginUser);
        }
    }

    public List<SystemUser> listAllocatedRolesByUser(SystemUser user) {
        return userMapper.listAllocatedRolesByUser(user);
    }

    public List<SystemUser> listUnallocatedRolesByUser(SystemUser user) {
        return userMapper.listUnallocatedRolesByUser(user);
    }

}
