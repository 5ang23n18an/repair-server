package com.wqtang.api.repair;

import com.wqtang.controller.AbstractPager;
import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.PageInfo;
import com.wqtang.object.vo.request.repair.GetRepairInfoPageRequest;
import com.wqtang.repair.RepairInfoService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@RestController
@RequestMapping("/repair/info")
public class RepairInfoController extends AbstractPager<GetRepairInfoPageRequest> {

    @Resource(name = "repairInfoService")
    private RepairInfoService repairInfoService;

    /**
     * 根据道岔id获取详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairInfo getById(@PathVariable("id") Long id) {
        return repairInfoService.getById(id);
    }

    /**
     * 查询道岔信息列表
     *
     * @param request
     * @return
     */
    @GetMapping("/page")
    public PageInfo getPage(GetRepairInfoPageRequest request,
                            @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                            @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        return super.getPage(request, pageNumber, pageSize);
    }

    @Override
    public int getPageTotal(GetRepairInfoPageRequest request) {
        return repairInfoService.countByParams(request);
    }

    @Override
    public List<?> getPageRecords(GetRepairInfoPageRequest request, int offset, int limit) {
        return repairInfoService.pageByParams(request, offset, limit);
    }

    /**
     * 新增道岔信息
     *
     * @param request
     * @return
     */
    @PostMapping("/add")
    public void add(@RequestBody RepairInfo request) {
        repairInfoService.insert(request);
    }

    /**
     * 修改道岔信息
     *
     * @param request
     */
    @PutMapping("/edit")
    public void edit(@RequestBody RepairInfo request) {
        repairInfoService.update(request);
    }

    /**
     * 删除道岔信息
     *
     * @param id
     */
    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable("id") Long id) {
        repairInfoService.deleteById(id);
    }

    /*@GetMapping("/export")
    public ResponseEntity<org.springframework.core.io.Resource> export(GetRepairInfoListRequest request) {
        List<RepairInfo> list = repairInfoService.listByParams(request);

    }*/

}
