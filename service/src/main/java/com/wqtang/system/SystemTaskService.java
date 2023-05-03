package com.wqtang.system;

import com.wqtang.object.constant.TaskConstants;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemTask;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
import com.wqtang.util.ScheduledUtils;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/3
 */
@Service
public class SystemTaskService {

    @Resource(name = "systemTaskMapper")
    private SystemTaskMapper taskMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemTask> excelUtils;
    @Resource(name = "quartzScheduler")
    private Scheduler scheduler;

    /**
     * 在项目启动时，对定时器进行初始化操作。
     * 这主要是防止因手动修改数据库导致未同步更新到定时器。
     *
     * @throws SchedulerException
     */
    @PostConstruct
    public void initScheduler() throws SchedulerException {
        scheduler.clear();
        for (SystemTask task : listAll()) {
            ScheduledUtils.createScheduledTask(scheduler, task);
        }
    }

    public List<SystemTask> listAll() {
        return taskMapper.listByParams(null);
    }

    public List<SystemTask> listByParams(SystemTask task) {
        return taskMapper.listByParams(task);
    }

    public ResponseEntity<byte[]> export(SystemTask task) {
        List<SystemTask> list = listByParams(task);
        File file = excelUtils.export(list, "定时任务");
        byte[] fileBytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        } catch (UnsupportedEncodingException e) {
            throw new BusinessException(e);
        }
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public SystemTask getByTaskId(Long taskId) {
        return taskMapper.getByTaskId(taskId);
    }

    public void batchDeleteByTaskIds(Long[] taskIds) {
        taskMapper.batchDeleteByTaskIds(taskIds);
    }

    public void insert(SystemTask task) {
        task.setStatus(TaskConstants.Status.PAUSE.getValue());
        taskMapper.insert(task);
    }

    public void update(SystemTask task) {
        taskMapper.update(task);
    }

}
