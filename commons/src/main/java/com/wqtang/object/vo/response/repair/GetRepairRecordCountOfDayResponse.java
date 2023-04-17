package com.wqtang.object.vo.response.repair;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
public class GetRepairRecordCountOfDayResponse {

    private String createTime;
    private float rowOneTwo;
    private float rowThreeFour;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public float getRowOneTwo() {
        return rowOneTwo;
    }

    public void setRowOneTwo(float rowOneTwo) {
        this.rowOneTwo = rowOneTwo;
    }

    public float getRowThreeFour() {
        return rowThreeFour;
    }

    public void setRowThreeFour(float rowThreeFour) {
        this.rowThreeFour = rowThreeFour;
    }

}
