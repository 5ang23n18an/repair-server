package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairPlace;
import com.wqtang.object.vo.request.repair.GetRepairPlaceListRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
@Mapper
public interface RepairPlaceMapper {

    RepairPlace getById(Long id);

    List<RepairPlace> listByParams(GetRepairPlaceListRequest request);

    List<RepairPlace> listParents();

}
