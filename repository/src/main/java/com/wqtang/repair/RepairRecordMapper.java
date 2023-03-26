package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import com.wqtang.object.vo.request.repair.GetRepairRecordPageRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@Mapper
public interface RepairRecordMapper {

    RepairRecord getById(Long id);

    int countByParams(GetRepairRecordPageRequest request);

    List<RepairRecord> listByParams(RepairRecord record);

    List<RepairRecord> pageByParams(@Param("request") GetRepairRecordPageRequest request,
                                    @Param("offset") int offset,
                                    @Param("limit") int limit);

    void insert(RepairRecord repairRecord);

    void update(RepairRecord repairRecord);

    void deleteByIds(Long[] ids);

}
