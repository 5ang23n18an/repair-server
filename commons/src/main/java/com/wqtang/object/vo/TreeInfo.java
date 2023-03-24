package com.wqtang.object.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.wqtang.object.po.system.SystemDepartment;
import com.wqtang.object.po.system.SystemMenu;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Wenqian Tang
 * @date 2023/3/23
 */
public class TreeInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 节点ID
     */
    private Long id;

    /**
     * 节点名称
     */
    private String label;

    /**
     * 子节点
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeInfo> children;

    public TreeInfo(SystemDepartment department) {
        this.id = department.getDeptId();
        this.label = department.getDeptName();
        this.children = department.getChildren().stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    public TreeInfo(SystemMenu menu) {
        this.id = menu.getMenuId();
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(TreeInfo::new).collect(Collectors.toList());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<TreeInfo> getChildren() {
        return children;
    }

    public void setChildren(List<TreeInfo> children) {
        this.children = children;
    }

}
