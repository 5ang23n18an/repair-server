package com.wqtang.system;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemMenu;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Service
public class SystemMenuService {

    @Resource(name = "systemMenuMapper")
    private SystemMenuMapper menuMapper;
    @Resource(name = "systemRoleMapper")
    private SystemRoleMapper roleMapper;
    @Resource(name = "systemRoleMenuMapper")
    private SystemRoleMenuMapper roleMenuMapper;

    public List<SystemMenu> listByUserId(Long userId) {
        return listByParamsAndUserId(null, userId);
    }

    public List<SystemMenu> listByParamsAndUserId(SystemMenu menu, Long userId) {
        return SystemUser.isAdmin(userId) ? menuMapper.listByParams(menu) : menuMapper.listByParamsAndUserId(menu, userId);
    }

    public SystemMenu getByMenuId(Long menuId) {
        return menuMapper.getByMenuId(menuId);
    }

    public void insert(SystemMenu menu) {
        menuMapper.insert(menu);
    }

    public void update(SystemMenu menu) {
        menuMapper.update(menu);
    }

    public void deleteByMenuId(Long menuId) {
        menuMapper.deleteByMenuId(menuId);
    }

    public Set<String> getPermissionsByUser(SystemUser user) {
        if (user.isAdmin()) {
            return Sets.newHashSet("*:*:*");
        }
        Set<String> permissions = Sets.newHashSet();
        List<String> permsList = menuMapper.listPermissionsByUserId(user.getUserId());
        for (String perms : permsList) {
            permissions.addAll(Arrays.asList(perms.split(",")));
        }
        return permissions;
    }

    public List<SystemMenu> buildMenuTree(List<SystemMenu> menuList) {
        List<SystemMenu> treeNodeList = Lists.newArrayList();
        List<Long> idList = menuList.stream().map(SystemMenu::getMenuId).collect(Collectors.toList());
        for (SystemMenu menu : menuList) {
            if (!idList.contains(menu.getParentId())) {
                findAllChildrenRecursively(menuList, menu);
                treeNodeList.add(menu);
            }
        }
        // treeNodeList为空代表当前菜单树的所有节点都是独立的
        return treeNodeList.isEmpty() ? menuList : treeNodeList;
    }

    private void findAllChildrenRecursively(List<SystemMenu> graph, SystemMenu current) {
        List<SystemMenu> children = findAllChildren(graph, current);
        current.setChildren(children);
        if (children.isEmpty()) {
            return;
        }
        for (SystemMenu child : children) {
            findAllChildrenRecursively(graph, child);
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
        SystemMenu menuFromDb = menuMapper.getByMenuNameAndParentId(menu.getMenuName(), menu.getParentId());
        Long menuId = menu.getMenuId() == null ? -1L : menu.getMenuId();
        return menuFromDb != null && !menuId.equals(menuFromDb.getMenuId());
    }

    public boolean existsChildrenMenuByMenuId(Long menuId) {
        return menuMapper.existsByParentId(menuId);
    }

    public boolean existsRoleByMenuId(Long menuId) {
        return roleMenuMapper.existsByMenuId(menuId);
    }

    public List<Long> listMenuIdsByRoleId(Long roleId) {
        SystemRole role = roleMapper.getByRoleId(roleId);
        if (role == null) {
            throw new BusinessException(ErrorEnum.ROLE_NOT_FOUND);
        }
        return menuMapper.listMenuIdByRoleId(roleId, role.isMenuCheckStrictly());
    }

}
