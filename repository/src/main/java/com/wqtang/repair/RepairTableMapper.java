package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairTable;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@Mapper
public interface RepairTableMapper {

    List<RepairTable> listByParams(RepairTable repairTable);

    RepairTable getById(Long id);

    void insert(RepairTable repairTable);

    void update(RepairTable repairTable);

    void batchDeleteByIds(Long[] ids);

}
