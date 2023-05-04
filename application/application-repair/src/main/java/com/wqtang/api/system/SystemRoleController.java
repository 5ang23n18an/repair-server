package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUser;
import com.wqtang.object.po.system.SystemUserRole;
import com.wqtang.system.SystemRoleService;
import com.wqtang.system.SystemUserService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
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

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemRoleController.class);

    @Resource(name = "systemRoleService")
    private SystemRoleService roleService;
    @Resource(name = "systemUserService")
    private SystemUserService userService;

    /**
     * 获取角色信息列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemRole> getPage(SystemRole request,
                                        @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemRole> list = roleService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 导出角色信息列表
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "角色管理", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemRole request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return roleService.export(request);
    }

    /**
     * 根据角色id获取详细信息
     *
     * @param roleId
     * @return
     */
    @GetMapping("/getInfo")
    public SystemRole getInfo(@RequestParam(required = false, value = "roleId") Long roleId) {
        return roleId == null ? null : roleService.getByRoleId(roleId);
    }

    /**
     * 新增角色
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "角色管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemRole request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        roleService.insert(request);
    }

    /**
     * 修改角色
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "角色管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemRole request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkRoleAllowed(request.getRoleId());
        checkAddEditRequest(request);
        roleService.update(request);
        // 同步更新缓存中的用户权限
        userService.refreshLoginUserPermissions();
    }

    private void checkAddEditRequest(SystemRole request) {
        if (roleService.isRoleNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色名称已经存在");
        }
        if (roleService.isRoleKeyDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该角色权限已经存在");
        }
    }

    /**
     * 修改角色状态
     *
     * @param request
     */
    @PutMapping("/modify/status")
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "角色管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void modifyStatus(@RequestBody SystemRole request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkRoleAllowed(request.getRoleId());
        roleService.updateStatus(request);
    }

    /**
     * 修改角色数据权限
     *
     * @param request
     */
    @PutMapping("/modify/dataScope")
    @OperationLog(title = "角色管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void modifyDataScope(@RequestBody SystemRole request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkRoleAllowed(request.getRoleId());
        roleService.updateDataScope(request);
    }

    /**
     * 根据角色id进行删除, 支持批量删除
     *
     * @param roleIds
     */
    @DeleteMapping
    @OperationLog(title = "角色管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestBody Long[] roleIds) {
        for (Long roleId : roleIds) {
            checkRoleAllowed(roleId);
            if (roleService.existsUserRoleByRoleId(roleId)) {
                throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "角色已分配, 不允许删除");
            }
        }
        roleService.batchDeleteByRoleIds(roleIds);
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
    @GetMapping("/list")
    public List<SystemRole> getList() {
        return roleService.listAll();
    }

    /**
     * 查询已分配给某个用户的角色(列表)
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/allocatedRoles")
    public PageInfo<SystemUser> getAllocatedRoles(SystemUser request,
                                                  @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                  @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemUser> allocatedRoles = userService.listAllocatedRolesByUser(request);
        return new PageInfo<>(allocatedRoles);
    }

    /**
     * 查询未分配给某个用户的角色(列表)
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/unallocatedRoles")
    public PageInfo<SystemUser> getUnallocatedRoles(SystemUser request,
                                                    @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                    @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemUser> unallocatedRoles = userService.listUnallocatedRolesByUser(request);
        return new PageInfo<>(unallocatedRoles);
    }

    /**
     * 批量授权用户角色, 支持批量userId
     *
     * @param roleId
     * @param userIds
     */
    @PutMapping("/selectAuth")
    @OperationLog(title = "角色管理", businessType = BusinessType.GRANT, operatorType = OperatorType.ADMIN)
    public void selectUserRole(Long roleId, Long[] userIds) {
        List<SystemUserRole> list = Lists.newArrayListWithExpectedSize(userIds.length);
        for (Long userId : userIds) {
            SystemUserRole userRole = new SystemUserRole();
            userRole.setRoleId(roleId);
            userRole.setUserId(userId);
            list.add(userRole);
        }
        roleService.batchInsertUserRole(list);
    }

    /**
     * 取消用户角色授权, 支持批量userId
     *
     * @param roleId
     * @param userIds
     */
    @PutMapping("/cancelAuth")
    @OperationLog(title = "角色管理", businessType = BusinessType.GRANT, operatorType = OperatorType.ADMIN)
    public void batchCancelUserRole(Long roleId, Long[] userIds) {
        roleService.batchDeleteUserRole(roleId, userIds);
    }

}
