package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairTest;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Mapper
public interface RepairTestMapper {

    void insert(RepairTest repairTest);

    void update(RepairTest repairTest);

    void deleteById(Long id);

}
