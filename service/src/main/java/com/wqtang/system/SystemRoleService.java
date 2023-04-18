package com.wqtang.system;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.wqtang.object.po.system.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Service
public class SystemRoleService {

    @Resource(name = "systemRoleMapper")
    private SystemRoleMapper systemRoleMapper;
    @Resource(name = "systemRoleMenuMapper")
    private SystemRoleMenuMapper systemRoleMenuMapper;
    @Resource(name = "systemRoleDepartmentMapper")
    private SystemRoleDepartmentMapper systemRoleDepartmentMapper;
    @Resource(name = "systemUserRoleMapper")
    private SystemUserRoleMapper systemUserRoleMapper;

    public Set<String> getRolesByUser(SystemUser user) {
        if (user.isAdmin()) {
            return Sets.newHashSet("admin");
        }
        Set<String> roles = Sets.newHashSet();
        List<SystemRole> roleList = systemRoleMapper.listByUserId(user.getUserId());
        for (SystemRole role : roleList) {
            roles.addAll(Arrays.asList(role.getRoleKey().split(",")));
        }
        return roles;
    }

    public List<SystemRole> listByParams(SystemRole role) {
        return systemRoleMapper.listByParams(role);
    }

    public SystemRole getByRoleId(Long roleId) {
        return systemRoleMapper.getByRoleId(roleId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void insert(SystemRole role) {
        systemRoleMapper.insert(role);
        // 新增现在的角色与菜单的关联关系
        insertRoleMenu(role);
    }

    @Transactional(rollbackFor = Exception.class)
    public void update(SystemRole role) {
        systemRoleMapper.update(role);
        // 删除原先的角色与菜单的关联关系
        systemRoleMenuMapper.deleteByRoleId(role.getRoleId());
        // 新增现在的角色与菜单的关联关系
        insertRoleMenu(role);
    }

    public void updateStatus(SystemRole role) {
        systemRoleMapper.update(role);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateDataScope(SystemRole role) {
        systemRoleMapper.update(role);
        // 删除原先的角色与部门的关联关系
        systemRoleDepartmentMapper.deleteByRoleId(role.getRoleId());
        // 新增现在的角色与部门的关联关系
        insertRoleDepartment(role);
    }

    private void insertRoleMenu(SystemRole role) {
        List<SystemRoleMenu> list = Lists.newArrayListWithExpectedSize(role.getMenuIds().length);
        for (Long menuId : role.getMenuIds()) {
            SystemRoleMenu roleMenu = new SystemRoleMenu();
            roleMenu.setRoleId(role.getRoleId());
            roleMenu.setMenuId(menuId);
            list.add(roleMenu);
        }
        systemRoleMenuMapper.batchInsert(list);
    }

    private void insertRoleDepartment(SystemRole role) {
        List<SystemRoleDepartment> list = Lists.newArrayListWithExpectedSize(role.getDeptIds().length);
        for (Long deptId : role.getDeptIds()) {
            SystemRoleDepartment roleDepartment = new SystemRoleDepartment();
            roleDepartment.setRoleId(role.getRoleId());
            roleDepartment.setDeptId(deptId);
            list.add(roleDepartment);
        }
        systemRoleDepartmentMapper.batchInsert(list);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteByRoleIds(Long[] roleIds) {
        // 批量删除角色与菜单的关联关系
        systemRoleMenuMapper.batchDeleteByRoleIds(roleIds);
        // 批量删除角色与部门的关联关系
        systemRoleDepartmentMapper.batchDeleteByRoleIds(roleIds);
        systemRoleMapper.batchDeleteByRoleIds(roleIds);
    }

    public int countUserRoleByRoleId(Long roleId) {
        return systemUserRoleMapper.countByRoleId(roleId);
    }

    public boolean isRoleNameDuplicated(SystemRole role) {
        SystemRole roleFromDb = systemRoleMapper.getByRoleName(role.getRoleName());
        Long roleId = Optional.of(role.getRoleId()).orElse(-1L);
        return roleFromDb != null && !roleId.equals(roleFromDb.getRoleId());
    }

    public boolean isRoleKeyDuplicated(SystemRole role) {
        SystemRole roleFromDb = systemRoleMapper.getByRoleKey(role.getRoleKey());
        Long roleId = Optional.of(role.getRoleId()).orElse(-1L);
        return roleFromDb != null && !roleId.equals(roleFromDb.getRoleId());
    }

    public void batchDeleteUserRole(Long roleId, Long[] userIds) {
        systemUserRoleMapper.batchDeleteByRoleIdAndUserIds(roleId, userIds);
    }

    public void batchInsertUserRole(List<SystemUserRole> userRoleList) {
        systemUserRoleMapper.batchInsert(userRoleList);
    }

}
