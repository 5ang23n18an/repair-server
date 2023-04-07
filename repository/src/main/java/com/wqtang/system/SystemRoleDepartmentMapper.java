package com.wqtang.system;

import com.wqtang.object.po.system.SystemRoleDepartment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/28
 */
@Mapper
public interface SystemRoleDepartmentMapper {

    void batchInsert(List<SystemRoleDepartment> roleDepartments);

    void deleteByRoleId(Long roleId);

    void batchDeleteByRoleIds(Long[] roleIds);

}
