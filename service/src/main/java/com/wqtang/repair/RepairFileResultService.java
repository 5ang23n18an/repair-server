package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairFileResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Service
public class RepairFileResultService {

    @Resource(name = "repairFileResultMapper")
    private RepairFileResultMapper repairFileResultMapper;

    public void insert(RepairFileResult repairFileResult) {
        repairFileResultMapper.insert(repairFileResult);
    }

    public void deleteById(Long id) {
        repairFileResultMapper.deleteById(id);
    }

}
