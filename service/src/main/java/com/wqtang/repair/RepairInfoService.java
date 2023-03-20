package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.AddRepairInfoRequest;
import com.wqtang.object.vo.request.repair.GetRepairInfoListRequest;
import com.wqtang.object.vo.request.repair.UpdateRepairInfoRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@Service
public class RepairInfoService {

    @Resource(name = "repairInfoMapper")
    private RepairInfoMapper repairInfoMapper;

    public RepairInfo getByID(Long id) {
        return repairInfoMapper.getByID(id);
    }

    public List<RepairInfo> listByParams(GetRepairInfoListRequest request) {
        return repairInfoMapper.listByParams(request);
    }

    public void insert(AddRepairInfoRequest request) {
        repairInfoMapper.insert(request);
    }

    public void update(UpdateRepairInfoRequest request) {
        repairInfoMapper.update(request);
    }

    public void deleteByID(Long id) {
        repairInfoMapper.deleteByID(id);
    }

}
