package com.wqtang.system;

import com.wqtang.object.po.system.SystemRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemUserRoleMapper {

    List<SystemRole> listByUserID(Long userID);

}
