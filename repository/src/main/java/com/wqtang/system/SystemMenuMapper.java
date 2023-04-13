package com.wqtang.system;

import com.wqtang.object.po.system.SystemMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Mapper
public interface SystemMenuMapper {

    List<SystemMenu> listByParams(SystemMenu menu);

    SystemMenu getByMenuId(Long menuId);

    void insert(SystemMenu menu);

    void update(SystemMenu menu);

    void deleteByMenuId(Long menuId);

    List<String> listPermissionsByUserId(Long userId);

    List<SystemMenu> listByParamsAndUserId(@Param("menu") SystemMenu menu,
                                           @Param("userId") Long userId);

    SystemMenu getByMenuNameAndParentId(@Param("menuName") String menuName,
                                        @Param("parentId") Long parentId);

    boolean existsByParentId(Long menuId);

    List<Long> listMenuIdByRoleId(@Param("roleId") Long roleId,
                                  @Param("menuCheckStrictly") boolean menuCheckStrictly);

}
