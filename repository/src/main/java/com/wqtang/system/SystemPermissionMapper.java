package com.wqtang.system;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemPermissionMapper {

    List<String> listKeyByUserID(Long userID);

}
