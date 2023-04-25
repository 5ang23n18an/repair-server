package com.wqtang.system;

import com.google.common.collect.Lists;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.repair.SystemDepartmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Service
public class SystemDepartmentService {

    @Resource(name = "systemDepartmentMapper")
    private SystemDepartmentMapper systemDepartmentMapper;
    @Resource(name = "systemUserMapper")
    private SystemUserMapper systemUserMapper;
    @Resource(name = "systemRoleMapper")
    private SystemRoleMapper systemRoleMapper;

    public List<SystemDepartment> listAll() {
        return listByParams(null);
    }

    public List<SystemDepartment> listByParams(SystemDepartment department) {
        return systemDepartmentMapper.listByParams(department);
    }

    public SystemDepartment getByDeptId(Long deptId) {
        return systemDepartmentMapper.getByDeptId(deptId);
    }

    public void refactorAsTree(List<SystemDepartment> departmentList) {
        List<Long> idList = departmentList.stream().map(SystemDepartment::getDeptId).collect(Collectors.toList());
        for (SystemDepartment department : departmentList) {
            // 如果是顶级节点, 搜寻该节点的所有子节点, 封装在children字段中
            if (!idList.contains(department.getParentId())) {
                findAllChildrenRecursively(departmentList, department);
            }
        }
    }

    private void findAllChildrenRecursively(List<SystemDepartment> graph, SystemDepartment current) {
        List<SystemDepartment> children = findAllChildren(graph, current);
        if (children.isEmpty()) {
            return;
        }
        current.setChildren(children);
        for (SystemDepartment node : graph) {
            findAllChildrenRecursively(graph, node);
        }
    }

    private List<SystemDepartment> findAllChildren(List<SystemDepartment> graph, SystemDepartment current) {
        List<SystemDepartment> children = Lists.newArrayList();
        for (SystemDepartment node : graph) {
            if (current.getDeptId().equals(node.getParentId())) {
                children.add(node);
            }
        }
        return children;
    }

    public boolean isDeptNameDuplicated(SystemDepartment department) {
        SystemDepartment departmentFromDb = systemDepartmentMapper.getByDeptNameAndParentId(department.getDeptName(), department.getParentId());
        Long deptId = department.getDeptId() == null ? -1L : department.getDeptId();
        return departmentFromDb != null && !deptId.equals(departmentFromDb.getDeptId());
    }

    public void insert(SystemDepartment department) {
        systemDepartmentMapper.insert(department);
    }

    public void update(SystemDepartment department) {
        systemDepartmentMapper.update(department);
    }

    public boolean existsChildrenDeptById(Long deptId) {
        return systemDepartmentMapper.existsChildrenDeptById(deptId);
    }

    public boolean existsNormalChildrenDeptById(Long deptId) {
        return systemDepartmentMapper.existsNormalChildrenDeptById(deptId);
    }

    public boolean existsDeptUserById(Long deptId) {
        return systemUserMapper.existsByDeptIdAndDelFlag(deptId, UserConstants.NORMAL);
    }

    public void deleteById(Long deptId) {
        systemDepartmentMapper.deleteById(deptId);
    }

    public List<Long> listDeptIdByRoleId(Long roleId) {
        SystemRole role = systemRoleMapper.getByRoleId(roleId);
        return systemDepartmentMapper.listDeptIdByRoleId(roleId, role.isDeptCheckStrictly());
    }

}
