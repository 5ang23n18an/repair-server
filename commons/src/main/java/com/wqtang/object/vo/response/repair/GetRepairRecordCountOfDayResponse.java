package com.wqtang.object.vo.response.repair;

import java.util.Date;

/**
 * @author Wenqian Tang
 * @date 2023/3/22
 */
public class GetRepairRecordCountOfDayResponse {

    private Date createTime;
    private float rowOneTwo;
    private float rowThreeFour;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
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
