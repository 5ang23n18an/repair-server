package com.wqtang.system;

import com.wqtang.object.po.system.SystemOperationLog;
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
 * @date 2023/4/21
 */
@Service
public class SystemOperationLogService {

    @Resource(name = "systemOperationLogMapper")
    private SystemOperationLogMapper operationLogMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemOperationLog> excelUtils;

    public List<SystemOperationLog> listByParams(SystemOperationLog operationLog) {
        return operationLogMapper.listByParams(operationLog);
    }

    public void insert(SystemOperationLog operationLog) {
        operationLogMapper.insert(operationLog);
    }

    public ResponseEntity<byte[]> export(SystemOperationLog operationLog) throws UnsupportedEncodingException {
        List<SystemOperationLog> list = listByParams(operationLog);
        File file = excelUtils.export(list, "操作日志");
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

    public void batchDeleteByOperIds(Long[] operIds) {
        operationLogMapper.batchDeleteByOperIds(operIds);
    }

    public void deleteAll() {
        operationLogMapper.deleteAll();
    }

}
