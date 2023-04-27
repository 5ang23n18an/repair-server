package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.po.system.SystemDictionaryType;
import com.wqtang.system.SystemDictionaryDataService;
import com.wqtang.system.SystemDictionaryTypeService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@RestController
@RequestMapping("/system/dictionary/type")
public class SystemDictionaryTypeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemDictionaryTypeController.class);

    @Resource(name = "systemDictionaryTypeService")
    private SystemDictionaryTypeService systemDictionaryTypeService;
    @Resource(name = "systemDictionaryDataService")
    private SystemDictionaryDataService systemDictionaryDataService;

    /**
     * 获取数据字典信息
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemDictionaryType> getPage(SystemDictionaryType request,
                                                  @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                                  @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemDictionaryType> list = systemDictionaryTypeService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 将数据字典信息列表以Excel文件形式导出
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "字典类型", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemDictionaryType request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        try {
            return systemDictionaryTypeService.export(request);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_DOWNLOAD_FAIL);
        }
    }

    /**
     * 获取字典类型详细信息
     *
     * @param dictId
     * @return
     */
    @GetMapping("/{dictId}")
    public SystemDictionaryType getById(@PathVariable("dictId") Long dictId) {
        return systemDictionaryTypeService.getByDictId(dictId);
    }

    /**
     * 新增字典类型
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "字典类型", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemDictionaryType request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        systemDictionaryTypeService.insert(request);
    }

    /**
     * 修改字典类型
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "字典类型", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemDictionaryType request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        systemDictionaryTypeService.update(request);
    }

    private void checkAddEditRequest(SystemDictionaryType request) {
        if (systemDictionaryTypeService.isDictNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该字典类型名称已经存在");
        }
    }

    /**
     * 删除字典类型, 支持批量删除
     *
     * @param dictIds
     */
    @DeleteMapping("/{dictIds}")
    @OperationLog(title = "字典类型", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@PathVariable("dictIds") Long[] dictIds) {
        for (Long dictId : dictIds) {
            SystemDictionaryType dictionaryType = systemDictionaryTypeService.getByDictId(dictId);
            if (systemDictionaryDataService.existsByDictType(dictionaryType.getDictType())) {
                throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "字典类型名称已分配, 不允许删除");
            }
            systemDictionaryTypeService.deleteByDictId(dictionaryType);
        }
    }

    /**
     * 刷新字典类型的缓存数据
     */
    @PutMapping("/refreshCache")
    @OperationLog(title = "字典类型", businessType = BusinessType.CLEAN, operatorType = OperatorType.ADMIN)
    public void refreshCache() {
        systemDictionaryTypeService.refreshCache();
    }

    /**
     * 获取字典类型的选择框列表
     *
     * @return
     */
    @GetMapping("/list")
    public List<SystemDictionaryType> getList() {
        return systemDictionaryTypeService.listAll();
    }

}
