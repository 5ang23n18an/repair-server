package com.wqtang.object.domain.server;

import com.wqtang.util.DecimalUtils;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class CPU {

    /**
     * 核心数
     */
    private int cpuNum;

    /**
     * CPU总的使用率
     */
    private double total;

    /**
     * CPU系统使用率
     */
    private double system;

    /**
     * CPU用户使用率
     */
    private double used;

    /**
     * CPU当前等待率
     */
    private double iowait;

    /**
     * CPU当前空闲率
     */
    private double free;

    public int getCpuNum() {
        return cpuNum;
    }

    public void setCpuNum(int cpuNum) {
        this.cpuNum = cpuNum;
    }

    public double getTotal() {
        return DecimalUtils.round(DecimalUtils.mul(total, 100), 2);
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getSystem() {
        return DecimalUtils.round(DecimalUtils.mul(system / total, 100), 2);
    }

    public void setSystem(double system) {
        this.system = system;
    }

    public double getUsed() {
        return DecimalUtils.round(DecimalUtils.mul(used / total, 100), 2);
    }

    public void setUsed(double used) {
        this.used = used;
    }

    public double getIowait() {
        return DecimalUtils.round(DecimalUtils.mul(iowait / total, 100), 2);
    }

    public void setIowait(double iowait) {
        this.iowait = iowait;
    }

    public double getFree() {
        return DecimalUtils.round(DecimalUtils.mul(free / total, 100), 2);
    }

    public void setFree(double free) {
        this.free = free;
    }

}
