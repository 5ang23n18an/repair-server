package com.wqtang.system;

import com.wqtang.object.po.system.SystemLoginLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@Mapper
public interface SystemLoginLogMapper {

    List<SystemLoginLog> listByParams(SystemLoginLog loginLog);

    void batchDeleteByLogIds(Long[] logIds);

    void deleteAll();

}
