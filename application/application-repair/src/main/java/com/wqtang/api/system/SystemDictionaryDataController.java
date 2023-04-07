package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.po.system.SystemDictionaryData;
import com.wqtang.system.SystemDictionaryDataService;
import com.wqtang.util.JsonUtils;
import com.wqtang.util.RedisUtils;
import com.wqtang.util.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/6
 */
@RestController
@RequestMapping("/system/dictionary/data")
public class SystemDictionaryDataController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemDictionaryDataController.class);

    @Resource(name = "systemDictionaryDataService")
    private SystemDictionaryDataService systemDictionaryDataService;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    /**
     * 获取字典数据列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemDictionaryData> getPage(SystemDictionaryData request,
                                                  @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                  @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemDictionaryData> list = systemDictionaryDataService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 导出字典数据列表
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    public ResponseEntity<byte[]> export(SystemDictionaryData request) {
        LOGGER.info("`SystemDictionaryDataController.export`, request = {}", JsonUtils.getPrettyJson(request));
        try {
            return systemDictionaryDataService.export(request);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `SystemDictionaryDataController.export`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_DOWNLOAD_FAIL);
        }
    }

    /**
     * 根据字典编码查询详细数据
     *
     * @param dictCode
     * @return
     */
    @GetMapping("/{dictCode}")
    public SystemDictionaryData getByDictCode(@PathVariable("dictCode") Long dictCode) {
        return systemDictionaryDataService.getByDictCode(dictCode);
    }

    /**
     * 根据字典类型查询详细数据列表
     *
     * @param dictType
     * @return
     */
    @GetMapping("/list/{dictType}")
    public List<SystemDictionaryData> getListByDictType(@PathVariable("dictType") String dictType) {
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictType);
        List<SystemDictionaryData> cacheList = redisUtils.getAndCast(redisKey, List.class);
        if (cacheList != null) {
            return cacheList;
        }
        SystemDictionaryData dictionaryData = new SystemDictionaryData();
        dictionaryData.setDictType(dictType);
        List<SystemDictionaryData> list = systemDictionaryDataService.listByParams(dictionaryData);
        redisUtils.set(redisKey, list);
        return list;
    }

    /**
     * 新增字典类型
     *
     * @param request
     */
    @PostMapping("/add")
    public void add(@RequestBody SystemDictionaryData request) {
        request.setCreateBy(SecurityUtils.getCurrentUsername());
        systemDictionaryDataService.insert(request);
        refreshCacheByDictType(request.getDictType());
    }

    /**
     * 修改字典类型
     *
     * @param request
     */
    @PutMapping("/edit")
    public void edit(@RequestBody SystemDictionaryData request) {
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        systemDictionaryDataService.update(request);
        refreshCacheByDictType(request.getDictType());
    }

    /**
     * 删除字典类型
     *
     * @param dictCodes
     */
    @DeleteMapping("/{dictCodes}")
    public void delete(@PathVariable("dictCodes") Long[] dictCodes) {
        systemDictionaryDataService.batchDeleteByDictCode(dictCodes);
        for (Long dictCode : dictCodes) {
            SystemDictionaryData dictionaryData = systemDictionaryDataService.getByDictCode(dictCode);
            refreshCacheByDictType(dictionaryData.getDictType());
        }
    }

    private void refreshCacheByDictType(String dictType) {
        SystemDictionaryData dictionaryData = new SystemDictionaryData();
        dictionaryData.setDictType(dictType);
        List<SystemDictionaryData> list = systemDictionaryDataService.listByParams(dictionaryData);
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictType);
        redisUtils.set(redisKey, list);
    }

}
