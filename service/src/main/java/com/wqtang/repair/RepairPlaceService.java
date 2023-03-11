package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.mobile.repair.GetRepairPlaceListRequest;
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

    public RepairPlace selectById(Long id) {
        return repairPlaceMapper.selectById(id);
    }

    public List<RepairPlace> selectList(GetRepairPlaceListRequest request) {
        return repairPlaceMapper.selectList(request);
    }

    public List<RepairPlace> selectParentList() {
        return repairPlaceMapper.selectParentList();
    }

}
