package com.wqtang.system;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.wqtang.object.po.system.SystemMenu;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Service
public class SystemMenuService {

    @Resource(name = "systemMenuMapper")
    private SystemMenuMapper systemMenuMapper;
    @Resource(name = "systemRoleMapper")
    private SystemRoleMapper systemRoleMapper;
    @Resource(name = "systemRoleMenuMapper")
    private SystemRoleMenuMapper systemRoleMenuMapper;

    public List<SystemMenu> listByUserId(Long userId) {
        return listByParams(null, userId);
    }

    public List<SystemMenu> listByParams(SystemMenu menu, Long userId) {
        return SystemUser.isAdmin(userId) ? systemMenuMapper.listByParams(menu) : systemMenuMapper.listByParamsAndUserId(menu, userId);
    }

    public SystemMenu getByMenuId(Long menuId) {
        return systemMenuMapper.getByMenuId(menuId);
    }

    public void insert(SystemMenu menu) {
        systemMenuMapper.insert(menu);
    }

    public void update(SystemMenu menu) {
        systemMenuMapper.update(menu);
    }

    public void deleteByMenuId(Long menuId) {
        systemMenuMapper.deleteByMenuId(menuId);
    }

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

    public void refactorAsTree(List<SystemMenu> menuList) {
        List<Long> idList = menuList.stream().map(SystemMenu::getMenuId).collect(Collectors.toList());
        for (SystemMenu menu : menuList) {
            if (!idList.contains(menu.getParentId())) {
                findAllChildrenRecursively(menuList, menu);
            }
        }
    }

    private void findAllChildrenRecursively(List<SystemMenu> graph, SystemMenu current) {
        List<SystemMenu> children = findAllChildren(graph, current);
        if (children.isEmpty()) {
            return;
        }
        current.setChildren(children);
        for (SystemMenu node : graph) {
            findAllChildrenRecursively(graph, node);
        }
    }

    private List<SystemMenu> findAllChildren(List<SystemMenu> graph, SystemMenu current) {
        List<SystemMenu> children = Lists.newArrayList();
        for (SystemMenu node : graph) {
            if (current.getMenuId().equals(node.getParentId())) {
                children.add(node);
            }
        }
        return children;
    }

    public boolean isMenuNameDuplicated(SystemMenu menu) {
        SystemMenu menuFromDb = systemMenuMapper.getByMenuNameAndParentId(menu.getMenuName(), menu.getParentId());
        Long menuId = Optional.of(menu.getMenuId()).orElse(-1L);
        return menuFromDb != null && !menuId.equals(menuFromDb.getMenuId());
    }

    public boolean existsChildrenMenuByMenuId(Long menuId) {
        return systemMenuMapper.existsByParentId(menuId);
    }

    public boolean existsRoleByMenuId(Long menuId) {
        return systemRoleMenuMapper.existsByMenuId(menuId);
    }

    public List<Long> listMenuIdsByRoleId(Long roleId) {
        SystemRole role = systemRoleMapper.getByRoleId(roleId);
        return systemMenuMapper.listMenuIdByRoleId(roleId, role.isMenuCheckStrictly());
    }

}
