package com.wqtang.repair;

import com.wqtang.object.po.repair.RepairInfo;
import com.wqtang.object.vo.request.repair.GetRepairInfoPageRequest;
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

    void insert(RepairInfo request);

    void update(RepairInfo request);

    void deleteById(Long id);

}
