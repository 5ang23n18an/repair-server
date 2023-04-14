package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.object.po.system.SystemUserRole;
import com.wqtang.system.SystemRoleService;
import com.wqtang.system.SystemUserService;
import com.wqtang.util.SecurityUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@RestController
@RequestMapping("/system/role")
public class SystemRoleController {

    @Resource(name = "systemRoleService")
    private SystemRoleService systemRoleService;
    @Resource(name = "systemUserService")
    private SystemUserService systemUserService;

    @GetMapping("/page")
    public PageInfo<SystemRole> getPage(SystemRole request,
                                        @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemRole> list = systemRoleService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 根据角色id获取详细信息
     *
     * @param roleId
     * @return
     */
    @GetMapping("/{roleId}")
    public SystemRole getById(@PathVariable("roleId") Long roleId) {
        return systemRoleService.getByRoleId(roleId);
    }

    /**
     * 新增角色
     *
     * @param request
     */
    @PostMapping("/add")
    public void add(@RequestBody SystemRole request) {
        if (systemRoleService.isRoleNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色名称已经存在");
        }
        if (systemRoleService.isRoleKeyDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色权限已经存在");
        }
        request.setCreateBy(SecurityUtils.getCurrentUsername());
        systemRoleService.insert(request);
    }

    /**
     * 修改角色
     *
     * @param request
     */
    @PutMapping("/edit")
    public void edit(@RequestBody SystemRole request) {
        checkRoleAllowed(request.getRoleId());
        if (systemRoleService.isRoleNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色名称已经存在");
        }
        if (systemRoleService.isRoleKeyDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色权限已经存在");
        }
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        systemRoleService.update(request);
        // 同步更新缓存中的用户权限
        systemUserService.refreshLoginUserPermissions();
    }

    /**
     * 修改角色状态
     *
     * @param request
     */
    @PutMapping("/modify/status")
    public void modifyStatus(@RequestBody SystemRole request) {
        checkRoleAllowed(request.getRoleId());
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        systemRoleService.updateStatus(request);
    }

    /**
     * 修改角色数据权限
     *
     * @param request
     */
    @PutMapping("/modify/dataScope")
    public void modifyDataScope(@RequestBody SystemRole request) {
        checkRoleAllowed(request.getRoleId());
        systemRoleService.updateDataScope(request);
    }

    /**
     * 根据角色id进行删除, 支持批量删除
     *
     * @param roleIds
     */
    @DeleteMapping("/{roleIds}")
    public void delete(@PathVariable("roleIds") Long[] roleIds) {
        for (Long roleId : roleIds) {
            checkRoleAllowed(roleId);
            if (systemRoleService.countUserRoleByRoleId(roleId) > 0) {
                throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "角色已分配, 不允许删除");
            }
        }
        systemRoleService.deleteByRoleIds(roleIds);
    }

    private void checkRoleAllowed(Long roleId) {
        if (SystemRole.isAdmin(roleId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "不允许操作管理员角色");
        }
    }

    /**
     * 获取角色选择框列表
     *
     * @return
     */
    @GetMapping("/all")
    public List<SystemRole> getAll() {
        return systemRoleService.listByParams(null);
    }

    /**
     * 查询已分配给某个用户的角色(列表)
     *
     * @param user
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/allocatedRoles")
    public PageInfo<SystemUser> getAllocatedRoles(SystemUser user,
                                                  @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                  @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemUser> allocatedRoles = systemUserService.listAllocatedRolesByUser(user);
        return new PageInfo<>(allocatedRoles);
    }

    /**
     * 查询未分配给某个用户的角色(列表)
     *
     * @param user
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/unallocatedRoles")
    public PageInfo<SystemUser> getUnallocatedRoles(SystemUser user,
                                                    @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                    @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemUser> unallocatedRoles = systemUserService.listUnallocatedRolesByUser(user);
        return new PageInfo<>(unallocatedRoles);
    }

    /**
     * 取消用户角色授权, 支持批量userId
     *
     * @param roleId
     * @param userIds
     */
    @PutMapping("/cancelAuth")
    public void batchCancelUserRole(Long roleId, Long[] userIds) {
        systemRoleService.batchDeleteUserRole(roleId, userIds);
    }

    /**
     * 批量授权用户角色, 支持批量userId
     *
     * @param roleId
     * @param userIds
     */
    @PutMapping("/selectAuth")
    public void selectUserRole(Long roleId, Long[] userIds) {
        List<SystemUserRole> list = Lists.newArrayListWithExpectedSize(userIds.length);
        for (Long userId : userIds) {
            SystemUserRole userRole = new SystemUserRole();
            userRole.setRoleId(roleId);
            userRole.setUserId(userId);
            list.add(userRole);
        }
        systemRoleService.batchInsertUserRole(list);
    }

}
