package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@Mapper
public interface RepairRecordMapper {

    RepairRecord getById(Long id);

    List<RepairRecord> listByParams(RepairRecord record);

    void insert(RepairRecord repairRecord);

    void update(RepairRecord repairRecord);

    void deleteByIds(Long[] ids);

}
