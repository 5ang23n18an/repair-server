package com.wqtang.system;

import com.wqtang.object.po.system.SystemRole;
import com.wqtang.object.po.system.SystemUserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemUserRoleMapper {

    List<SystemRole> listByUserId(Long userId);

    int countByRoleId(Long roleId);

    void batchDeleteByRoleIdAndUserIds(Long roleId, Long[] userIds);

    void batchInsert(List<SystemUserRole> userRoleList);

}
