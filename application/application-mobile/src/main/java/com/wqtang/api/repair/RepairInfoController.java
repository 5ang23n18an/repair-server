package com.wqtang.api.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.AddRepairInfoRequest;
import com.wqtang.object.vo.request.repair.GetRepairInfoListRequest;
import com.wqtang.object.vo.request.repair.UpdateRepairInfoRequest;
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
public class RepairInfoController {

    @Resource(name = "repairInfoService")
    private RepairInfoService repairInfoService;

    /**
     * 根据道岔id获取详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairInfo getByID(@PathVariable("id") Long id) {
        return repairInfoService.getByID(id);
    }

    /**
     * 查询道岔信息列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairInfo> getList(GetRepairInfoListRequest request) {
        return repairInfoService.listByParams(request);
    }

    /**
     * 新增道岔信息
     *
     * @param request
     * @return
     */
    @PostMapping("/add")
    public void add(@RequestBody AddRepairInfoRequest request) {
        repairInfoService.insert(request);
    }

    /**
     * 修改道岔信息
     *
     * @param request
     */
    @PutMapping("/edit")
    public void edit(@RequestBody UpdateRepairInfoRequest request) {
        repairInfoService.update(request);
    }

    /**
     * 删除道岔信息
     *
     * @param id
     */
    @DeleteMapping("/{id}")
    public void deleteByID(@PathVariable("id") Long id) {
        repairInfoService.deleteByID(id);
    }

    /*@GetMapping("/export")
    public ResponseEntity<org.springframework.core.io.Resource> export(GetRepairInfoListRequest request) {
        List<RepairInfo> list = repairInfoService.listByParams(request);

    }*/

}
