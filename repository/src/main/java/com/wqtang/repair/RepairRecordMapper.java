package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairRecord;
import com.wqtang.object.vo.request.repair.GetRepairRecordPageRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
@Mapper
public interface RepairRecordMapper {

    RepairRecord getById(Long id);

    int countByParams(GetRepairRecordPageRequest param);

    List<RepairRecord> listByParams(RepairRecord request);

    List<RepairRecord> pageByParams(GetRepairRecordPageRequest param, int offset, int limit);

}
