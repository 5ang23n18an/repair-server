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

    public RepairPlace getById(Long id) {
        return repairPlaceMapper.getById(id);
    }

    public List<RepairPlace> listAll() {
        return listByParams(null);
    }

    public List<RepairPlace> listByParams(GetRepairPlaceListRequest request) {
        return repairPlaceMapper.listByParams(request);
    }

    public List<RepairPlace> listByType(String type) {
        return repairPlaceMapper.listByType(type);
    }

}
