package com.wqtang.system;

import com.wqtang.object.po.system.SystemRoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/28
 */
@Mapper
public interface SystemRoleMenuMapper {

    void batchInsert(List<SystemRoleMenu> roleMenus);

    void deleteByRoleId(Long roleId);

    void batchDeleteByRoleIds(Long[] roleIds);

    boolean existsByMenuId(Long menuId);

}
