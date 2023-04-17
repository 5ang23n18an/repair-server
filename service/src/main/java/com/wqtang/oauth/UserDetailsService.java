package com.wqtang.oauth;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.UserStatus;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.object.po.user.LoginUser;
import com.wqtang.system.SystemMenuService;
import com.wqtang.system.SystemUserMapper;
import com.wqtang.util.ServletUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/4/16
 */
@Component
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserDetailsService.class);

    @Resource(name = "systemUserMapper")
    private SystemUserMapper systemUserMapper;
    @Resource(name = "systemMenuService")
    private SystemMenuService systemMenuService;
    @Lazy
    @Resource(name = "passwordEncoder")
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SystemUser user = systemUserMapper.getByUsername(username);
        if (user == null) {
            LOGGER.info("`UserDetailsService.loadUserByUsername`, find no user by username = {}", username);
            throw new BusinessException(ErrorEnum.USER_NOT_FOUND);
        }
        if (UserStatus.DISABLED.getCode().equals(user.getDelFlag())) {
            LOGGER.info("`UserDetailsService.loadUserByUsername`, user is disabled, username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该用户已被停用");
        }
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag())) {
            LOGGER.info("`UserDetailsService.loadUserByUsername`, user is deleted, username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该用户已被删除");
        }
        String password = ((String) ServletUtils.getHttpServletRequest().getAttribute("password"));
        if (!passwordEncoder.matches(password, user.getPassword())) {
            LOGGER.info("`UserDetailsService.loadUserByUsername`, password doesn't match with username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "用户名或密码错误");
        }
        return new LoginUser(user.getUserId(), user.getDeptId(), user, systemMenuService.getPermissionsByUser(user));
    }

}
