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

    SystemMenu getById(Long menuId);

    void insert(SystemMenu menu);

    void update(SystemMenu menu);

    void deleteById(Long menuId);

    List<String> listPermissionsByUserId(Long userId);

    List<SystemMenu> listByUserId(@Param("menu") SystemMenu menu,
                                  @Param("userId") Long userId);

    SystemMenu getByMenuNameAndParentId(@Param("menuName") String menuName,
                                        @Param("parentId") Long parentId);

    int countChildrenMenuById(Long menuId);

    int countRoleById(Long menuId);

    List<Long> listMenuIdsByRoleId(@Param("roleId") Long roleId,
                                   @Param("menuCheckStrictly") boolean menuCheckStrictly);

}
