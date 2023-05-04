package com.wqtang.api.repair;

import com.google.common.collect.Lists;
import com.wqtang.object.constant.RepairConstants;
import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.repair.GetRepairPlaceListRequest;
import com.wqtang.object.vo.response.repair.RepairPlaceParentRoute;
import com.wqtang.repair.RepairPlaceService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

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

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairPlaceController.class);

    @Resource(name = "repairPlaceService")
    private RepairPlaceService repairPlaceService;

    /**
     * 根据道岔号id获取基础结构详细信息
     *
     * @param id
     * @return
     */
    @GetMapping("/getInfo")
    public RepairPlace getInfo(@RequestParam(required = false, value = "id") Long id) {
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
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
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
