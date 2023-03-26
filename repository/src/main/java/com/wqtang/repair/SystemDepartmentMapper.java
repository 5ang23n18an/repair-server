package com.wqtang.repair;

import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.vo.request.system.GetSystemDepartmentListRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Mapper
public interface SystemDepartmentMapper {

    List<SystemDepartment> pageByParams(@Param("request") GetSystemDepartmentListRequest request,
                                        @Param("offset") int offset,
                                        @Param("limit") int limit);

    int countByParams(SystemDepartment department);

    List<SystemDepartment> listByParams(SystemDepartment department);

    SystemDepartment getById(Long deptId);

    SystemDepartment getByDeptNameAndParentId(@Param("deptName") String deptName,
                                              @Param("parentId") Long parentId);

    void insert(SystemDepartment department);

    void update(SystemDepartment department);

    int countChildrenDeptById(Long deptId);

    int countNormalChildrenDeptById(Long deptId);

    void deleteById(Long deptId);

    List<Long> listIdsByRoleId(@Param("role") SystemRole role,
                               @Param("deptCheckStrictly") boolean deptCheckStrictly);

}
