package com.wqtang.system;

import com.wqtang.AbstractCacheRefresh;
import com.wqtang.object.constant.UserConstants;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.po.system.SystemDictionaryData;
import com.wqtang.object.po.system.SystemDictionaryType;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
import com.wqtang.util.RedisUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@Service
public class SystemDictionaryTypeService extends AbstractCacheRefresh {

    @Resource(name = "systemDictionaryTypeMapper")
    private SystemDictionaryTypeMapper systemDictionaryTypeMapper;
    @Resource(name = "systemDictionaryDataMapper")
    private SystemDictionaryDataMapper systemDictionaryDataMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemDictionaryType> excelUtils;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    public List<SystemDictionaryType> listByParams(SystemDictionaryType dictionaryType) {
        return systemDictionaryTypeMapper.listByParams(dictionaryType);
    }

    public ResponseEntity<byte[]> export(SystemDictionaryType dictionaryType) throws Exception {
        List<SystemDictionaryType> list = listByParams(dictionaryType);
        File file = excelUtils.export(list, "字典类型");
        byte[] fileBytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public SystemDictionaryType getByDictId(Long dictId) {
        return systemDictionaryTypeMapper.getByDictId(dictId);
    }

    public boolean isDictNameDuplicated(SystemDictionaryType dictionaryType) {
        SystemDictionaryType dictionaryTypeFromDb = systemDictionaryTypeMapper.getByDictType(dictionaryType.getDictType());
        Long dictId = Optional.of(dictionaryType.getDictId()).orElse(-1L);
        return dictionaryTypeFromDb != null && !dictId.equals(dictionaryTypeFromDb.getDictId());
    }

    public void insert(SystemDictionaryType dictionaryType) {
        systemDictionaryTypeMapper.insert(dictionaryType);
    }

    public void update(SystemDictionaryType dictionaryType) {
        systemDictionaryTypeMapper.update(dictionaryType);
    }

    public boolean existsByDictType(String dictType) {
        return systemDictionaryTypeMapper.existsByDictType(dictType);
    }

    public void batchDeleteByDictIds(Long[] dictIds) {
        systemDictionaryTypeMapper.batchDeleteByDictIds(dictIds);
    }

    @Override
    public void clearCache() {
        Set<String> keys = redisUtils.keysMatchPrefix(RedisKeyEnum.SYSTEM_DICTIONARY.getPrefix());
        redisUtils.delete(keys);
    }

    @Override
    public void loadIntoCache() {
        List<SystemDictionaryType> dictTypeList = listByParams(null);
        for (SystemDictionaryType dictType : dictTypeList) {
            SystemDictionaryData param = new SystemDictionaryData();
            param.setStatus(UserConstants.NORMAL);
            param.setDictType(dictType.getDictType());
            List<SystemDictionaryData> dictDataList = systemDictionaryDataMapper.listByParams(param);
            String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictType.getDictType());
            redisUtils.set(redisKey, dictDataList);
        }
    }

}
