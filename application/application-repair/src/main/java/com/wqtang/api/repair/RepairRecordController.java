package com.wqtang.api.repair;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.constant.RepairConstants;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.po.repair.RepairFileResult;
import com.wqtang.object.po.repair.RepairRecord;
import com.wqtang.object.po.repair.RepairTest;
import com.wqtang.object.vo.response.repair.GetRepairRecordCountOfDayResponse;
import com.wqtang.repair.RepairFileResultService;
import com.wqtang.repair.RepairRecordService;
import com.wqtang.repair.RepairTestService;
import com.wqtang.util.JsonUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@RestController
@RequestMapping("/repair/record")
public class RepairRecordController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairRecordController.class);

    @Resource(name = "repairRecordService")
    private RepairRecordService repairRecordService;
    @Resource(name = "repairTestService")
    private RepairTestService repairTestService;
    @Resource(name = "repairFileResultService")
    private RepairFileResultService repairFileResultService;

    /**
     * 查询检修记录列表(Web端)
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<RepairRecord> getPage(RepairRecord request,
                                          @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                          @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("request = {},\r\npageNumber = {}, pageSize = {}", JsonUtils.getPrettyJson(request), pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<RepairRecord> list = repairRecordService.webListByParams(request);
        return new PageInfo<>(list);
    }

    /**
     * 查询检修记录列表(App端)
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairRecord> getList(RepairRecord request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return repairRecordService.appListByParams(request);
    }

    /**
     * 获取检修记录详细信息
     *
     * @param id
     * @return
     */
    @GetMapping
    public RepairRecord getInfo(@RequestParam(required = false, value = "id") Long id) {
        return repairRecordService.getById(id);
    }

    /**
     * 新增检修记录(Web端), 单条新增
     *
     * @param request
     */
    @PostMapping("/addFromWeb")
    @Transactional(rollbackFor = Exception.class)
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "检修记录", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void webAdd(@RequestBody RepairRecord request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        // 保存基础信息
        saveRepairRecord(request, true);
        // 保存测试记录
        saveRepairTest(request, true);
        // 保存图片返回的参数
        saveRepairFileResult(request, true);
    }

    /**
     * 修改检修记录
     *
     * @param request
     */
    @PutMapping
    @Transactional(rollbackFor = Exception.class)
    @DoAspect(businessType = BusinessType.UPDATE)
    @OperationLog(title = "检修记录", businessType = BusinessType.UPDATE, operatorType = OperatorType.ADMIN)
    public void edit(@RequestBody RepairRecord request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        // 修改基础信息
        saveRepairRecord(request, false);
        // 修改测试记录
        saveRepairTest(request, false);
        // 修改图片返回的参数
        saveRepairFileResult(request, false);
    }

    /**
     * 新增检修记录(App端), 批量新增
     *
     * @param request
     */
    @PostMapping("/addFromApp")
    @Transactional(rollbackFor = Exception.class)
    @DoAspect(businessType = BusinessType.INSERT)
    @OperationLog(title = "检修记录", businessType = BusinessType.INSERT, operatorType = OperatorType.ADMIN)
    public void appAdd(@RequestBody RepairRecord request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        if (CollectionUtils.isEmpty(request.getMachines())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "检修记录不得为空");
        }
        for (RepairRecord repairRecord : request.getMachines()) {
            // 保存基础信息
            repairRecord.setRouteId(request.getRouteId());
            repairRecord.setStationId(request.getStationId());
            repairRecord.setSwitchId(repairRecord.getSwitchId());
            repairRecord.setCreateBy(request.getCreateBy());
            if (RepairConstants.REPAIR_MACHINE_BACK.equals(repairRecord.getType())) {
                repairRecord.setFile3(repairRecord.getFile1());
                repairRecord.setFile4(repairRecord.getFile2());
                repairRecord.setFile1(null);
                repairRecord.setFile2(null);
            }
            repairRecordService.insert(repairRecord);
            // 保存测试记录
            saveRepairTest(repairRecord, true);
            // 保存图片返回的参数
            saveRepairFileResult(repairRecord, true);
        }
    }

    private void saveRepairRecord(RepairRecord repairRecord, boolean isAdd) {
        List<Long> stationList = repairRecord.getStationList();
        if (CollectionUtils.isEmpty(stationList)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "请选择道岔");
        }
        if (stationList.size() == 3) {
            repairRecord.setRouteId(stationList.get(0));
            repairRecord.setStationId(stationList.get(1));
            repairRecord.setSwitchId(stationList.get(2));
        }
        if (isAdd) {
            repairRecordService.insert(repairRecord);
        } else {
            repairRecordService.update(repairRecord);
        }
    }

    private void saveRepairTest(RepairRecord repairRecord, boolean isAdd) {
        if (CollectionUtils.isNotEmpty(repairRecord.getMachineList())) {
            if (!isAdd) {
                repairTestService.deleteById(repairRecord.getId());
            }
            for (RepairTest repairTest : repairRecord.getMachineList()) {
                repairTest.setRecordId(repairRecord.getId());
                repairTestService.insert(repairTest);
            }
        }
    }

    private void saveRepairFileResult(RepairRecord repairRecord, boolean isAdd) {
        RepairFileResult rowOneTwo = repairRecord.getRowOneTwo();
        if (rowOneTwo != null) {
            if (!isAdd) {
                repairFileResultService.deleteById(repairRecord.getId());
            }
            rowOneTwo.setRecordId(repairRecord.getId());
            rowOneTwo.setRowType(RepairConstants.ROW_ONE_TOW);
            repairFileResultService.insert(rowOneTwo);
        }
        RepairFileResult rowThreeFour = repairRecord.getRowThreeFour();
        if (rowThreeFour != null) {
            if (!isAdd) {
                repairFileResultService.deleteById(repairRecord.getId());
            }
            rowThreeFour.setRecordId(repairRecord.getId());
            rowThreeFour.setRowType(RepairConstants.ROW_THREE_FOUR);
            repairFileResultService.insert(rowThreeFour);
        }
    }

    /**
     * 删除检修记录, 支持批量删除
     *
     * @param ids
     */
    @DeleteMapping
    @OperationLog(title = "检修记录", businessType = BusinessType.DELETE, operatorType = OperatorType.ADMIN)
    public void delete(@RequestParam(required = false, value = "ids") Long[] ids) {
        repairRecordService.batchDeleteByIds(ids);
    }

    /**
     * 日期与检修次数的关系图表
     *
     * @param request
     * @return
     */
    @GetMapping("/count")
    public List<GetRepairRecordCountOfDayResponse> countOfDay(RepairRecord request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        List<Map<String, Object>> dailyRecordList = repairRecordService.listCountOfDailyRecord(request);
        List<GetRepairRecordCountOfDayResponse> list = Lists.newArrayListWithExpectedSize(dailyRecordList.size());
        for (Map<String, Object> dailyRecord : dailyRecordList) {
            String createTime = MapUtils.getString(dailyRecord, "createTime");
            float round = MapUtils.getFloat(dailyRecord, "round");
            GetRepairRecordCountOfDayResponse response = new GetRepairRecordCountOfDayResponse();
            response.setCreateTime(createTime);
            if (RepairConstants.ROW_ONE_TOW.equals(MapUtils.getString(dailyRecord, "rowType"))) {
                response.setRowOneTwo(round);
            } else {
                response.setRowThreeFour(round);
            }
            list.add(response);
        }
        return list;
    }

}
