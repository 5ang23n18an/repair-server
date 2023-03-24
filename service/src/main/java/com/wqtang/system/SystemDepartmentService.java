package com.wqtang.system;

import com.google.common.collect.Lists;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.vo.request.system.GetSystemDepartmentListRequest;
import com.wqtang.repair.SystemDepartmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;
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

    public int countByParams(SystemDepartment systemDepartment) {
        return systemDepartmentMapper.countByParams(systemDepartment);
    }

    public List<SystemDepartment> pageByParams(GetSystemDepartmentListRequest systemDepartment, int offset, int limit) {
        return systemDepartmentMapper.pageByParams(systemDepartment, offset, limit);
    }

    public List<SystemDepartment> listByParams(SystemDepartment systemDepartment) {
        return systemDepartmentMapper.listByParams(systemDepartment);
    }

    public SystemDepartment getById(Long deptId) {
        return systemDepartmentMapper.getById(deptId);
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
        SystemDepartment info = systemDepartmentMapper.getByDeptNameAndParentId(department.getDeptName(), department.getParentId());
        Long deptId = Optional.of(department.getDeptId()).orElse(-1L);
        return info != null && !deptId.equals(info.getDeptId());
    }

    public void insert(SystemDepartment department) {
        systemDepartmentMapper.insert(department);
    }

    public void update(SystemDepartment department) {
        systemDepartmentMapper.update(department);
    }

    public int countChildrenDeptById(Long deptId) {
        return systemDepartmentMapper.countChildrenDeptById(deptId);
    }

    public int countNormalChildrenDeptById(Long deptId) {
        return systemDepartmentMapper.countNormalChildrenDeptById(deptId);
    }

    public int countDeptUserById(Long deptId) {
        return systemUserMapper.countByDeptIdAndDelFlag(deptId, UserConstants.NORMAL);
    }

    public void deleteById(Long deptId) {
        systemDepartmentMapper.deleteById(deptId);
    }

}
