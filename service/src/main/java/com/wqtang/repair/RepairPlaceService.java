package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.repair.GetRepairPlaceListRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
@Service
public class RepairPlaceService {

    @Resource(name = "repairPlaceMapper")
    private RepairPlaceMapper repairPlaceMapper;

    public RepairPlace getByID(Long id) {
        return repairPlaceMapper.getByID(id);
    }

    public List<RepairPlace> listByParams(GetRepairPlaceListRequest request) {
        return repairPlaceMapper.listByParams(request);
    }

    public List<RepairPlace> listParents() {
        return repairPlaceMapper.listParents();
    }

}
