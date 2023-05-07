package com.wqtang.object.po.system;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@ColumnWidth(20)
public class SystemRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    @ExcelProperty("角色序号")
    private Long roleId;

    /**
     * 角色名称
     */
    @ExcelProperty("角色名称")
    private String roleName;

    /**
     * 角色权限
     */
    @ExcelProperty("角色权限")
    private String roleKey;

    /**
     * 角色排序
     */
    @ExcelProperty("角色排序")
    private String roleSort;

    /**
     * 数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限；5：仅本人数据权限）
     */
    @ExcelProperty("数据范围")
    private String dataScope;

    /**
     * 菜单树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）
     */
    @ExcelIgnore
    private Boolean menuCheckStrictly;

    /**
     * 部门树选择项是否关联显示（0：父子不互相关联显示 1：父子互相关联显示 ）
     */
    @ExcelIgnore
    private Boolean deptCheckStrictly;

    /**
     * 角色状态（0正常 1停用）
     */
    @ExcelProperty("角色状态")
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @ExcelIgnore
    private String delFlag;

    /**
     * 用户是否存在此角色标识
     */
    @ExcelIgnore
    private boolean flag;

    /**
     * 菜单组
     */
    @ExcelIgnore
    private Long[] menuIds;

    /**
     * 部门组（数据权限）
     */
    @ExcelIgnore
    private Long[] deptIds;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleKey() {
        return roleKey;
    }

    public void setRoleKey(String roleKey) {
        this.roleKey = roleKey;
    }

    public String getRoleSort() {
        return roleSort;
    }

    public void setRoleSort(String roleSort) {
        this.roleSort = roleSort;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    public Boolean isMenuCheckStrictly() {
        return menuCheckStrictly;
    }

    public void setMenuCheckStrictly(Boolean menuCheckStrictly) {
        this.menuCheckStrictly = menuCheckStrictly;
    }

    public Boolean isDeptCheckStrictly() {
        return deptCheckStrictly;
    }

    public void setDeptCheckStrictly(Boolean deptCheckStrictly) {
        this.deptCheckStrictly = deptCheckStrictly;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Long[] getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(Long[] menuIds) {
        this.menuIds = menuIds;
    }

    public Long[] getDeptIds() {
        return deptIds;
    }

    public void setDeptIds(Long[] deptIds) {
        this.deptIds = deptIds;
    }

    @JsonIgnore
    public boolean isAdmin() {
        return isAdmin(this.roleId);
    }

    public static boolean isAdmin(Long roleId) {
        return Long.valueOf(1L).equals(roleId);
    }

}
