package com.wqtang.object.po.repair;

import com.wqtang.object.po.BaseEntity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
public class RepairPlace extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 类型
     */
    private String type;

    /**
     * 编号
     */
    private String switchNo;

    /**
     * 维护部
     */
    private String dep;

    /**
     * 排序
     */
    private BigDecimal sortNo;

    /**
     * 维护组
     */
    private String org;

    /**
     * 道岔类型
     */
    private String eqtType;

    /**
     * 道岔型号
     */
    private String eqtMode;

    /**
     * 道岔等级
     */
    private String eqtLevel;

    /**
     * 动作
     */
    private String action;

    /**
     * 锁闭方式
     */
    private String lockMode;

    /**
     * 父菜单名称
     */
    private String parentName;

    /**
     * 父菜单ID
     */
    private Long parentId;

    /**
     * 显示顺序
     */
    private Integer orderNum;

    /**
     * 祖级列表
     */
    private String ancestors;

    /**
     * 子部门
     */
    private List<?> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getSwitchNo() {
        return switchNo;
    }

    public void setSwitchNo(String switchNo) {
        this.switchNo = switchNo;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public BigDecimal getSortNo() {
        return sortNo;
    }

    public void setSortNo(BigDecimal sortNo) {
        this.sortNo = sortNo;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }

    public String getEqtType() {
        return eqtType;
    }

    public void setEqtType(String eqtType) {
        this.eqtType = eqtType;
    }

    public String getEqtMode() {
        return eqtMode;
    }

    public void setEqtMode(String eqtMode) {
        this.eqtMode = eqtMode;
    }

    public String getEqtLevel() {
        return eqtLevel;
    }

    public void setEqtLevel(String eqtLevel) {
        this.eqtLevel = eqtLevel;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getLockMode() {
        return lockMode;
    }

    public void setLockMode(String lockMode) {
        this.lockMode = lockMode;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    public List<?> getChildren() {
        if (children == null) {
            children = new ArrayList<>();
        }
        return children;
    }

    public void setChildren(List<?> children) {
        this.children = children;
    }

}
