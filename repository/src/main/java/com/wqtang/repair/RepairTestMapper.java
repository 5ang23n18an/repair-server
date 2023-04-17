package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairTest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Mapper
public interface RepairTestMapper {

    List<RepairTest> listByParams(RepairTest repairTest);

    void insert(RepairTest repairTest);

    void update(RepairTest repairTest);

    void deleteById(Long id);

}
