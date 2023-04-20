package com.wqtang.system;

import com.wqtang.AbstractCacheRefresh;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.enumerate.SystemConfigKeyEnum;
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

    public SystemConfig getByConfigKey(String key) {
        return systemConfigMapper.getByConfigKey(key);
    }

    public List<SystemConfig> listAll() {
        return listByParams(null);
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

    public void batchDeleteByIds(Long[] ids) {
        systemConfigMapper.batchDeleteByIds(ids);
    }

    public boolean isSystemConfigAvailable(SystemConfigKeyEnum configKeyEnum) {
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
