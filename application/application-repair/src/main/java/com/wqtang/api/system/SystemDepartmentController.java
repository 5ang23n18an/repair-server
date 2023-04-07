package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.vo.TreeInfo;
import com.wqtang.object.vo.TreeListInfo;
import com.wqtang.system.SystemDepartmentService;
import com.wqtang.util.SecurityUtils;
import org.apache.commons.lang3.ArrayUtils;
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

    @Resource(name = "systemDepartmentService")
    private SystemDepartmentService systemDepartmentService;

    /**
     * 查询部门列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemDepartment> getPage(SystemDepartment request,
                                              @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                              @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemDepartment> list = systemDepartmentService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 查询部门列表, 但排除指定部门
     *
     * @param deptId
     * @return
     */
    @GetMapping("/list/exclude/{deptId}")
    public List<SystemDepartment> getListExclude(@PathVariable("deptId") Long deptId) {
        List<SystemDepartment> departmentList = systemDepartmentService.listByParams(null);
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
    @GetMapping("/{deptId}")
    public SystemDepartment getById(@PathVariable("deptId") Long deptId) {
        return systemDepartmentService.getById(deptId);
    }

    /**
     * 获取部门列表, 以树状结构展示
     *
     * @param request
     * @return
     */
    @GetMapping("/tree")
    public List<TreeInfo> getTree(SystemDepartment request) {
        List<SystemDepartment> departmentList = systemDepartmentService.listByParams(request);
        systemDepartmentService.refactorAsTree(departmentList);
        return departmentList.stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    @GetMapping("/tree/{roleId}")
    public TreeListInfo deptTreeListInfo(@PathVariable("roleId") Long roleId) {
        List<Long> deptIds = systemDepartmentService.listIdsByRoleId(roleId);
        List<SystemDepartment> departmentList = systemDepartmentService.listByParams(null);
        systemDepartmentService.refactorAsTree(departmentList);
        List<TreeInfo> treeInfo = departmentList.stream().map(TreeInfo::new).collect(Collectors.toList());
        TreeListInfo treeListInfo = new TreeListInfo();
        treeListInfo.setKeys(deptIds);
        treeListInfo.setInfo(treeInfo);
        return treeListInfo;
    }

    @PostMapping("/add")
    public void add(@RequestBody SystemDepartment request) {
        if (systemDepartmentService.isDeptNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门名称已经存在");
        }
        request.setCreateBy(SecurityUtils.getCurrentUsername());
        systemDepartmentService.insert(request);
    }

    @PutMapping("/edit")
    public void edit(@RequestBody SystemDepartment request) {
        if (systemDepartmentService.isDeptNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门名称已经存在");
        }
        if (!request.getDeptId().equals(request.getParentId())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "上级部门不能是自己");
        }
        if (UserConstants.DEPT_DISABLED.equals(request.getStatus())
                && systemDepartmentService.countNormalChildrenDeptById(request.getDeptId()) > 0) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该部门已停用, 但仍包含未停用的子部门");
        }
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        systemDepartmentService.update(request);
    }

    @DeleteMapping("/{deptId}")
    public void delete(@PathVariable("deptId") Long deptId) {
        if (systemDepartmentService.countChildrenDeptById(deptId) > 0) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前部门仍存在下级部门, 不允许删除");
        }
        if (systemDepartmentService.countDeptUserById(deptId) > 0) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "当前部门仍存在用户, 不允许删除");
        }
        systemDepartmentService.deleteById(deptId);
    }

}
