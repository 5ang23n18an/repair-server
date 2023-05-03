package com.wqtang.object.po.system;

import com.alibaba.excel.annotation.ExcelProperty;
import com.wqtang.object.constant.TaskConstants;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/5/3
 */
public class SystemTask extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 任务ID
     */
    @ExcelProperty("任务序号")
    private Long taskId;

    /**
     * 任务名称
     */
    @ExcelProperty("任务名称")
    private String taskName;

    /**
     * 任务组名
     */
    @ExcelProperty("任务组名")
    private String taskGroup;

    /**
     * 调用目标字符串
     */
    @ExcelProperty("调用目标字符串")
    private String invokeTarget;

    /**
     * cron执行表达式
     */
    @ExcelProperty("执行表达式")
    private String cronExpression;

    /**
     * cron计划策略（0=默认, 1=立即触发执行, 2=触发一次执行, 3=不触发立即执行）
     */
    @ExcelProperty("计划策略")
    private String misfirePolicy = TaskConstants.MISFIRE_DEFAULT;

    /**
     * 是否并发执行（0允许, 1禁止）
     */
    @ExcelProperty("并发执行")
    private String concurrent;

    /**
     * 任务状态（0正常, 1暂停）
     */
    @ExcelProperty("任务状态")
    private String status;

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskGroup() {
        return taskGroup;
    }

    public void setTaskGroup(String taskGroup) {
        this.taskGroup = taskGroup;
    }

    public String getInvokeTarget() {
        return invokeTarget;
    }

    public void setInvokeTarget(String invokeTarget) {
        this.invokeTarget = invokeTarget;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public String getMisfirePolicy() {
        return misfirePolicy;
    }

    public void setMisfirePolicy(String misfirePolicy) {
        this.misfirePolicy = misfirePolicy;
    }

    public String getConcurrent() {
        return concurrent;
    }

    public void setConcurrent(String concurrent) {
        this.concurrent = concurrent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
