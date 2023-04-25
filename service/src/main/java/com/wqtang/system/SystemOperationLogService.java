package com.wqtang.system;

import com.wqtang.object.po.system.SystemOperationLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/4/21
 */
@Service
public class SystemOperationLogService {

    @Resource(name = "systemOperationLogMapper")
    private SystemOperationLogMapper systemOperationLogMapper;

    public void insert(SystemOperationLog operationLog) {
        systemOperationLogMapper.insert(operationLog);
    }

}
