package com.wqtang.object.po.system;

import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class SystemConfig extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 参数主键
     */
    private Long id;

    /**
     * 参数键名
     */
    private String key;

    /**
     * 参数键值
     */
    private String value;

    /**
     * 参数名称
     */
    private String name;

    private String type;

    private Boolean available;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

}
