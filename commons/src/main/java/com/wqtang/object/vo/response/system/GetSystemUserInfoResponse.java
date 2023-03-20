package com.wqtang.object.vo.response.system;

import com.wqtang.object.po.system.SystemUser;

import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
public class GetSystemUserInfoResponse {

    private SystemUser user;
    private Set<String> roles;
    private Set<String> permissions;

    public SystemUser getUser() {
        return user;
    }

    public void setUser(SystemUser user) {
        this.user = user;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    public Set<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<String> permissions) {
        this.permissions = permissions;
    }

}
