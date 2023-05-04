package com.wqtang.api.monitor;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.system.SystemLoginLog;
import com.wqtang.system.SystemLoginLogService;
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
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/loginLog")
public class MonitorLoginLogController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MonitorLoginLogController.class);

    @Resource(name = "systemLoginLogService")
    private SystemLoginLogService loginLogService;

    /**
     * 获取登录日志列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemLoginLog> getPage(SystemLoginLog request,
                                            @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                            @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemLoginLog> list = loginLogService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 将登录日志列表以Excel文件形式导出
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "登录日志", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemLoginLog request) throws UnsupportedEncodingException {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return loginLogService.export(request);
    }

    /**
     * 删除系统登录日志, 支持批量删除
     *
     * @param logIds
     */
    @DeleteMapping("/{logIds}")
    @OperationLog(title = "登录日志", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("logIds") Long[] logIds) {
        loginLogService.batchDeleteByLogIds(logIds);
    }

    /**
     * 清空系统登录日志
     */
    @DeleteMapping("/reset")
    @OperationLog(title = "登录日志", businessType = BusinessType.CLEAN, operatorType = OperatorType.ADMIN)
    public void reset() {
        loginLogService.deleteAll();
    }

}
