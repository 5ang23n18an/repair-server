package com.wqtang.object.domain.server;

import com.google.common.collect.Lists;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class Server {

    /**
     * CPU相关信息
     */
    private CPU cpu;

    /**
     * 内存相关信息
     */
    private Memory memory;

    /**
     * JVM相关信息
     */
    private JVM jvm;

    /**
     * 系统相关信息
     */
    private System system;

    /**
     * 磁盘相关信息
     */
    private List<Disk> diskList;

    public Server() {
        this.cpu = new CPU();
        this.memory = new Memory();
        this.jvm = new JVM();
        this.system = new System();
        this.diskList = Lists.newLinkedList();
    }

    public CPU getCpu() {
        return cpu;
    }

    public void setCpu(CPU cpu) {
        this.cpu = cpu;
    }

    public Memory getMemory() {
        return memory;
    }

    public void setMemory(Memory memory) {
        this.memory = memory;
    }

    public JVM getJvm() {
        return jvm;
    }

    public void setJvm(JVM jvm) {
        this.jvm = jvm;
    }

    public System getSystem() {
        return system;
    }

    public void setSystem(System system) {
        this.system = system;
    }

    public List<Disk> getDiskList() {
        return diskList;
    }

    public void setDiskList(List<Disk> diskList) {
        this.diskList = diskList;
    }

}
