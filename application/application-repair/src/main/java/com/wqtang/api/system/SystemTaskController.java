package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemTask;
import com.wqtang.system.SystemTaskService;
import com.wqtang.util.JsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.support.CronExpression;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/3
 */
@RestController
@RequestMapping("/system/task")
public class SystemTaskController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemTaskController.class);

    @Resource(name = "systemTaskService")
    private SystemTaskService taskService;

    /**
     * 查询定时任务列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemTask> getPage(SystemTask request,
                                        @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemTask> list = taskService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 导出定时任务列表
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "定时任务", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemTask request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return taskService.export(request);
    }

    /**
     * 获取定时任务的详细信息
     *
     * @param taskId
     * @return
     */
    @GetMapping("/{taskId}")
    public SystemTask getInfoByTaskId(@PathVariable("taskId") Long taskId) {
        return taskService.getByTaskId(taskId);
    }

    /**
     * 新增定时任务
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "定时任务", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemTask request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        taskService.insert(request);
    }

    /**
     * 修改定时任务
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "定时任务", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemTask request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        taskService.update(request);
    }

    private void checkAddEditRequest(SystemTask request) {
        if (!CronExpression.isValidExpression(request.getCronExpression())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "非法的Cron表达式");
        }
        if (StringUtils.containsIgnoreCase(request.getInvokeTarget(), "rmi://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "目标字符串不允许\"rmi://\"调用");
        }
        if (StringUtils.containsIgnoreCase(request.getInvokeTarget(), "ldap://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "目标字符串不允许\"ldap://\"调用");
        }
        if (StringUtils.containsAnyIgnoreCase(request.getInvokeTarget(), "http://", "https://")) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "目标字符串不允许\"http(s)://\"调用");
        }
    }

    /**
     * 修改定时任务的状态
     *
     * @param request
     */
    @PutMapping("/modifyStatus")
    @OperationLog(title = "定时任务", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void modifyStatus(@RequestBody SystemTask request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
    }

    /**
     * 立即执行定时任务
     *
     * @param request
     */
    @PutMapping("/run")
    @OperationLog(title = "定时任务", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void run(@RequestBody SystemTask request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
    }

    /**
     * 删除定时任务, 支持批量删除
     *
     * @param taskIds
     */
    @DeleteMapping("/{taskIds}")
    @OperationLog(title = "定时任务", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("taskIds") Long[] taskIds) {
        taskService.batchDeleteByTaskIds(taskIds);
    }

}
