package com.wqtang;

/**
 * @author Wenqian Tang
 * @date 2023/3/13
 */
public abstract class AbstractCacheRefresh {

    /**
     * 刷新缓存数据, 策略是: 先清空, 后写入
     */
    public void refreshCache() {
        clearCache();
        loadIntoCache();
    }

    /**
     * 清空缓存数据
     */
    public abstract void clearCache();

    /**
     * 写入缓存数据
     */
    public abstract void loadIntoCache();

}
