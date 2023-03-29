package com.wqtang.system;

import com.wqtang.AbstractCacheRefresh;
import com.wqtang.config.redis.RedisConfig;
import com.wqtang.object.po.system.SystemConfig;
import com.wqtang.util.RedisUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Service
public class SystemConfigService extends AbstractCacheRefresh {

    @Resource(name = "systemConfigMapper")
    private SystemConfigMapper systemConfigMapper;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    public SystemConfig getById(Long id) {
        return systemConfigMapper.getById(id);
    }

    public SystemConfig getByKey(String key) {
        return systemConfigMapper.getByKey(key);
    }

    public List<SystemConfig> listByParams(SystemConfig config) {
        return systemConfigMapper.listByParams(config);
    }

    public void insert(SystemConfig request) {
        systemConfigMapper.insert(request);
    }

    public void update(SystemConfig request) {
        systemConfigMapper.update(request);
    }

    public void deleteByIds(Long[] ids) {
        systemConfigMapper.deleteByIds(ids);
    }

    public boolean isSystemConfigAvailable(String key) {
        SystemConfig systemConfig = getByKey(key);
        return systemConfig != null && BooleanUtils.toBoolean(systemConfig.getConfigValue());
    }

    @Override
    public void clearCache() {
        Set<String> keys = redisUtils.keysMatchPrefix(RedisConfig.KEY_SYSTEM_CONFIG_PREFIX);
        redisUtils.delete(keys);
    }

    @Override
    public void loadIntoCache() {
        List<SystemConfig> list = systemConfigMapper.listByParams(null);
        for (SystemConfig systemConfig : list) {
            redisUtils.set(systemConfig.getConfigKey(), systemConfig.getConfigValue());
        }
    }
}
