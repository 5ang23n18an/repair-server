package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
import com.wqtang.util.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@Service
public class RepairInfoService {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairInfoService.class);

    @Resource(name = "repairInfoMapper")
    private RepairInfoMapper repairInfoMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<RepairInfo> excelUtils;

    public RepairInfo getById(Long id) {
        return repairInfoMapper.getById(id);
    }

    public List<RepairInfo> listByParams(RepairInfo repairInfo) {
        return repairInfoMapper.listByParams(repairInfo);
    }

    public void insert(RepairInfo repairInfo) {
        repairInfoMapper.insert(repairInfo);
    }

    public void update(RepairInfo repairInfo) {
        repairInfoMapper.update(repairInfo);
    }

    public void batchDeleteByIds(Long[] ids) {
        repairInfoMapper.batchDeleteByIds(ids);
    }

    public ResponseEntity<byte[]> export(RepairInfo repairInfo) throws UnsupportedEncodingException {
        List<RepairInfo> list = listByParams(repairInfo);
        File file = excelUtils.export(list, "道岔信息数据");
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

    public void importData(MultipartFile file, boolean updateSupport) throws IOException {
        List<RepairInfo> list = excelUtils.resolve(file.getInputStream(), RepairInfo.class);
        for (RepairInfo repairInfo : list) {
            RepairInfo repairInfoFromDb = getBySwitchNo(repairInfo.getSwitchNo());
            if (repairInfoFromDb == null) {
                LOGGER.info("repairInfo will be inserted, switchNo = {}", repairInfo.getSwitchNo());
                repairInfo.setCreateBy(SecurityUtils.getCurrentUsername());
                insert(repairInfo);
                continue;
            }
            if (!updateSupport) {
                LOGGER.info("repairInfo is already existed and doesn't support update, switchNo = {}", repairInfo.getSwitchNo());
                continue;
            }
            LOGGER.info("repairInfo will be updated, switchNo = {}", repairInfo.getSwitchNo());
            repairInfo.setId(repairInfoFromDb.getId());
            repairInfo.setUpdateBy(SecurityUtils.getCurrentUsername());
            update(repairInfo);
        }
    }

    public RepairInfo getBySwitchNo(String switchNo) {
        return repairInfoMapper.getBySwitchNo(switchNo);
    }

    public boolean isSwitchNoDuplicated(String switchNo) {
        return getBySwitchNo(switchNo) != null;
    }

}
