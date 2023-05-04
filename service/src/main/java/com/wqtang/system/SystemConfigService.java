package com.wqtang.system;

import com.wqtang.AbstractCacheRefresh;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.enumerate.SystemConfigEnum;
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
    private SystemConfigMapper configMapper;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    public SystemConfig getByConfigId(Long configId) {
        return configMapper.getByConfigId(configId);
    }

    public SystemConfig getByConfigKey(String configKey) {
        return configMapper.getByConfigKey(configKey);
    }

    public List<SystemConfig> listAll() {
        return listByParams(null);
    }

    public List<SystemConfig> listByParams(SystemConfig config) {
        return configMapper.listByParams(config);
    }

    public void insert(SystemConfig config) {
        configMapper.insert(config);
    }

    public void update(SystemConfig config) {
        configMapper.update(config);
    }

    public void batchDeleteByConfigIds(Long[] configIds) {
        configMapper.batchDeleteByConfigIds(configIds);
    }

    public boolean isSystemConfigAvailable(SystemConfigEnum configKeyEnum) {
        // 优先从缓存中进行查询
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_CONFIG, configKeyEnum.getConfigKey()),
                redisValue = redisUtils.getAndCast(redisKey, String.class);
        if (redisValue != null) {
            return BooleanUtils.toBoolean(redisValue);
        }
        // 缓存中没有, 则从数据库中进行查询
        SystemConfig config = getByConfigKey(configKeyEnum.getConfigKey());
        return config != null && BooleanUtils.toBoolean(config.getConfigValue());
    }

    @Override
    public void clearCache() {
        Set<String> keys = redisUtils.keysMatchPrefix(RedisKeyEnum.SYSTEM_CONFIG.getPrefix());
        redisUtils.delete(keys);
    }

    @Override
    public void loadIntoCache() {
        List<SystemConfig> list = listAll();
        for (SystemConfig config : list) {
            String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_CONFIG, config.getConfigKey());
            redisUtils.set(redisKey, config.getConfigValue());
        }
    }

}
