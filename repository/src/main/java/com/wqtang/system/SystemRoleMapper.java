package com.wqtang.system;

import com.wqtang.object.po.system.SystemRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Mapper
public interface SystemRoleMapper {

    SystemRole getByRoleId(Long roleId);

    List<SystemRole> listByUserId(Long userId);

    List<SystemRole> listByParams(SystemRole role);

    void insert(SystemRole role);

    SystemRole getByRoleName(String roleName);

    SystemRole getByRoleKey(String roleKey);

    void update(SystemRole role);

    void batchDeleteByRoleIds(Long[] roleIds);

}
