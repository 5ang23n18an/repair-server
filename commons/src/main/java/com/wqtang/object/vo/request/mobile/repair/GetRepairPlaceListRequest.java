package com.wqtang.object.vo.request.mobile.repair;

import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/3/11
 */
public class GetRepairPlaceListRequest extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private String id;

    /**
     * 名称
     */
    private String name;

    /**
     * 类型
     */
    private Integer type;

    /**
     * 编号
     */
    private Long switchNo;

    /**
     * 维护部
     */
    private String dep;

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
     * 父菜单ID
     */
    private Long parentId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getSwitchNo() {
        return switchNo;
    }

    public void setSwitchNo(Long switchNo) {
        this.switchNo = switchNo;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
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

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

}
