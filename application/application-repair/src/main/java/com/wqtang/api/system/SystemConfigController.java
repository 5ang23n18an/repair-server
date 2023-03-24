package com.wqtang.api.system;

import com.wqtang.controller.AbstractPager;
import com.wqtang.object.po.system.SystemConfig;
import com.wqtang.object.vo.PageInfo;
import com.wqtang.object.vo.request.system.GetSystemConfigListRequest;
import com.wqtang.system.SystemConfigService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/13
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController extends AbstractPager<GetSystemConfigListRequest> {

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
    @Override
    public PageInfo getPage(GetSystemConfigListRequest request,
                            @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                            @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        return super.getPage(request, pageNumber, pageSize);
    }

    @Override
    public int getPageTotal(GetSystemConfigListRequest request) {
        return systemConfigService.countByParams(request);
    }

    @Override
    public List<?> getPageRecords(GetSystemConfigListRequest request, int offset, int limit) {
        return systemConfigService.pageByParams(request, offset, limit);
    }

    /**
     * 根据参数键名key获取参数详细信息
     *
     * @param key
     * @return
     */
    @GetMapping("/key/{key}")
    public SystemConfig getByKey(@PathVariable("key") String key) {
        return systemConfigService.getByKey(key);
    }

    /**
     * 新增参数配置信息
     */
    @PostMapping("/add")
    public void add(@RequestBody SystemConfig request) {
        systemConfigService.insert(request);
    }

    /**
     * 修改参数配置信息
     */
    @PutMapping("/edit")
    public void edit(@RequestBody SystemConfig request) {
        systemConfigService.update(request);
    }

    /**
     * 删除参数配置信息
     *
     * @param ids
     */
    @DeleteMapping("/{ids}")
    public void delete(@PathVariable("ids") Long[] ids) {
        systemConfigService.deleteByIds(ids);
    }

    /**
     * 刷新参数配置的缓存数据
     */
    @PutMapping("/refreshCache")
    public void refreshCache() {
        systemConfigService.refreshCache();
    }

}
