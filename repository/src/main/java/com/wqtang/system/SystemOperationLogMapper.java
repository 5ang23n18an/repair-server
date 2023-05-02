package com.wqtang.system;

import com.wqtang.object.po.system.SystemOperationLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/21
 */
@Mapper
public interface SystemOperationLogMapper {

    List<SystemOperationLog> listByParams(SystemOperationLog operationLog);

    void insert(SystemOperationLog operationLog);

    void batchDeleteByOperIds(Long[] operIds);

    void deleteAll();

}
