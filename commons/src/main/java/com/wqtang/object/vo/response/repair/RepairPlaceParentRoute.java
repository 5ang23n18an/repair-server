package com.wqtang.object.vo.response.repair;

/**
 * @author Wenqian Tang
 * @date 2023/4/7
 */
public class RepairPlaceParentRoute {

    private Long value;
    private String label;
    private Long parentId;

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

}
