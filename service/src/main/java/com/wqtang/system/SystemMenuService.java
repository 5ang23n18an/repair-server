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

    public List<SystemMenu> listByUserId(Long userId) {
        return listByParams(null, userId);
    }

    public List<SystemMenu> listByParams(SystemMenu menu, Long userId) {
        return SystemUser.isAdmin(userId) ? systemMenuMapper.listByParams(menu) : systemMenuMapper.listByUserId(menu, userId);
    }

    public SystemMenu getById(Long menuId) {
        return systemMenuMapper.getById(menuId);
    }

    public void insert(SystemMenu menu) {
        systemMenuMapper.insert(menu);
    }

    public void update(SystemMenu menu) {
        systemMenuMapper.update(menu);
    }

    public void deleteById(Long menuId) {
        systemMenuMapper.deleteById(menuId);
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
        SystemMenu info = systemMenuMapper.getByMenuNameAndParentId(menu.getMenuName(), menu.getParentId());
        Long menuId = Optional.of(menu.getMenuId()).orElse(-1L);
        return info != null && !menuId.equals(info.getMenuId());
    }

    public int countChildrenMenuById(Long menuId) {
        return systemMenuMapper.countChildrenMenuById(menuId);
    }

    public int countRoleById(Long menuId) {
        return systemMenuMapper.countRoleById(menuId);
    }

    public List<Long> listMenuIdsByRoleId(Long roleId) {
        SystemRole role = systemRoleMapper.getByRoleId(roleId);
        return systemMenuMapper.listMenuIdsByRoleId(roleId, role.isMenuCheckStrictly());
    }

}
