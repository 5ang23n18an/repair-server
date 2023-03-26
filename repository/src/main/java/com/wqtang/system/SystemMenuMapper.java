package com.wqtang.system;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
@Mapper
public interface SystemMenuMapper {

    List<String> listPermissionsByUserId(Long userId);

}
