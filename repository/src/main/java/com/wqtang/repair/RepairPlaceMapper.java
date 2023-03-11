package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.mobile.repair.GetRepairPlaceListRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
@Mapper
public interface RepairPlaceMapper {

    RepairPlace selectById(Long id);

    List<RepairPlace> selectList(GetRepairPlaceListRequest request);

    List<RepairPlace> selectParentList();

}
