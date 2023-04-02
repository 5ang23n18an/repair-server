package com.wqtang.repair;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
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

    public void deleteByIds(Long[] ids) {
        repairInfoMapper.deleteByIds(ids);
    }

    public ResponseEntity<byte[]> export(RepairInfo repairInfo) throws Exception {
        List<RepairInfo> list = listByParams(repairInfo);
        File file = excelUtils.export(list, "道岔信息数据");
        byte[] bytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(bytes.length)
                .body(bytes);
    }

    public void importData(MultipartFile file, boolean updateSupport) {
        List<RepairInfo> list;
        try {
            list = excelUtils.resolve(file.getInputStream(), RepairInfo.class);
        } catch (Exception e) {
            throw new BusinessException(ErrorEnum.FILE_READ_FAIL);
        }
        String username = SecurityUtils.getCurrentUsername();
        for (RepairInfo repairInfo : list) {
            RepairInfo repairInfoFromDb = repairInfoMapper.getBySwitchNo(repairInfo.getSwitchNo());
            if (repairInfoFromDb == null) {
                LOGGER.info("`RepairInfoService.importData`, repairInfo will be inserted, switchNo = {}", repairInfo.getSwitchNo());
                repairInfo.setCreateBy(username);
                insert(repairInfo);
            } else if (updateSupport) {
                LOGGER.info("`RepairInfoService.importData`, repairInfo will be updated, switchNo = {}", repairInfo.getSwitchNo());
                repairInfo.setId(repairInfoFromDb.getId());
                repairInfo.setUpdateBy(username);
                update(repairInfo);
            } else {
                LOGGER.info("`RepairInfoService.importData`, repairInfo is already existed and doesn't support update, switchNo = {}", repairInfo.getSwitchNo());
            }
        }
    }

}
