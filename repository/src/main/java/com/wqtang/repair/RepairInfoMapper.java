package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@Mapper
public interface RepairInfoMapper {

    RepairInfo getById(Long id);

    List<RepairInfo> listByParams(RepairInfo repairInfo);

    void insert(RepairInfo repairInfo);

    void update(RepairInfo repairInfo);

    void batchDeleteByIds(Long[] ids);

    RepairInfo getBySwitchNo(String switchNo);

}
