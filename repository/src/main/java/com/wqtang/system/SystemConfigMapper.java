package com.wqtang.system;

import com.wqtang.object.po.system.SystemConfig;
import com.wqtang.object.vo.request.system.GetSystemConfigListRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Mapper
public interface SystemConfigMapper {

    SystemConfig getById(Long id);

    SystemConfig getByKey(String key);

    List<SystemConfig> listByParams(SystemConfig config);

    List<SystemConfig> pageByParams(@Param("request") GetSystemConfigListRequest request,
                                    @Param("offset") int offset,
                                    @Param("limit") int limit);

    int countByParams(GetSystemConfigListRequest request);

    void insert(SystemConfig config);

    void update(SystemConfig config);

    void deleteByIds(Long[] ids);

}
