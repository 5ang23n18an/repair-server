package com.wqtang.object.po.repair;

import com.alibaba.excel.annotation.ExcelProperty;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
public class RepairTest extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 检修记录id
     */
    @ExcelProperty("检修记录id")
    private Long recordId;

    /**
     * 检修内容
     */
    @ExcelProperty("检修内容")
    private String label;

    /**
     * 状态
     */
    @ExcelProperty("状态")
    private String status;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    private Integer sortNo;

    /**
     * 是否有效 0：有效 1：失效
     */
    @ExcelProperty("是否有效 0：有效 1：失效")
    private Integer isDelete;

    /**
     * 文件1
     */
    @ExcelProperty("文件1")
    private String file1;

    /**
     * 文件2
     */
    @ExcelProperty("文件2")
    private String file2;

    /**
     * 文件3
     */
    @ExcelProperty("文件3")
    private String file3;

    /**
     * 文件4
     */
    @ExcelProperty("文件4")
    private String file4;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1;
    }

    public String getFile2() {
        return file2;
    }

    public void setFile2(String file2) {
        this.file2 = file2;
    }

    public String getFile3() {
        return file3;
    }

    public void setFile3(String file3) {
        this.file3 = file3;
    }

    public String getFile4() {
        return file4;
    }

    public void setFile4(String file4) {
        this.file4 = file4;
    }

}
