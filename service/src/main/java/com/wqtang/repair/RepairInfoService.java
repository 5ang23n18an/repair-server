package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.GetRepairInfoPageRequest;
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

    public RepairInfo getById(Long id) {
        return repairInfoMapper.getById(id);
    }

    public int countByParams(GetRepairInfoPageRequest request) {
        return repairInfoMapper.countByParams(request);
    }

    public List<RepairInfo> pageByParams(GetRepairInfoPageRequest request, int offset, int limit) {
        return repairInfoMapper.pageByParams(request, offset, limit);
    }

    public void insert(RepairInfo request) {
        repairInfoMapper.insert(request);
    }

    public void update(RepairInfo request) {
        repairInfoMapper.update(request);
    }

    public void deleteById(Long id) {
        repairInfoMapper.deleteById(id);
    }

}
