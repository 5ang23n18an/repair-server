package com.wqtang.system;

import com.wqtang.object.po.system.SystemDictionaryData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/6
 */
@Mapper
public interface SystemDictionaryDataMapper {

    List<SystemDictionaryData> listByParams(SystemDictionaryData dictionaryData);

    SystemDictionaryData getByDictCode(Long dictCode);

    void insert(SystemDictionaryData dictionaryData);

    void update(SystemDictionaryData dictionaryData);

    void deleteByDictCode(Long dictCode);

    boolean existsByDictType(String dictType);

}
