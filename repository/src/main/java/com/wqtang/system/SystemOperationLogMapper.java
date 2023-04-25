package com.wqtang.system;

import com.wqtang.object.po.system.SystemOperationLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/4/21
 */
@Mapper
public interface SystemOperationLogMapper {

    void insert(SystemOperationLog operationLog);

}
