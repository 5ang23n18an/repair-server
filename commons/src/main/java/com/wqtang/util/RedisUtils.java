package com.wqtang.util;

import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.exception.BusinessException;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.RedisServerCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Collection;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Component
public class RedisUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(RedisUtils.class);

    @Resource(name = "redisTemplate")
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * Set value
     *
     * @param key
     * @param value
     * @return
     */
    public boolean set(String key, Object value) {
        try {
            redisTemplate.opsForValue().set(key, value);
            return true;
        } catch (Exception e) {
            LOGGER.error("key = {}, value = {}, error message is {}", key, value, e.getMessage(), e);
            return false;
        }
    }

    /**
     * Set value and will expire in specified seconds.
     *
     * @param key
     * @param seconds
     * @return
     */
    public boolean set(String key, Object value, long seconds) {
        return set(key, value, seconds, TimeUnit.SECONDS);
    }

    /**
     * Set value and will expire in specified time.
     *
     * @param key
     * @param timeout
     * @param timeUnit
     * @return
     */
    public boolean set(String key, Object value, long timeout, TimeUnit timeUnit) {
        try {
            if (timeout > 0) {
                redisTemplate.opsForValue().set(key, value, timeout, timeUnit);
            }
            return true;
        } catch (Exception e) {
            LOGGER.error("key = {}, value = {}, timeout = {}, timeUnit = {}, error message is {}", key, value, timeout, timeUnit, e.getMessage(), e);
            return false;
        }
    }

    /**
     * Get value
     *
     * @param key
     * @return
     */
    public Object get(String key) {
        if (key == null) {
            return null;
        }
        try {
            return redisTemplate.opsForValue().get(key);
        } catch (Exception e) {
            LOGGER.error("key = {}, error message is {}", key, e.getMessage(), e);
            throw new BusinessException(e);
        }
    }

    /**
     * Get value and cast to specified type.
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> T getAndCast(String key, Class<T> clazz) {
        if (key == null) {
            return null;
        }
        try {
            Object value = redisTemplate.opsForValue().get(key);
            if (value == null) {
                return null;
            }
            return ((T) value);
        } catch (Exception e) {
            LOGGER.error("key = {}, class = {}, error message is {}", key, clazz.getName(), e.getMessage(), e);
            throw new BusinessException(e);
        }
    }

    /**
     * Get value and convert to specified type in JSON way.
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> T getAndJsonConvert(String key, Class<T> clazz) {
        if (key == null) {
            return null;
        }
        try {
            Object value = redisTemplate.opsForValue().get(key);
            if (value == null) {
                return null;
            }
            String valueStr = value.toString();
            return StringUtils.isBlank(valueStr) ? null : JsonUtils.readValue(valueStr, clazz);
        } catch (Exception e) {
            LOGGER.error("key = {}, class = {}, error message is {}", key, clazz.getName(), e.getMessage(), e);
            throw new BusinessException(e);
        }
    }

    /**
     * Find all keys that match the given prefix.
     *
     * @param prefix
     * @return
     */
    public Set<String> keysMatchPrefix(String prefix) {
        try {
            return redisTemplate.keys(prefix + "*");
        } catch (Exception e) {
            LOGGER.error("prefix = {}, error message is {}", prefix, e.getMessage(), e);
            throw new BusinessException(e);
        }
    }

    /**
     * Find all keys that match the given prefix.
     *
     * @param suffix
     * @return
     */
    public Set<String> keysMatchSuffix(String suffix) {
        try {
            return redisTemplate.keys("*" + suffix);
        } catch (Exception e) {
            LOGGER.error("suffix = {}, error message is {}", suffix, e.getMessage(), e);
            throw new BusinessException(e);
        }
    }

    /**
     * Check if the key exists.
     *
     * @param key
     * @return
     */
    public boolean hasKey(String key) {
        try {
            return Boolean.TRUE.equals(redisTemplate.hasKey(key));
        } catch (Exception e) {
            LOGGER.error("key = {}, error message is {}", key, e.getMessage(), e);
            return false;
        }
    }

    /**
     * Delete key(s).
     *
     * @param keys
     */
    public boolean delete(String... keys) {
        if (keys == null || keys.length == 0) {
            return true;
        }
        return delete(Arrays.asList(keys));
    }

    /**
     * Delete key(s).
     *
     * @param keys
     */
    public boolean delete(Collection<String> keys) {
        if (CollectionUtils.isEmpty(keys)) {
            return true;
        }
        try {
            redisTemplate.delete(keys);
            return true;
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            return false;
        }
    }

    public static String getRedisKey(RedisKeyEnum redisKeyEnum, String key) {
        return redisKeyEnum.getPrefix() + ":" + key;
    }

    /**
     * 获取Redis详细信息
     *
     * @return
     */
    public Properties getDetailedInfo() {
        return redisTemplate.execute((RedisCallback<Properties>) RedisServerCommands::info);
    }

    /**
     * 获取Redis命令统计信息
     *
     * @return
     */
    public Properties getCommandStaticsInfo() {
        return redisTemplate.execute((RedisCallback<Properties>) connection -> connection.info("commandstats"));
    }

    /**
     * 获取Redis中可用key的总量
     *
     * @return
     */
    public Long getDbSize() {
        return redisTemplate.execute(RedisServerCommands::dbSize);
    }

}
