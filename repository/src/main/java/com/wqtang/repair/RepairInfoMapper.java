package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.AddRepairInfoRequest;
import com.wqtang.object.vo.request.repair.GetRepairInfoListRequest;
import com.wqtang.object.vo.request.repair.UpdateRepairInfoRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@Mapper
public interface RepairInfoMapper {

    RepairInfo getByID(Long id);

    List<RepairInfo> listByParams(GetRepairInfoListRequest request);

    void insert(AddRepairInfoRequest request);

    void update(UpdateRepairInfoRequest request);

    void deleteByID(Long id);

}
