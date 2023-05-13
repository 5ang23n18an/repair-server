package com.wqtang.api.monitor;

import com.wqtang.object.domain.server.System;
import com.wqtang.object.domain.server.*;
import com.wqtang.util.DecimalUtils;
import com.wqtang.util.IPAddressUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;
import oshi.util.Util;

import java.util.List;
import java.util.Properties;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/server")
public class MonitorServerController {

    /**
     * 获取服务器的资源信息
     *
     * @return
     */
    @GetMapping
    public Server getInfo() {
        Server server = new Server();
        SystemInfo systemInfo = new SystemInfo();
        HardwareAbstractionLayer hardware = systemInfo.getHardware();
        setCpuInfo(server.getCpu(), hardware.getProcessor());
        setMemoryInfo(server.getMemory(), hardware.getMemory());
        setSystemInfo(server.getSystem());
        setJvmInfo(server.getJvm());
        setDiskInfo(server.getDiskList(), systemInfo.getOperatingSystem());
        return server;
    }

    private void setCpuInfo(CPU cpu, CentralProcessor processor) {
        long[] preTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(1000);
        long[] curTicks = processor.getSystemCpuLoadTicks();
        long user = curTicks[CentralProcessor.TickType.USER.getIndex()] - preTicks[CentralProcessor.TickType.USER.getIndex()],
                nice = curTicks[CentralProcessor.TickType.NICE.getIndex()] - preTicks[CentralProcessor.TickType.NICE.getIndex()],
                system = curTicks[CentralProcessor.TickType.SYSTEM.getIndex()] - preTicks[CentralProcessor.TickType.SYSTEM.getIndex()],
                idle = curTicks[CentralProcessor.TickType.IDLE.getIndex()] - preTicks[CentralProcessor.TickType.IDLE.getIndex()],
                iowait = curTicks[CentralProcessor.TickType.IOWAIT.getIndex()] - preTicks[CentralProcessor.TickType.IOWAIT.getIndex()],
                irq = curTicks[CentralProcessor.TickType.IRQ.getIndex()] - preTicks[CentralProcessor.TickType.IRQ.getIndex()],
                softirq = curTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()] - preTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()],
                steal = curTicks[CentralProcessor.TickType.STEAL.getIndex()] - preTicks[CentralProcessor.TickType.STEAL.getIndex()],
                total = user + nice + system + idle + iowait + irq + softirq + steal;
        cpu.setTotal(total);
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setUsed(user);
        cpu.setSystem(system);
        cpu.setFree(idle);
        cpu.setIowait(iowait);
    }

    private void setMemoryInfo(Memory memory, GlobalMemory globalMemory) {
        long total = globalMemory.getTotal(), available = globalMemory.getAvailable();
        memory.setTotal(total);
        memory.setUsed(total - available);
        memory.setFree(available);
    }

    private void setSystemInfo(System system) {
        Properties properties = java.lang.System.getProperties();
        system.setComputerName(IPAddressUtils.getHostName());
        system.setComputerIp(IPAddressUtils.getHostIP());
        system.setOsName(properties.getProperty("os.name"));
        system.setOsArch(properties.getProperty("os.arch"));
        system.setUserDir(properties.getProperty("user.dir"));
    }

    private void setJvmInfo(JVM jvm) {
        Properties properties = java.lang.System.getProperties();
        jvm.setTotal(Runtime.getRuntime().totalMemory());
        jvm.setMax(Runtime.getRuntime().maxMemory());
        jvm.setFree(Runtime.getRuntime().freeMemory());
        jvm.setVersion(properties.getProperty("java.version"));
        jvm.setHome(properties.getProperty("java.home"));
    }

    private void setDiskInfo(List<Disk> diskList, OperatingSystem os) {
        FileSystem fileSystem = os.getFileSystem();
        for (OSFileStore fileStore : fileSystem.getFileStores()) {
            long free = fileStore.getUsableSpace(),
                    total = fileStore.getTotalSpace(),
                    used = total - free;
            Disk disk = new Disk();
            disk.setDirName(fileStore.getMount());
            disk.setSysTypeName(fileStore.getType());
            disk.setTypeName(fileStore.getName());
            disk.setTotal(sizeConverter(total));
            disk.setFree(sizeConverter(free));
            disk.setUsed(sizeConverter(used));
            // 资源的使用率(%) = 已经使用量 / 总量 * 100(%)
            disk.setUsage(DecimalUtils.mul(DecimalUtils.div(used, total, 4), 100));
            diskList.add(disk);
        }
    }

    private String sizeConverter(long size) {
        long kb = 1024L, mb = kb * 1024L, gb = mb * 1024L;
        if (size >= gb) {
            return String.format("%.1f GB", (float) size / gb);
        }
        if (size >= mb) {
            float result = (float) size / mb;
            return String.format(result > 100 ? "%.0f MB" : "%.1f MB", result);
        }
        if (size >= kb) {
            float result = (float) size / kb;
            return String.format(result > 100 ? "%.0f KB" : "%.1f KB", result);
        }
        return String.format("%d B", size);
    }

}
