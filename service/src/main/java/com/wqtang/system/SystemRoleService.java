package com.wqtang.system;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.wqtang.object.po.system.*;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
    private SystemRoleMapper roleMapper;
    @Resource(name = "systemRoleMenuMapper")
    private SystemRoleMenuMapper roleMenuMapper;
    @Resource(name = "systemRoleDepartmentMapper")
    private SystemRoleDepartmentMapper roleDepartmentMapper;
    @Resource(name = "systemUserRoleMapper")
    private SystemUserRoleMapper userRoleMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemRole> excelUtils;

    public Set<String> getRolesByUser(SystemUser user) {
        if (user.isAdmin()) {
            return Sets.newHashSet("admin");
        }
        Set<String> roles = Sets.newHashSet();
        List<SystemRole> roleList = roleMapper.listByUserId(user.getUserId());
        for (SystemRole role : roleList) {
            roles.addAll(Arrays.asList(role.getRoleKey().split(",")));
        }
        return roles;
    }

    public List<SystemRole> listAll() {
        return listByParams(null);
    }

    public List<SystemRole> listByParams(SystemRole role) {
        return roleMapper.listByParams(role);
    }

    public ResponseEntity<byte[]> export(SystemRole role) throws UnsupportedEncodingException {
        List<SystemRole> list = listByParams(role);
        File file = excelUtils.export(list, "角色数据");
        byte[] fileBytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public SystemRole getByRoleId(Long roleId) {
        return roleMapper.getByRoleId(roleId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void insert(SystemRole role) {
        roleMapper.insert(role);
        // 新增现在的角色与菜单的关联关系
        insertRoleMenu(role);
    }

    @Transactional(rollbackFor = Exception.class)
    public void update(SystemRole role) {
        roleMapper.update(role);
        // 删除原先的角色与菜单的关联关系
        roleMenuMapper.deleteByRoleId(role.getRoleId());
        // 新增现在的角色与菜单的关联关系
        insertRoleMenu(role);
    }

    private void insertRoleMenu(SystemRole role) {
        List<SystemRoleMenu> list = Lists.newArrayListWithExpectedSize(role.getMenuIds().length);
        for (Long menuId : role.getMenuIds()) {
            SystemRoleMenu roleMenu = new SystemRoleMenu();
            roleMenu.setRoleId(role.getRoleId());
            roleMenu.setMenuId(menuId);
            list.add(roleMenu);
        }
        roleMenuMapper.batchInsert(list);
    }

    public void updateStatus(SystemRole role) {
        roleMapper.update(role);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateDataScope(SystemRole role) {
        roleMapper.update(role);
        // 删除原先的角色与部门的关联关系
        roleDepartmentMapper.deleteByRoleId(role.getRoleId());
        // 新增现在的角色与部门的关联关系
        insertRoleDepartment(role);
    }

    private void insertRoleDepartment(SystemRole role) {
        List<SystemRoleDepartment> list = Lists.newArrayListWithExpectedSize(role.getDeptIds().length);
        for (Long deptId : role.getDeptIds()) {
            SystemRoleDepartment roleDepartment = new SystemRoleDepartment();
            roleDepartment.setRoleId(role.getRoleId());
            roleDepartment.setDeptId(deptId);
            list.add(roleDepartment);
        }
        roleDepartmentMapper.batchInsert(list);
    }

    @Transactional(rollbackFor = Exception.class)
    public void batchDeleteByRoleIds(Long[] roleIds) {
        // 批量删除角色与菜单的关联关系
        roleMenuMapper.batchDeleteByRoleIds(roleIds);
        // 批量删除角色与部门的关联关系
        roleDepartmentMapper.batchDeleteByRoleIds(roleIds);
        roleMapper.batchDeleteByRoleIds(roleIds);
    }

    public boolean existsUserRoleByRoleId(Long roleId) {
        return userRoleMapper.existsByRoleId(roleId);
    }

    public boolean isRoleNameDuplicated(SystemRole role) {
        SystemRole roleFromDb = roleMapper.getByRoleName(role.getRoleName());
        Long roleId = role.getRoleId() == null ? -1L : role.getRoleId();
        return roleFromDb != null && !roleId.equals(roleFromDb.getRoleId());
    }

    public boolean isRoleKeyDuplicated(SystemRole role) {
        SystemRole roleFromDb = roleMapper.getByRoleKey(role.getRoleKey());
        Long roleId = role.getRoleId() == null ? -1L : role.getRoleId();
        return roleFromDb != null && !roleId.equals(roleFromDb.getRoleId());
    }

    public void batchDeleteUserRole(Long roleId, Long[] userIds) {
        userRoleMapper.batchDeleteByRoleIdAndUserIds(roleId, userIds);
    }

    public void batchInsertUserRole(List<SystemUserRole> userRoleList) {
        userRoleMapper.batchInsert(userRoleList);
    }

}
