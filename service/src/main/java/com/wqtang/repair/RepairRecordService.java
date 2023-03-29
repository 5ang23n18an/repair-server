package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@Service
public class RepairRecordService {

    @Resource(name = "repairRecordMapper")
    private RepairRecordMapper repairRecordMapper;

    public RepairRecord getById(Long id) {
        return repairRecordMapper.getById(id);
    }

    public List<RepairRecord> listByParams(RepairRecord request) {
        return repairRecordMapper.listByParams(request);
    }

    public void insert(RepairRecord repairRecord) {
        repairRecordMapper.insert(repairRecord);
    }

    public void update(RepairRecord repairRecord) {
        repairRecordMapper.update(repairRecord);
    }

    public void deleteByIds(Long[] ids) {
        repairRecordMapper.deleteByIds(ids);
    }

}
