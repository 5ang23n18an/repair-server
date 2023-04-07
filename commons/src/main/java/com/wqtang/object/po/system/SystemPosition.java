package com.wqtang.object.po.system;

import com.alibaba.excel.annotation.ExcelProperty;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/4/5
 */
public class SystemPosition extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 岗位序号
     */
    @ExcelProperty("岗位序号")
    private Long postId;

    /**
     * 岗位编码
     */
    @ExcelProperty("岗位编码")
    private String postCode;

    /**
     * 岗位名称
     */
    @ExcelProperty("岗位名称")
    private String postName;

    /**
     * 岗位排序
     */
    @ExcelProperty("岗位排序")
    private String postSort;

    /**
     * 状态（0正常 1停用）
     */
    @ExcelProperty("状态")
    private String status;

    /**
     * 用户是否存在此岗位标识 默认不存在
     */
    private boolean flag;

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getPostSort() {
        return postSort;
    }

    public void setPostSort(String postSort) {
        this.postSort = postSort;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

}
