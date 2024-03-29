package com.wqtang.system;

import com.wqtang.object.po.system.SystemConfig;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Mapper
public interface SystemConfigMapper {

    SystemConfig getByConfigId(Long configId);

    SystemConfig getByConfigKey(String configKey);

    List<SystemConfig> listByParams(SystemConfig config);

    void insert(SystemConfig config);

    void update(SystemConfig config);

    void batchDeleteByConfigIds(Long[] configIds);

}
