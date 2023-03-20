package com.wqtang.system;

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
public class SystemPermissionService {

    @Resource(name = "systemPermissionMapper")
    private SystemPermissionMapper systemPermissionMapper;

    public Set<String> getPermissionsByUser(SystemUser user) {
        Set<String> permissions = new HashSet<>();
        if (user.isAdmin()) {
            permissions.add("*:*:*");
        } else {
            permissions.addAll(getPermissionsByUserID(user.getId()));
        }
        return permissions;
    }

    private Set<String> getPermissionsByUserID(Long userID) {
        List<String> permissionKeys = systemPermissionMapper.listKeyByUserID(userID);
        Set<String> permissions = new HashSet<>();
        for (String permissionKey : permissionKeys) {
            permissions.addAll(Arrays.asList(permissionKey.split(",")));
        }
        return permissions;
    }

}
