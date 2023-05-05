package com.wqtang.api.repair;

import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.repair.RepairTable;
import com.wqtang.repair.RepairTableService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
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
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return repairTableService.listByParams(request);
    }

    /**
     * 将检测列表导出为Excel文件形式
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "检测", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(RepairTable request) throws UnsupportedEncodingException {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return repairTableService.export(request);
    }

    /**
     * 获取检测详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/getInfo")
    public RepairTable getInfo(@RequestParam(required = false, value = "id") Long id) {
        return repairTableService.getById(id);
    }

    /**
     * 新增检测
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "检测", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody RepairTable request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        repairTableService.insert(request);
    }

    /**
     * 修改检测
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "检测", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody RepairTable request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        repairTableService.update(request);
    }

    /**
     * 删除检测
     *
     * @param ids
     */
    @DeleteMapping
    @OperationLog(title = "检测", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "ids") Long[] ids) {
        repairTableService.batchDeleteByIds(ids);
    }

}
