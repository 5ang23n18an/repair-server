package com.wqtang.object.domain.server;

import com.wqtang.util.DecimalUtils;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class Memory {

    private static final int ONE_GB = 1024 * 1024 * 1024;

    /**
     * 内存总量(GB)
     */
    private double total;

    /**
     * 已用内存(GB)
     */
    private double used;

    /**
     * 剩余内存(GB)
     */
    private double free;

    public double getTotal() {
        return DecimalUtils.div(total, ONE_GB, 2);
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getUsed() {
        return DecimalUtils.div(used, ONE_GB, 2);
    }

    public void setUsed(double used) {
        this.used = used;
    }

    public double getFree() {
        return DecimalUtils.div(free, ONE_GB, 2);
    }

    public void setFree(double free) {
        this.free = free;
    }

}
