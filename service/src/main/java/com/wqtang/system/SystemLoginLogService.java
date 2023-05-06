package com.wqtang.system;

import com.wqtang.object.po.system.SystemLoginLog;
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
 * @date 2023/5/2
 */
@Service
public class SystemLoginLogService {

    @Resource(name = "systemLoginLogMapper")
    private SystemLoginLogMapper loginLogMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemLoginLog> excelUtils;

    public List<SystemLoginLog> listByParams(SystemLoginLog loginLog) {
        return loginLogMapper.listByParams(loginLog);
    }

    public ResponseEntity<byte[]> export(SystemLoginLog loginLog) throws UnsupportedEncodingException {
        List<SystemLoginLog> list = listByParams(loginLog);
        File file = excelUtils.export(list, "登录日志", SystemLoginLog.class);
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

    public void batchDeleteByLogIds(Long[] logIds) {
        loginLogMapper.batchDeleteByLogIds(logIds);
    }

    public void deleteAll() {
        loginLogMapper.deleteAll();
    }

}
