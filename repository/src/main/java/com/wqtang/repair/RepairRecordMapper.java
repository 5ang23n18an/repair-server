package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@Mapper
public interface RepairRecordMapper {

    RepairRecord getById(Long id);

    List<RepairRecord> webListByParams(RepairRecord repairRecord);

    List<RepairRecord> appListByParams(RepairRecord repairRecord);

    void insert(RepairRecord repairRecord);

    void update(RepairRecord repairRecord);

    void batchDeleteByIds(Long[] ids);

    @SuppressWarnings("MybatisXMapperMethodInspection")
    List<Map<String, Object>> listCountOfDailyRecord(RepairRecord repairRecord);

}
