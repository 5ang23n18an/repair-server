package com.wqtang.api.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.mobile.repair.GetRepairPlaceListRequest;
import com.wqtang.object.vo.response.Response;
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

    @GetMapping("/{id}")
    public Response getById(@PathVariable("id") Long id) {
        RepairPlace repairPlace = repairPlaceService.selectById(id);
        return Response.success(repairPlace);
    }

    /**
     * 查询道岔号基础结构列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public Response getList(GetRepairPlaceListRequest request) {
        List<RepairPlace> list = repairPlaceService.selectList(request);
        return Response.success(list);
    }

    /**
     * 获取路线与它的父级路线
     *
     * @return
     */
    @GetMapping("/parent")
    public Response parent() {
        List<RepairPlace> list = repairPlaceService.selectParentList();
        return Response.success(list);
    }

    /**
     * 获取道岔列表, 并按照类型进行分组
     *
     * @return
     */
    @GetMapping("/groupByType")
    public Response groupByType() {
        List<RepairPlace> list = repairPlaceService.selectList(null);
        Map<String, List<RepairPlace>> groupedList = list.stream().collect(Collectors.groupingBy(RepairPlace::getType));
        return Response.success(groupedList);
    }

}
