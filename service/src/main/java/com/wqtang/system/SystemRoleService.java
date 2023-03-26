package com.wqtang.system;

import com.google.common.collect.Sets;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Service
public class SystemRoleService {

    @Resource(name = "systemRoleMapper")
    private SystemRoleMapper systemRoleMapper;

    public Set<String> getRolesByUser(SystemUser user) {
        Set<String> roles = Sets.newHashSet();
        if (user.isAdmin()) {
            roles.add("admin");
        } else {
            roles.addAll(getRolesByUserId(user.getUserId()));
        }
        return roles;
    }

    private Set<String> getRolesByUserId(Long userId) {
        List<SystemRole> roleList = systemRoleMapper.listByUserId(userId);
        Set<String> roles = Sets.newHashSet();
        for (SystemRole systemRole : roleList) {
            roles.addAll(Arrays.asList(systemRole.getRoleKey().split(",")));
        }
        return roles;
    }

}
