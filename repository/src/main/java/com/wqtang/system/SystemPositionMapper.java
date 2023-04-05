package com.wqtang.system;

import com.wqtang.object.po.system.SystemPosition;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/5
 */
@Mapper
public interface SystemPositionMapper {

    List<SystemPosition> listByParams(SystemPosition position);

    SystemPosition getById(Long postId);

    void insert(SystemPosition position);

    void update(SystemPosition position);

    void batchDeleteByPostId(Long[] postIds);

    SystemPosition getByPostName(String postName);

    SystemPosition getByPostCode(String postCode);

}
