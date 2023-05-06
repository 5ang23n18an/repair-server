package com.wqtang.object.po.repair;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.wqtang.object.po.BaseEntity;

import java.util.Date;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@ColumnWidth(20)
public class RepairInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 道岔编号
     */
    @ExcelProperty("道岔编号")
    private String switchNo;

    /**
     * 线路
     */
    @ExcelProperty("线路")
    private String route;

    /**
     * 车站
     */
    @ExcelProperty("车站")
    private String station;

    /**
     * 维护部
     */
    @ExcelProperty("维护部")
    private String dep;

    /**
     * 维护组
     */
    @ExcelProperty("维护组")
    private String org;

    /**
     * 道岔名称
     */
    @ExcelProperty("道岔名称")
    private String name;

    /**
     * 道岔类型
     */
    @ExcelProperty("道岔类型")
    private String eqtType;

    /**
     * 道岔型号
     */
    @ExcelProperty("道岔型号")
    private String eqtMode;

    /**
     * 道岔等级
     */
    @ExcelProperty("道岔等级")
    private String eqtLevel;

    /**
     * 开向位置
     */
    @ExcelProperty("开向位置")
    private String admitLocation;

    /**
     * 定位闭合
     */
    @ExcelProperty("定位闭合")
    private String positionColsed;

    /**
     * 动作
     */
    @ExcelProperty("动作")
    private String action;

    /**
     * 顺序
     */
    @ExcelProperty("顺序")
    private String sequence;

    /**
     * 锁闭方式
     */
    @ExcelProperty("锁闭方式")
    private String lockMode;

    /**
     * 安装方式
     */
    @ExcelProperty("安装方式")
    private String installationMode;

    /**
     * 安装装置图号
     */
    @ExcelProperty("安装装置图号")
    private String installationDrawingNo;

    /**
     * 外锁闭装置
     */
    @ExcelProperty("外锁闭装置")
    private String externalLockingDevice;

    /**
     * 密贴检查器
     */
    @ExcelProperty("密贴检查器")
    private String pasteChecker;

    /**
     * 电路制式
     */
    @ExcelProperty("电路制式")
    private String circuitStandard;

    /**
     * 表示
     */
    @ExcelProperty("表示")
    private String express;

    /**
     * 道岔安装
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("道岔安装")
    private Date installDate;

    /**
     * 道岔拆卸
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("道岔拆卸")
    private Date unloadingDate;

    /**
     * 线路坐标
     */
    @ExcelProperty("线路坐标")
    private String lineCoordinates;

    /**
     * 线路环境
     */
    @ExcelProperty("线路环境")
    private String lineEnviroment;

    /**
     * 道床类型
     */
    @ExcelProperty("道床类型")
    private String ballastBedType;

    /**
     * 道岔轨道类型
     */
    @ExcelProperty("道岔轨道类型")
    private String switchType;

    /**
     * 钢轨类型
     */
    @ExcelProperty("钢轨类型")
    private String railType;

    /**
     * 道岔号数
     */
    @ExcelProperty("道岔号数")
    private String switchNum;

    /**
     * 工务图号
     */
    @ExcelProperty("工务图号")
    private String drawingNum;

    /**
     * 包保人
     */
    @ExcelProperty("包保人")
    private String responsible;

    /**
     * 锁定
     */
    @ExcelProperty("锁定")
    private String locked;

    /**
     * 道岔图
     */
    @ExcelProperty("道岔图")
    private String pic;

    /**
     * 横坐标
     */
    @ExcelProperty("横坐标")
    private String coordinateX;

    /**
     * 纵坐标
     */
    @ExcelProperty("纵坐标")
    private String coordinateY;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSwitchNo() {
        return switchNo;
    }

    public void setSwitchNo(String switchNo) {
        this.switchNo = switchNo;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEqtType() {
        return eqtType;
    }

    public void setEqtType(String eqtType) {
        this.eqtType = eqtType;
    }

    public String getEqtMode() {
        return eqtMode;
    }

    public void setEqtMode(String eqtMode) {
        this.eqtMode = eqtMode;
    }

    public String getEqtLevel() {
        return eqtLevel;
    }

    public void setEqtLevel(String eqtLevel) {
        this.eqtLevel = eqtLevel;
    }

    public String getAdmitLocation() {
        return admitLocation;
    }

    public void setAdmitLocation(String admitLocation) {
        this.admitLocation = admitLocation;
    }

    public String getPositionColsed() {
        return positionColsed;
    }

    public void setPositionColsed(String positionColsed) {
        this.positionColsed = positionColsed;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public String getLockMode() {
        return lockMode;
    }

    public void setLockMode(String lockMode) {
        this.lockMode = lockMode;
    }

    public String getInstallationMode() {
        return installationMode;
    }

    public void setInstallationMode(String installationMode) {
        this.installationMode = installationMode;
    }

    public String getInstallationDrawingNo() {
        return installationDrawingNo;
    }

    public void setInstallationDrawingNo(String installationDrawingNo) {
        this.installationDrawingNo = installationDrawingNo;
    }

    public String getExternalLockingDevice() {
        return externalLockingDevice;
    }

    public void setExternalLockingDevice(String externalLockingDevice) {
        this.externalLockingDevice = externalLockingDevice;
    }

    public String getPasteChecker() {
        return pasteChecker;
    }

    public void setPasteChecker(String pasteChecker) {
        this.pasteChecker = pasteChecker;
    }

    public String getCircuitStandard() {
        return circuitStandard;
    }

    public void setCircuitStandard(String circuitStandard) {
        this.circuitStandard = circuitStandard;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public Date getInstallDate() {
        return installDate;
    }

    public void setInstallDate(Date installDate) {
        this.installDate = installDate;
    }

    public Date getUnloadingDate() {
        return unloadingDate;
    }

    public void setUnloadingDate(Date unloadingDate) {
        this.unloadingDate = unloadingDate;
    }

    public String getLineCoordinates() {
        return lineCoordinates;
    }

    public void setLineCoordinates(String lineCoordinates) {
        this.lineCoordinates = lineCoordinates;
    }

    public String getLineEnviroment() {
        return lineEnviroment;
    }

    public void setLineEnviroment(String lineEnviroment) {
        this.lineEnviroment = lineEnviroment;
    }

    public String getBallastBedType() {
        return ballastBedType;
    }

    public void setBallastBedType(String ballastBedType) {
        this.ballastBedType = ballastBedType;
    }

    public String getSwitchType() {
        return switchType;
    }

    public void setSwitchType(String switchType) {
        this.switchType = switchType;
    }

    public String getRailType() {
        return railType;
    }

    public void setRailType(String railType) {
        this.railType = railType;
    }

    public String getSwitchNum() {
        return switchNum;
    }

    public void setSwitchNum(String switchNum) {
        this.switchNum = switchNum;
    }

    public String getDrawingNum() {
        return drawingNum;
    }

    public void setDrawingNum(String drawingNum) {
        this.drawingNum = drawingNum;
    }

    public String getResponsible() {
        return responsible;
    }

    public void setResponsible(String responsible) {
        this.responsible = responsible;
    }

    public String getLocked() {
        return locked;
    }

    public void setLocked(String locked) {
        this.locked = locked;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getCoordinateX() {
        return coordinateX;
    }

    public void setCoordinateX(String coordinateX) {
        this.coordinateX = coordinateX;
    }

    public String getCoordinateY() {
        return coordinateY;
    }

    public void setCoordinateY(String coordinateY) {
        this.coordinateY = coordinateY;
    }

}
