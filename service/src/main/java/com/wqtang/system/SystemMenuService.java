package com.wqtang.system;

import com.google.common.collect.Sets;
import com.wqtang.object.po.system.SystemUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Service
public class SystemMenuService {

    @Resource(name = "systemMenuMapper")
    private SystemMenuMapper systemMenuMapper;

    public Set<String> getPermissionsByUser(SystemUser user) {
        Set<String> rolePermissions = Sets.newHashSet();
        if (user.isAdmin()) {
            rolePermissions.add("*:*:*");
        } else {
            rolePermissions.addAll(getPermissionsByUserId(user.getUserId()));
        }
        return rolePermissions;
    }

    private Set<String> getPermissionsByUserId(Long userId) {
        Set<String> permissions = Sets.newHashSet();
        List<String> permsList = systemMenuMapper.listPermissionsByUserId(userId);
        for (String perm : permsList) {
            permissions.addAll(Arrays.asList(perm.split(",")));
        }
        return permissions;
    }

}
