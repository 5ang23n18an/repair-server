package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.AddRepairInfoRequest;
import com.wqtang.object.vo.request.repair.GetRepairInfoPageRequest;
import com.wqtang.object.vo.request.repair.UpdateRepairInfoRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@Mapper
public interface RepairInfoMapper {

    RepairInfo getById(Long id);

    int countByParams(GetRepairInfoPageRequest param);

    List<RepairInfo> pageByParams(@Param("param") GetRepairInfoPageRequest param,
                                  @Param("offset") int offset,
                                  @Param("limit") int limit);

    void insert(AddRepairInfoRequest request);

    void update(UpdateRepairInfoRequest request);

    void deleteById(Long id);

}
