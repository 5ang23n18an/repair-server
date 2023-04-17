package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    public List<RepairRecord> webListByParams(RepairRecord repairRecord) {
        return repairRecordMapper.webListByParams(repairRecord);
    }

    public List<RepairRecord> appListByParams(RepairRecord repairRecord) {
        return repairRecordMapper.appListByParams(repairRecord);
    }

    public void insert(RepairRecord repairRecord) {
        repairRecordMapper.insert(repairRecord);
    }

    public void update(RepairRecord repairRecord) {
        repairRecordMapper.update(repairRecord);
    }

    public void batchDeleteByIds(Long[] ids) {
        repairRecordMapper.batchDeleteByIds(ids);
    }

    public List<Map<String, Object>> listCountOfDailyRecord(RepairRecord repairRecord) {
        return repairRecordMapper.listCountOfDailyRecord(repairRecord);
    }

}
