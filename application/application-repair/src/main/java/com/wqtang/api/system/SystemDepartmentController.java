package com.wqtang.api.system;

import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.vo.TreeInfo;
import com.wqtang.object.vo.TreeListInfo;
import com.wqtang.system.SystemDepartmentService;
import com.wqtang.util.JsonUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@RestController
@RequestMapping("/system/department")
public class SystemDepartmentController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemDepartmentController.class);

    @Resource(name = "systemDepartmentService")
    private SystemDepartmentService departmentService;

    /**
     * 查询部门列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<SystemDepartment> getList(SystemDepartment request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return departmentService.listByParams(request);
    }

    /**
     * 查询部门列表, 但排除指定部门
     *
     * @param deptId
     * @return
     */
    @GetMapping("/list/exclude/{deptId}")
    public List<SystemDepartment> getListExclude(@PathVariable("deptId") Long deptId) {
        List<SystemDepartment> departmentList = departmentService.listAll();
        for (Iterator<SystemDepartment> iterator = departmentList.iterator(); iterator.hasNext(); ) {
            SystemDepartment department = iterator.next();
            boolean match = department.getDeptId().equals(deptId)
                    || ArrayUtils.contains(department.getAncestors().split(","), deptId.toString());
            if (match) {
                iterator.remove();
            }
        }
        return departmentList;
    }

    /**
     * 根据部门id, 获取部门详细信息
     *
     * @param deptId
     * @return
     */
    @GetMapping("/getInfo")
    public SystemDepartment getInfo(@RequestParam(required = false, value = "deptId") Long deptId) {
        return deptId == null ? null : departmentService.getByDeptId(deptId);
    }

    /**
     * 获取部门列表, 以树状结构展示
     *
     * @param request
     * @return
     */
    @GetMapping("/tree")
    public List<TreeInfo> getTree(SystemDepartment request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        List<SystemDepartment> departmentList = departmentService.listByParams(request);
        departmentService.refactorAsTree(departmentList);
        return departmentList.stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    /**
     * 加载对应角色的部门列表树
     *
     * @param roleId
     * @return
     */
    @GetMapping("/tree/{roleId}")
    public TreeListInfo deptTreeListInfo(@PathVariable("roleId") Long roleId) {
        List<SystemDepartment> departmentList = departmentService.listAll();
        departmentService.refactorAsTree(departmentList);
        List<TreeInfo> treeInfo = departmentList.stream().map(TreeInfo::new).collect(Collectors.toList());
        TreeListInfo treeListInfo = new TreeListInfo();
        List<Long> deptIdList = departmentService.listDeptIdByRoleId(roleId);
        treeListInfo.setKeys(deptIdList);
        treeListInfo.setInfo(treeInfo);
        return treeListInfo;
    }

    /**
     * 新增部门
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "部门管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemDepartment request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        if (departmentService.isDeptNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门名称已经存在");
        }
        departmentService.insert(request);
    }

    /**
     * 修改部门
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "部门管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemDepartment request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        if (departmentService.isDeptNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门名称已经存在");
        }
        if (request.getDeptId().equals(request.getParentId())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "上级部门不能是自己");
        }
        if (UserConstants.DISABLED.equals(request.getStatus())
                && departmentService.existsNormalChildrenDeptById(request.getDeptId())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门仍包含未停用的子部门, 无法停用");
        }
        departmentService.update(request);
    }

    /**
     * 删除部门, 可批量删除
     *
     * @param deptId
     */
    @DeleteMapping
    @OperationLog(title = "部门管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestBody Long deptId) {
        if (departmentService.existsChildrenDeptById(deptId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前部门仍存在下级部门, 不允许删除");
        }
        if (departmentService.existsDeptUserById(deptId)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前部门仍存在用户, 不允许删除");
        }
        departmentService.deleteById(deptId);
    }

}
