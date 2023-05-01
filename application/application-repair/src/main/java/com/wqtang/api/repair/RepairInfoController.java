package com.wqtang.api.repair;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.repair.RepairInfoService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@RestController
@RequestMapping("/repair/info")
public class RepairInfoController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairInfoController.class);

    @Resource(name = "repairInfoService")
    private RepairInfoService repairInfoService;

    /**
     * 根据道岔id获取详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairInfo getById(@PathVariable("id") Long id) {
        return repairInfoService.getById(id);
    }

    /**
     * 查询道岔信息列表
     *
     * @param request
     * @return
     */
    @GetMapping("/page")
    public PageInfo<RepairInfo> getPage(RepairInfo request,
                                        @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<RepairInfo> list = repairInfoService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 新增道岔信息
     *
     * @param request
     * @return
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "道岔信息", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody RepairInfo request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        if (repairInfoService.isSwitchNoDuplicated(request.getSwitchNo())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该道岔编号已经存在");
        }
        repairInfoService.insert(request);
    }

    /**
     * 修改道岔信息
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "道岔信息", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody RepairInfo request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        repairInfoService.update(request);
    }

    /**
     * 删除道岔信息
     *
     * @param ids
     */
    @DeleteMapping("/{ids}")
    @DoAspect(businessType = BusinessType.DELETE)
    @OperationLog(title = "道岔信息", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("ids") Long[] ids) {
        repairInfoService.batchDeleteByIds(ids);
    }

    /**
     * 导出道岔信息列表
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "道岔信息", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(RepairInfo request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        try {
            return repairInfoService.export(request);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_DOWNLOAD_FAIL);
        }
    }

    /**
     * 导入道岔信息
     *
     * @param file
     * @param updateSupport
     */
    @PostMapping("/importData")
    @OperationLog(title = "道岔信息", businessType = BusinessType.IMPORT, operatorType = OperatorType.ADMIN)
    public void importData(MultipartFile file, boolean updateSupport) {
        repairInfoService.importData(file, updateSupport);
    }

}
