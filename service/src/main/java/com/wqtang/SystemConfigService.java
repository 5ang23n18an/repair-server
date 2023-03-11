package com.wqtang;

import com.wqtang.object.po.system.SystemConfig;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Service
public class SystemConfigService {

    @Resource(name = "systemConfigMapper")
    private SystemConfigMapper systemConfigMapper;

    public boolean isSystemConfigAvailable(String key) {
        SystemConfig systemConfig = systemConfigMapper.selectByKey(key);
        return systemConfig != null && systemConfig.getAvailable();
    }

}
