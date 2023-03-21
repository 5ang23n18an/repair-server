package com.wqtang.api.repair;

import com.wqtang.controller.AbstractPager;
import com.wqtang.object.po.repair.RepairRecord;
import com.wqtang.object.vo.PageInfo;
import com.wqtang.object.vo.request.repair.GetRepairRecordPageRequest;
import com.wqtang.repair.RepairRecordService;
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

}
