package com.wqtang.object.domain.server;

import com.wqtang.util.DecimalUtils;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class JVM {

    private static final int ONE_MB = 1024 * 1024;

    /**
     * 当前JVM占用的内存总数(MB)
     */
    private double total;

    /**
     * JVM最大可用内存总数(MB)
     */
    private double max;

    /**
     * JVM空闲内存(M)
     */
    private double free;

    /**
     * JDK版本
     */
    private String version;

    /**
     * JDK路径
     */
    private String home;

    public double getTotal() {
        return DecimalUtils.div(total, ONE_MB, 2);
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getMax() {
        return DecimalUtils.div(max, ONE_MB, 2);
    }

    public void setMax(double max) {
        this.max = max;
    }

    public double getFree() {
        return DecimalUtils.div(free, ONE_MB, 2);
    }

    public void setFree(double free) {
        this.free = free;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

}
