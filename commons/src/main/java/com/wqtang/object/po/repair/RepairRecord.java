package com.wqtang.object.po.repair;

import com.wqtang.object.po.BaseEntity;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
public class RepairRecord extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 线路id
     */
    private Long routeId;
    private String routeName;

    /**
     * 车站id
     */
    private Long stationId;
    private String stationName;

    /**
     * 道岔号id
     */
    private Long switchId;
    private String switchName;

    /**
     * 类型
     */
    private String type;

    /**
     * 描述
     */
    private String description;

    /**
     * 文件1
     */
    private String file1;

    /**
     * 文件2
     */
    private String file2;

    /**
     * 文件3
     */
    private String file3;

    /**
     * 文件4
     */
    private String file4;

    /**
     * 是否有效 0：有效 1：失效
     */
    private String delFlag;

    /**
     * stationList
     */
    private List<Long> stationList;

    private RepairFileResult rowOneTwo;

    private RepairFileResult rowThreeFour;

    private List<RepairRecord> machines;

    private List<RepairTest> machineList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRouteId() {
        return routeId;
    }

    public void setRouteId(Long routeId) {
        this.routeId = routeId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public Long getStationId() {
        return stationId;
    }

    public void setStationId(Long stationId) {
        this.stationId = stationId;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public Long getSwitchId() {
        return switchId;
    }

    public void setSwitchId(Long switchId) {
        this.switchId = switchId;
    }

    public String getSwitchName() {
        return switchName;
    }

    public void setSwitchName(String switchName) {
        this.switchName = switchName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public List<Long> getStationList() {
        return stationList;
    }

    public void setStationList(List<Long> stationList) {
        this.stationList = stationList;
    }

    public RepairFileResult getRowOneTwo() {
        return rowOneTwo;
    }

    public void setRowOneTwo(RepairFileResult rowOneTwo) {
        this.rowOneTwo = rowOneTwo;
    }

    public RepairFileResult getRowThreeFour() {
        return rowThreeFour;
    }

    public void setRowThreeFour(RepairFileResult rowThreeFour) {
        this.rowThreeFour = rowThreeFour;
    }

    public List<RepairRecord> getMachines() {
        return machines;
    }

    public void setMachines(List<RepairRecord> machines) {
        this.machines = machines;
    }

    public List<RepairTest> getMachineList() {
        return machineList;
    }

    public void setMachineList(List<RepairTest> machineList) {
        this.machineList = machineList;
    }

}
