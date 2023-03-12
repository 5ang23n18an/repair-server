package com.wqtang;

import com.wqtang.object.po.system.SystemConfig;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Mapper
public interface SystemConfigMapper {

    SystemConfig getByKey(String key);

}
