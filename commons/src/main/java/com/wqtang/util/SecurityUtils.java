package com.wqtang.util;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.user.LoginUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
public class SecurityUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(SecurityUtils.class);

    public static void setAuthentication(Authentication authentication) {
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static LoginUser getLoginUser() {
        try {
            return (LoginUser) getAuthentication().getPrincipal();
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `SecurityUtils.getLoginUser`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.UNAUTHORIZED, "Failed to get login user data", "无法获取登录用户的信息");
        }
    }

}