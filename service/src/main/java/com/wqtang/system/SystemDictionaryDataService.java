package com.wqtang.system;

import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemDictionaryData;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
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

/**
 * @author Wenqian Tang
 * @date 2023/4/6
 */
@Service
public class SystemDictionaryDataService {

    @Resource(name = "systemDictionaryDataMapper")
    private SystemDictionaryDataMapper systemDictionaryDataMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemDictionaryData> excelUtils;

    public List<SystemDictionaryData> listByParams(SystemDictionaryData dictionaryData) {
        return systemDictionaryDataMapper.listByParams(dictionaryData);
    }

    public ResponseEntity<byte[]> export(SystemDictionaryData dictionaryData) {
        List<SystemDictionaryData> list = listByParams(dictionaryData);
        File file = excelUtils.export(list, "字典数据");
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

    public SystemDictionaryData getByDictCode(Long dictCode) {
        return systemDictionaryDataMapper.getByDictCode(dictCode);
    }

    public void insert(SystemDictionaryData dictionaryData) {
        systemDictionaryDataMapper.insert(dictionaryData);
    }

    public void update(SystemDictionaryData dictionaryData) {
        systemDictionaryDataMapper.update(dictionaryData);
    }

    public void deleteByDictCode(Long dictCode) {
        systemDictionaryDataMapper.deleteByDictCode(dictCode);
    }

    public boolean existsByDictType(String dictType) {
        return systemDictionaryDataMapper.existsByDictType(dictType);
    }

}
