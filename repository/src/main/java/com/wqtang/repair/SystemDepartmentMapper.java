package com.wqtang.repair;

import com.wqtang.object.po.system.SystemDepartment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Mapper
public interface SystemDepartmentMapper {

    List<SystemDepartment> listByParams(SystemDepartment department);

    SystemDepartment getById(Long deptId);

    SystemDepartment getByDeptNameAndParentId(@Param("deptName") String deptName,
                                              @Param("parentId") Long parentId);

    void insert(SystemDepartment department);

    void update(SystemDepartment department);

    boolean existsChildrenDeptById(Long deptId);

    boolean existsNormalChildrenDeptById(Long deptId);

    void deleteById(Long deptId);

    List<Long> listIdsByRoleId(@Param("roleId") Long roleId,
                               @Param("deptCheckStrictly") boolean deptCheckStrictly);

}
