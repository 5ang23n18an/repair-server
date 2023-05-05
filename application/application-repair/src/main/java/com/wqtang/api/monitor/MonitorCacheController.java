package com.wqtang.api.monitor;

import com.google.common.collect.Lists;
import com.wqtang.object.domain.cache.Cache;
import com.wqtang.util.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Properties;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/cache")
public class MonitorCacheController {

    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    @GetMapping
    public Cache getInfo() {
        Cache cache = new Cache();
        Properties info = redisUtils.getDetailedInfo(), commandStatics = redisUtils.getCommandStaticsInfo();
        Long dbSize = redisUtils.getDbSize();
        cache.setInfo(info);
        cache.setDbSize(dbSize);
        Set<String> keys = commandStatics.stringPropertyNames();
        List<Cache.DataNode> dataNodeList = Lists.newArrayListWithExpectedSize(keys.size());
        for (String key : keys) {
            Cache.DataNode dataNode = new Cache.DataNode();
            dataNode.setName(StringUtils.removeStart(key, "cmdstat_"));
            dataNode.setValue(StringUtils.substringBetween(commandStatics.getProperty(key), "calls=", ",usec"));
            dataNodeList.add(dataNode);
        }
        cache.setCommandStaticsInfo(dataNodeList);
        return cache;
    }

}
