package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.po.system.SystemDictionaryData;
import com.wqtang.system.SystemDictionaryDataService;
import com.wqtang.util.JsonUtils;
import com.wqtang.util.RedisUtils;
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
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
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
    @OperationLog(title = "字典数据", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemDictionaryData request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        try {
            return systemDictionaryDataService.export(request);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
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
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "字典数据", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemDictionaryData request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        systemDictionaryDataService.insert(request);
        refreshCacheByDictType(request.getDictType());
    }

    /**
     * 修改字典类型
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "字典数据", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemDictionaryData request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        systemDictionaryDataService.update(request);
        refreshCacheByDictType(request.getDictType());
    }

    /**
     * 删除字典类型
     *
     * @param dictCodes
     */
    @DeleteMapping("/{dictCodes}")
    @OperationLog(title = "字典数据", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("dictCodes") Long[] dictCodes) {
        for (Long dictCode : dictCodes) {
            String dictType = systemDictionaryDataService.getByDictCode(dictCode).getDictType();
            systemDictionaryDataService.deleteByDictCode(dictCode);
            refreshCacheByDictType(dictType);
        }
    }

    private void refreshCacheByDictType(String dictType) {
        SystemDictionaryData param = new SystemDictionaryData();
        param.setDictType(dictType);
        param.setStatus(UserConstants.NORMAL);
        List<SystemDictionaryData> list = systemDictionaryDataService.listByParams(param);
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictType);
        redisUtils.set(redisKey, list);
    }

}
