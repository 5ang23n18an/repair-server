package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
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

    public List<RepairInfo> listByParams(RepairInfo repairInfo) {
        return repairInfoMapper.listByParams(repairInfo);
    }

    public void insert(RepairInfo request) {
        repairInfoMapper.insert(request);
    }

    public void update(RepairInfo request) {
        repairInfoMapper.update(request);
    }

    public void deleteByIds(Long[] ids) {
        repairInfoMapper.deleteByIds(ids);
    }
}
