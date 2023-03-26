package com.wqtang.api.system;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.object.vo.request.system.SystemUserLoginRequest;
import com.wqtang.object.vo.request.system.SystemUserModifyPasswordRequest;
import com.wqtang.object.vo.response.system.GetSystemUserInfoResponse;
import com.wqtang.system.SystemMenuService;
import com.wqtang.system.SystemRoleService;
import com.wqtang.system.SystemUserService;
import com.wqtang.util.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@RestController
@RequestMapping("/system/user")
public class SystemUserController {

    @Resource(name = "systemUserService")
    private SystemUserService systemUserService;
    @Resource(name = "systemRoleService")
    private SystemRoleService systemRoleService;
    @Resource(name = "systemMenuService")
    private SystemMenuService systemMenuService;

    /**
     * 后台用户的登录方法
     *
     * @param request
     * @return access_token
     */
    @PostMapping("/login")
    public String login(@RequestBody SystemUserLoginRequest request) {
        return systemUserService.login(request);
    }

    /**
     * 获取当前用户信息
     *
     * @return
     */
    @GetMapping("/getInfo")
    public GetSystemUserInfoResponse getInfo() {
        SystemUser user = SecurityUtils.getLoginUser().getUser();
        Set<String> roles = systemRoleService.getRolesByUser(user);
        Set<String> permissions = systemMenuService.getPermissionsByUser(user);
        GetSystemUserInfoResponse response = new GetSystemUserInfoResponse();
        response.setUser(user);
        response.setRoles(roles);
        response.setPermissions(permissions);
        return response;
    }

    /**
     * 根据用户名获取邮箱
     *
     * @param username
     * @return
     */
    @GetMapping("/getEmail/{username}")
    public String getEmail(@PathVariable("username") String username) {
        SystemUser user = systemUserService.getByUsername(username);
        if (user == null) {
            throw new BusinessException(ErrorEnum.USER_NOT_FOUND);
        }
        String email = user.getEmail();
        if (StringUtils.isEmpty(email)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "The current user is not bound to any emails, please contact the administrator for help", "当前用户暂未绑定邮箱, 请联系管理员寻求帮助");
        }
        return email;
    }

    /**
     * 根据邮箱进行身份验证.
     * <p>场景:</p>
     * <p>1. 忘记密码</p>
     *
     * @param email
     * @return
     */
    @PostMapping("/emailVerification")
    public void emailVerification(String email) {
        systemUserService.emailVerification(email);
    }

    /**
     * 实现"修改密码"
     *
     * @param request
     * @return
     */
    @PostMapping("/modifyPassword")
    public void modifyPassword(@RequestBody SystemUserModifyPasswordRequest request) {
        systemUserService.modifyPassword(request);
    }

}
