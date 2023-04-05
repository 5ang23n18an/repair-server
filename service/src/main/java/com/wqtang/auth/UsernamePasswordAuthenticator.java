package com.wqtang.auth;

import com.google.common.collect.Lists;
import com.wqtang.config.security.SecurityConfig;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.UserStatus;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.system.SystemMenuService;
import com.wqtang.system.SystemUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Component
public class UsernamePasswordAuthenticator implements AuthenticationProvider {

    private static final Logger LOGGER = LoggerFactory.getLogger(UsernamePasswordAuthenticator.class);

    @Resource(name = "systemUserService")
    private SystemUserService systemUserService;
    @Resource(name = "systemMenuService")
    private SystemMenuService systemMenuService;
    @Resource(name = "passwordEncoder")
    private PasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = ((String) authentication.getPrincipal()), password = ((String) authentication.getCredentials());
        SystemUser user = systemUserService.getByUsername(username);
        if (user == null) {
            LOGGER.info("`UsernamePasswordAuthenticator.authenticate`, find no user by username = {}", username);
            throw new BusinessException(ErrorEnum.USER_NOT_FOUND);
        }
        if (UserStatus.DISABLED.getCode().equals(user.getDelFlag())) {
            LOGGER.info("`UsernamePasswordAuthenticator.authenticate`, user is disabled, username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该用户已被停用");
        }
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag())) {
            LOGGER.info("`UsernamePasswordAuthenticator.authenticate`, user is deleted, username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该用户已被删除");
        }
        if (!passwordEncoder.matches(password, user.getPassword())) {
            LOGGER.info("`UsernamePasswordAuthenticator.authenticate`, password is wrong, username = {}", username);
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "用户名或密码错误");
        }
        return new UsernamePasswordAuthenticationToken(username, password, getAuthoritiesByUser(user));
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.equals(authentication);
    }

    private List<GrantedAuthority> getAuthoritiesByUser(SystemUser user) {
        Set<String> permissions = systemMenuService.getPermissionsByUser(user);
        List<GrantedAuthority> authorities = Lists.newArrayListWithExpectedSize(permissions.size());
        for (String permission : permissions) {
            authorities.add(new SimpleGrantedAuthority(SecurityConfig.AUTHORITY_PREFIX + permission));
        }
        return authorities;
    }

}
