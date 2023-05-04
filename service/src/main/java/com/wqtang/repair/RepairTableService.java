package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairTable;
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
 * @date 2023/4/14
 */
@Service
public class RepairTableService {

    @Resource(name = "repairTableMapper")
    private RepairTableMapper repairTableMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<RepairTable> excelUtils;

    public List<RepairTable> listByParams(RepairTable repairTable) {
        return repairTableMapper.listByParams(repairTable);
    }

    public ResponseEntity<byte[]> export(RepairTable repairTable) throws UnsupportedEncodingException {
        List<RepairTable> list = listByParams(repairTable);
        File file = excelUtils.export(list, "检测数据");
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

    public RepairTable getById(Long id) {
        return repairTableMapper.getById(id);
    }

    public void insert(RepairTable repairTable) {
        repairTableMapper.insert(repairTable);
    }

    public void update(RepairTable repairTable) {
        repairTableMapper.update(repairTable);
    }

    public void batchDeleteByIds(Long[] ids) {
        repairTableMapper.batchDeleteByIds(ids);
    }

}
