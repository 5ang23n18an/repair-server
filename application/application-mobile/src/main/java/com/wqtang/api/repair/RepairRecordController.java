package com.wqtang.api.repair;

import com.wqtang.controller.AbstractPager;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.constant.RepairConstants;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.po.repair.RepairFileResult;
import com.wqtang.object.po.repair.RepairRecord;
import com.wqtang.object.po.repair.RepairTest;
import com.wqtang.object.vo.PageInfo;
import com.wqtang.object.vo.request.repair.GetRepairRecordPageRequest;
import com.wqtang.object.vo.response.repair.GetRepairRecordCountOfDayResponse;
import com.wqtang.repair.RepairFileResultService;
import com.wqtang.repair.RepairRecordService;
import com.wqtang.repair.RepairTestService;
import com.wqtang.util.SecurityUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@RestController
@RequestMapping("/repair/record")
public class RepairRecordController extends AbstractPager<GetRepairRecordPageRequest> {

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
    public PageInfo getPage(GetRepairRecordPageRequest request,
                            @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                            @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        return super.getPage(request, pageNumber, pageSize);
    }

    @Override
    public int getPageTotal(GetRepairRecordPageRequest request) {
        return repairRecordService.countByParams(request);
    }

    @Override
    public List<?> getPageRecords(GetRepairRecordPageRequest request, int offset, int limit) {
        return repairRecordService.pageByParams(request, offset, limit);
    }

    /**
     * 查询检修记录列表(App端)
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairRecord> getList(RepairRecord request) {
        return repairRecordService.listByParams(request);
    }

    /**
     * 获取检修记录详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairRecord getById(@PathVariable("id") Long id) {
        return repairRecordService.getById(id);
    }

    @PostMapping("/add/web")
    @Transactional(rollbackFor = Exception.class)
    public void webAdd(@RequestBody RepairRecord request) {
        // 保存基础信息
        saveRepairRecord(request, true);
        // 保存测试记录
        saveRepairTest(request, true);
        // 保存图片返回的参数
        saveRepairFileResult(request, true);
    }

    @PutMapping("/edit")
    @Transactional(rollbackFor = Exception.class)
    public void edit(@RequestBody RepairRecord request) {
        // 修改基础信息
        saveRepairRecord(request, false);
        // 修改测试记录
        saveRepairTest(request, false);
        // 修改图片返回的参数
        saveRepairFileResult(request, false);
    }

    @PostMapping("/add/app")
    @Transactional(rollbackFor = Exception.class)
    public void appAdd(@RequestBody RepairRecord request) {
        if (CollectionUtils.isEmpty(request.getMachines())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "", "");
        }
        for (RepairRecord repairRecord : request.getMachines()) {
            // 保存基础信息
            repairRecord.setRouteId(request.getRouteId());
            repairRecord.setStationId(request.getStationId());
            repairRecord.setSwitchId(repairRecord.getSwitchId());
            if (RepairConstants.REPAIR_MACHINE_BACK.equals(repairRecord.getType())) {
                repairRecord.setFile3(repairRecord.getFile1());
                repairRecord.setFile4(repairRecord.getFile2());
                repairRecord.setFile1(null);
                repairRecord.setFile2(null);
            }
            repairRecord.setCreateBy(SecurityUtils.getLoginUser().getUsername());
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
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "Please select a switch", "请选择道岔");
        }
        if (stationList.size() == 3) {
            repairRecord.setRouteId(stationList.get(0));
            repairRecord.setStationId(stationList.get(1));
            repairRecord.setSwitchId(stationList.get(2));
        }
        repairRecord.setCreateBy(SecurityUtils.getLoginUser().getUsername());
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

    @DeleteMapping("/{ids}")
    public void delete(@PathVariable("ids") Long[] ids) {
        repairRecordService.deleteByIds(ids);
    }

    @GetMapping("/count")
    public List<GetRepairRecordCountOfDayResponse> countOfDay(RepairRecord request) {
        // todo
        return null;
    }

}
