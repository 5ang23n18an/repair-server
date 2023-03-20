package com.wqtang.system;

import com.wqtang.object.po.system.SystemConfig;
import com.wqtang.object.vo.request.system.AddSystemConfigRequest;
import com.wqtang.object.vo.request.system.GetSystemConfigListRequest;
import com.wqtang.object.vo.request.system.UpdateSystemConfigRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Mapper
public interface SystemConfigMapper {

    SystemConfig getByID(Long id);

    SystemConfig getByKey(String key);

    List<SystemConfig> listByParams(SystemConfig param);

    List<SystemConfig> pageByParams(GetSystemConfigListRequest request);

    void insert(AddSystemConfigRequest request);

    void update(UpdateSystemConfigRequest request);

    void deleteByID(Long id);

}
