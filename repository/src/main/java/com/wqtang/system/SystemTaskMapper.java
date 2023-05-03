package com.wqtang.system;

import com.wqtang.object.po.system.SystemTask;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/3
 */
@Mapper
public interface SystemTaskMapper {

    List<SystemTask> listByParams(SystemTask task);

    SystemTask getByTaskId(Long taskId);

    void batchDeleteByTaskIds(Long[] taskIds);

    void insert(SystemTask task);

    void update(SystemTask task);

}
