package com.wqtang.system;

import com.wqtang.AbstractCacheRefresh;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.exception.BusinessException;
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
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Set;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@Service
public class SystemDictionaryTypeService extends AbstractCacheRefresh {

    @Resource(name = "systemDictionaryTypeMapper")
    private SystemDictionaryTypeMapper dictionaryTypeMapper;
    @Resource(name = "systemDictionaryDataMapper")
    private SystemDictionaryDataMapper dictionaryDataMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemDictionaryType> excelUtils;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    public List<SystemDictionaryType> listAll() {
        return listByParams(null);
    }

    public List<SystemDictionaryType> listByParams(SystemDictionaryType dictionaryType) {
        return dictionaryTypeMapper.listByParams(dictionaryType);
    }

    public ResponseEntity<byte[]> export(SystemDictionaryType dictionaryType) {
        List<SystemDictionaryType> list = listByParams(dictionaryType);
        File file = excelUtils.export(list, "字典类型");
        byte[] fileBytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        } catch (UnsupportedEncodingException e) {
            throw new BusinessException(e);
        }
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public SystemDictionaryType getByDictId(Long dictId) {
        return dictionaryTypeMapper.getByDictId(dictId);
    }

    public boolean isDictNameDuplicated(SystemDictionaryType dictionaryType) {
        SystemDictionaryType dictionaryTypeFromDb = dictionaryTypeMapper.getByDictType(dictionaryType.getDictType());
        Long dictId = dictionaryType.getDictId() == null ? -1L : dictionaryType.getDictId();
        return dictionaryTypeFromDb != null && !dictId.equals(dictionaryTypeFromDb.getDictId());
    }

    public void insert(SystemDictionaryType dictionaryType) {
        dictionaryTypeMapper.insert(dictionaryType);
        loadIntoCache(dictionaryType.getDictType());
    }

    public void update(SystemDictionaryType dictionaryType) {
        dictionaryTypeMapper.update(dictionaryType);
        loadIntoCache(dictionaryType.getDictType());
    }

    private void loadIntoCache(String dictType) {
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictType);
        List<SystemDictionaryData> dictDataList = dictionaryDataMapper.listByDictType(dictType);
        redisUtils.set(redisKey, dictDataList);
    }

    public void deleteByDictId(SystemDictionaryType dictionaryType) {
        dictionaryTypeMapper.deleteByDictId(dictionaryType.getDictId());
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.SYSTEM_DICTIONARY, dictionaryType.getDictType());
        redisUtils.delete(redisKey);
    }

    @Override
    public void clearCache() {
        Set<String> keys = redisUtils.keysMatchPrefix(RedisKeyEnum.SYSTEM_DICTIONARY.getPrefix());
        redisUtils.delete(keys);
    }

    @Override
    public void loadIntoCache() {
        for (SystemDictionaryType dictType : listAll()) {
            loadIntoCache(dictType.getDictType());
        }
    }

}
