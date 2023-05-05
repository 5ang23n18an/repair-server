package com.wqtang.util;

import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemUser;
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
            return ((LoginUser) getAuthentication().getPrincipal());
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.UNAUTHORIZED, "无法获取登录用户的信息");
        }
    }

    public static Long getCurrentUserId() {
        return getLoginUser().getUserId();
    }

    public static String getCurrentUsername() {
        return getLoginUser().getUsername();
    }

    public static SystemUser getCurrentUser() {
        return getLoginUser().getUser();
    }

}
