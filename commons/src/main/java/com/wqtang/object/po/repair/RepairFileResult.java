package com.wqtang.object.po.repair;

import java.io.Serializable;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
public class RepairFileResult implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键Id
     */
    private Long id;

    /**
     * 测试记录id
     */
    private Long recordId;

    /**
     * 类型(0: 1-2排,1: 3-4排)
     */
    private String rowType;

    /**
     * 状态
     */
    private String flag;

    /**
     * 深度
     */
    private String depth;

    /**
     * 参数一
     */
    private String paramOne;

    /**
     * 参数二
     */
    private String paramTwo;

    /**
     * 参数三
     */
    private String paramThree;

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

    public String getRowType() {
        return rowType;
    }

    public void setRowType(String rowType) {
        this.rowType = rowType;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getParamOne() {
        return paramOne;
    }

    public void setParamOne(String paramOne) {
        this.paramOne = paramOne;
    }

    public String getParamTwo() {
        return paramTwo;
    }

    public void setParamTwo(String paramTwo) {
        this.paramTwo = paramTwo;
    }

    public String getParamThree() {
        return paramThree;
    }

    public void setParamThree(String paramThree) {
        this.paramThree = paramThree;
    }

}
