package com.wqtang.api.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.repair.GetRepairPlaceListRequest;
import com.wqtang.repair.RepairPlaceService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
@RestController
@RequestMapping("/repair/place")
public class RepairPlaceController {

    @Resource(name = "repairPlaceService")
    private RepairPlaceService repairPlaceService;

    /**
     * 根据道岔号id获取基础结构详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public RepairPlace getByID(@PathVariable("id") Long id) {
        return repairPlaceService.getByID(id);
    }

    /**
     * 查询道岔号基础结构列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairPlace> getList(GetRepairPlaceListRequest request) {
        return repairPlaceService.listByParams(request);
    }

    /**
     * 获取路线与它的父级路线
     *
     * @return
     */
    @GetMapping("/parent")
    public List<RepairPlace> parent() {
        return repairPlaceService.listParents();
    }

    /**
     * 获取道岔列表, 并按照类型进行分组
     *
     * @return
     */
    @GetMapping("/groupByType")
    public Map<String, List<RepairPlace>> groupByType() {
        List<RepairPlace> list = repairPlaceService.listByParams(null);
        return list.stream().collect(Collectors.groupingBy(RepairPlace::getType));
    }

}
