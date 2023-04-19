package com.wqtang.api.repair;

import com.google.common.collect.Lists;
import com.wqtang.object.constant.RepairConstants;
import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.repair.GetRepairPlaceListRequest;
import com.wqtang.object.vo.response.repair.RepairPlaceParentRoute;
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
    public RepairPlace getById(@PathVariable("id") Long id) {
        return repairPlaceService.getById(id);
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
    public List<RepairPlaceParentRoute> getParentList() {
        List<RepairPlace> parentRouteList = repairPlaceService.listByType(RepairConstants.REPAIR_ROUTE);
        List<RepairPlaceParentRoute> list = Lists.newArrayListWithExpectedSize(parentRouteList.size());
        for (RepairPlace repairPlace : parentRouteList) {
            RepairPlaceParentRoute parentRoute = new RepairPlaceParentRoute();
            parentRoute.setValue(repairPlace.getId());
            parentRoute.setLabel(repairPlace.getName());
            parentRoute.setParentId(repairPlace.getParentId());
            list.add(parentRoute);
        }
        return list;
    }

    /**
     * 获取道岔列表, 并按照类型进行分组
     *
     * @return
     */
    @GetMapping("/groupByType")
    public Map<String, List<RepairPlace>> groupByType() {
        List<RepairPlace> list = repairPlaceService.listAll();
        return list.stream().collect(Collectors.groupingBy(RepairPlace::getType));
    }

}
