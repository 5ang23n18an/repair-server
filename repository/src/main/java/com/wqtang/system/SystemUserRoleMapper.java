package com.wqtang.system;

import com.wqtang.object.po.system.SystemUserRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemUserRoleMapper {

    boolean existsByRoleId(Long roleId);

    void batchDeleteByRoleIdAndUserIds(@Param("roleId") Long roleId,
                                       @Param("userIds") Long[] userIds);

    void batchInsert(List<SystemUserRole> userRoleList);

}
