package com.wqtang.system;

import com.wqtang.object.po.system.SystemUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemUserMapper {

    SystemUser getByUsername(String username);

    void updatePasswordByUsername(String username, String password);

    void updateLoginInfo(SystemUser systemUser);

}
