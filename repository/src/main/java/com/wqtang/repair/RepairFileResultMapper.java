package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairFileResult;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
@Mapper
public interface RepairFileResultMapper {

    void insert(RepairFileResult repairFileResult);

    void deleteById(Long id);

}
