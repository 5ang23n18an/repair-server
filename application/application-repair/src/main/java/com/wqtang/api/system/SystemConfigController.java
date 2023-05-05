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
import org.apache.commons.lang3.StringUtils;
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
    private SystemConfigService configService;

    /**
     * 根据参数id或参数键名key获取参数详细信息
     *
     * @param configId
     * @return
     */
    @GetMapping("/getInfo")
    public SystemConfig getInfo(@RequestParam(required = false, value = "id") Long configId,
                                @RequestParam(required = false, value = "key") String configKey) {
        if (configId == null && StringUtils.isBlank(configKey)) {
            return null;
        }
        if (configId != null && StringUtils.isNotBlank(configKey)) {
            SystemConfig config = configService.getByConfigId(configId);
            return configKey.equals(config.getConfigKey()) ? config : null;
        }
        return configId != null ? configService.getByConfigId(configId) : configService.getByConfigKey(configKey);
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
        List<SystemConfig> list = configService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 新增参数配置信息
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "参数管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemConfig request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        configService.insert(request);
    }

    /**
     * 修改参数配置信息
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "参数管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemConfig request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        configService.update(request);
    }

    /**
     * 删除参数配置信息
     *
     * @param configIds
     */
    @DeleteMapping
    @OperationLog(title = "参数管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "configIds") Long[] configIds) {
        configService.batchDeleteByConfigIds(configIds);
    }

    /**
     * 刷新参数配置的缓存数据
     */
    @PutMapping("/refreshCache")
    @OperationLog(title = "参数管理", businessType = BusinessType.CLEAN, operatorType = OperatorType.ADMIN)
    public void refreshCache() {
        configService.refreshCache();
    }

}
