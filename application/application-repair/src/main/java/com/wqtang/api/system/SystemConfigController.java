package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.system.SystemConfig;
import com.wqtang.system.SystemConfigService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/13
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemConfigController.class);

    @Resource(name = "systemConfigService")
    private SystemConfigService systemConfigService;

    /**
     * 根据参数id获取参数详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public SystemConfig getById(@PathVariable("id") Long id) {
        return systemConfigService.getById(id);
    }

    /**
     * 获取参数配置列表
     *
     * @param request
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemConfig> getPage(SystemConfig request,
                                          @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                          @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemConfig> list = systemConfigService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 根据参数键名key获取参数详细信息
     *
     * @param key
     * @return
     */
    @GetMapping("/key/{key}")
    public SystemConfig getByKey(@PathVariable("key") String key) {
        return systemConfigService.getByConfigKey(key);
    }

    /**
     * 新增参数配置信息
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "参数管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemConfig request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        systemConfigService.insert(request);
    }

    /**
     * 修改参数配置信息
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "参数管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemConfig request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        systemConfigService.update(request);
    }

    /**
     * 删除参数配置信息
     *
     * @param ids
     */
    @DeleteMapping("/{ids}")
    @OperationLog(title = "参数管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("ids") Long[] ids) {
        systemConfigService.batchDeleteByIds(ids);
    }

    /**
     * 刷新参数配置的缓存数据
     */
    @PutMapping("/refreshCache")
    @OperationLog(title = "参数管理", businessType = BusinessType.CLEAN, operatorType = OperatorType.ADMIN)
    public void refreshCache() {
        systemConfigService.refreshCache();
    }

}
