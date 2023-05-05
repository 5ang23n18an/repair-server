package com.wqtang.api.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.system.SystemPosition;
import com.wqtang.system.SystemPositionService;
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
 * @date 2023/4/5
 */
@RestController
@RequestMapping("/system/position")
public class SystemPositionController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SystemPositionController.class);

    @Resource(name = "systemPositionService")
    private SystemPositionService positionService;

    /**
     * 获取岗位列表
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<SystemPosition> getPage(SystemPosition request,
                                            @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                            @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<SystemPosition> list = positionService.listByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 导出岗位列表
     *
     * @param request
     * @return
     */
    @GetMapping("/export")
    @OperationLog(title = "岗位管理", businessType = BusinessType.EXPORT, operatorType = OperatorType.ADMIN)
    public ResponseEntity<byte[]> export(SystemPosition request) throws UnsupportedEncodingException {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return positionService.export(request);
    }

    /**
     * 根据岗位编号获取详细信息
     *
     * @param postId
     * @return
     */
    @GetMapping("/getInfo")
    public SystemPosition getInfo(@RequestParam(required = false, value = "postId") Long postId) {
        return postId == null ? null : positionService.getByPostId(postId);
    }

    /**
     * 新增岗位
     *
     * @param request
     */
    @PostMapping
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "岗位管理", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void add(@RequestBody SystemPosition request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        positionService.insert(request);
    }

    /**
     * 修改岗位
     *
     * @param request
     */
    @PutMapping
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "岗位管理", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody SystemPosition request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        checkAddEditRequest(request);
        positionService.update(request);
    }

    private void checkAddEditRequest(SystemPosition request) {
        if (positionService.isPostNameDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该岗位名称已经存在");
        }
        if (positionService.isPostCodeDuplicated(request)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "该岗位编码已经存在");
        }
    }

    /**
     * 删除岗位, 支持批量删除
     *
     * @param postIds
     */
    @DeleteMapping
    @OperationLog(title = "岗位管理", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "postIds") Long[] postIds) {
        positionService.batchDeleteByPostIds(postIds);
    }

    /**
     * 获取岗位选择框列表
     *
     * @return
     */
    @GetMapping("/list")
    public List<SystemPosition> getList() {
        return positionService.listAll();
    }

}
