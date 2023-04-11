package com.wqtang.system;

import com.wqtang.object.po.system.SystemUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Mapper
public interface SystemUserMapper {

    SystemUser getByUsername(String username);

    void updatePasswordByUsername(@Param("username") String username,
                                  @Param("password") String password);

    void updateLoginInfo(SystemUser user);

    boolean existsByDeptIdAndDelFlag(@Param("deptId") Long deptId,
                                     @Param("delFlag") String delFlag);

    List<SystemUser> listAllocatedRolesByUser(SystemUser user);

    List<SystemUser> listUnallocatedRolesByUser(SystemUser user);

    void insert(SystemUser user);

}
