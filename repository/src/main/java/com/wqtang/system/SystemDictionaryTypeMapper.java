package com.wqtang.system;

import com.wqtang.object.po.system.SystemDictionaryType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@Mapper
public interface SystemDictionaryTypeMapper {

    List<SystemDictionaryType> listByParams(SystemDictionaryType dictionaryType);

    SystemDictionaryType getByDictId(Long dictId);

    SystemDictionaryType getByDictType(String dictType);

    void insert(SystemDictionaryType dictionaryType);

    void update(SystemDictionaryType dictionaryType);

    boolean existsByDictType(String dictType);

    void batchDeleteByDictIds(Long[] dictIds);

}
