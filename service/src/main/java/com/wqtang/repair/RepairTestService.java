package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairTest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Service
public class RepairTestService {

    @Resource(name = "repairTestMapper")
    private RepairTestMapper repairTestMapper;

    public List<RepairTest> listByParams(RepairTest repairTest) {
        return repairTestMapper.listByParams(repairTest);
    }

    public void insert(RepairTest repairTest) {
        repairTestMapper.insert(repairTest);
    }

    public void update(RepairTest repairTest) {
        repairTestMapper.update(repairTest);
    }

    public void deleteById(Long id) {
        repairTestMapper.deleteById(id);
    }

}
