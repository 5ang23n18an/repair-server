package com.wqtang;

import com.wqtang.object.po.SystemConfig;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Mapper
public interface SystemConfigMapper {

    SystemConfig selectByKey(String key);

}
