package com.wqtang.api.monitor;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.system.SystemOperationLog;
import com.wqtang.system.SystemOperationLogService;
import com.wqtang.util.JsonUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/operationLog")
public class MonitorOperationLogController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MonitorOperationLogController.class);

    @Resource(name = "systemOperationLogService")
    private SystemOperationLogService operationLogService;

    /**
     * 获取操作日志列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemOperationLog> getPage(SystemOperationLog request,
                                                @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemOperationLog> list = operationLogService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 将操作日志列表以Excel文件形式导出
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "操作日志", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemOperationLog request) throws UnsupportedEncodingException {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return operationLogService.export(request);
    }

    /**
     * 删除系统操作日志, 支持批量删除
     *
     * @param operIds
     */
    @DeleteMapping
    @OperationLog(title = "操作日志", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "operIds") Long[] operIds) {
        if (ArrayUtils.isNotEmpty(operIds)) {
            operationLogService.batchDeleteByOperIds(operIds);
        }
    }

    /**
     * 清空系统操作日志
     */
    @DeleteMapping("/reset")
    @OperationLog(title = "操作日志", businessType = BusinessType.CLEAN, operatorType = OperatorType.ADMIN)
    public void reset() {
        operationLogService.deleteAll();
    }

}
