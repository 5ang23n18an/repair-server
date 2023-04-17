package com.wqtang.object.po.repair;

import com.alibaba.excel.annotation.ExcelProperty;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
public class RepairTable extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 检修内容
     */
    @ExcelProperty("检修内容")
    private String label;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    private Integer sortNo;

    /**
     * 帐号状态（0正常 1停用）
     */
    @ExcelProperty("帐号状态")
    private String status;

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

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
