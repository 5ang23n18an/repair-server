package com.wqtang.api.repair;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.repair.RepairTable;
import com.wqtang.repair.RepairTableService;
import com.wqtang.util.JsonUtils;
import com.wqtang.util.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@RestController
@RequestMapping("/repair/table")
public class RepairTableController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairTableController.class);

    @Resource(name = "repairTableService")
    private RepairTableService repairTableService;

    /**
     * 获取检测列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairTable> getList(RepairTable request) {
        return repairTableService.listByParams(request);
    }

    /**
     * 将检测列表导出为Excel文件形式
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    public ResponseEntity<byte[]> export(RepairTable request) {
        LOGGER.info("`RepairTableController.export`, request = {}", JsonUtils.getPrettyJson(request));
        try {
            return repairTableService.export(request);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `RepairTableController.export`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_DOWNLOAD_FAIL);
        }
    }

    /**
     * 获取检测详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairTable getById(@PathVariable("id") Long id) {
        return repairTableService.getById(id);
    }

    /**
     * 新增检测
     *
     * @param request
     */
    @PostMapping
    public void add(@RequestBody RepairTable request) {
        request.setCreateBy(SecurityUtils.getCurrentUsername());
        repairTableService.insert(request);
    }

    /**
     * 修改检测
     *
     * @param request
     */
    @PutMapping
    public void edit(@RequestBody RepairTable request) {
        request.setUpdateBy(SecurityUtils.getCurrentUsername());
        repairTableService.update(request);
    }

    /**
     * 删除检测
     *
     * @param ids
     */
    @DeleteMapping("/{ids}")
    public void delete(@PathVariable("ids") Long[] ids) {
        repairTableService.batchDeleteByIds(ids);
    }

}
