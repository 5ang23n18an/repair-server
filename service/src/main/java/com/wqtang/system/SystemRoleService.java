package com.wqtang.system;

import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Service
public class SystemRoleService {

    @Resource(name = "systemUserRoleMapper")
    private SystemUserRoleMapper systemUserRoleMapper;

    public Set<String> getRolesByUser(SystemUser user) {
        Set<String> roles = new HashSet<>();
        if (user.isAdmin()) {
            roles.add("admin");
        } else {
            roles.addAll(getRolesByUserId(user.getId()));
        }
        return roles;
    }

    private Set<String> getRolesByUserId(Long userId) {
        List<SystemRole> roleList = systemUserRoleMapper.listByUserId(userId);
        Set<String> roles = new HashSet<>();
        for (SystemRole systemRole : roleList) {
            roles.addAll(Arrays.asList(systemRole.getKey().split(",")));
        }
        return roles;
    }

}
