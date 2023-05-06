package com.wqtang.object.po.system;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.wqtang.object.po.BaseEntity;

import java.util.Date;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@ColumnWidth(20)
public class SystemLoginLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 访问日志id
     */
    @ExcelProperty("序号")
    private Long logId;

    /**
     * 用户账号
     */
    @ExcelProperty("用户账号")
    private String username;

    /**
     * 登录状态 0成功 1失败
     */
    @ExcelProperty("登录状态")
    private String status;

    /**
     * 登录IP地址
     */
    @ExcelProperty("登录地址")
    private String ipaddr;

    /**
     * 登录地点
     */
    @ExcelProperty("登录地点")
    private String loginLocation;

    /**
     * 浏览器类型
     */
    @ExcelProperty("浏览器")
    private String browser;

    /**
     * 操作系统
     */
    @ExcelProperty("操作系统")
    private String os;

    /**
     * 提示消息
     */
    @ExcelProperty("提示消息")
    private String msg;

    /**
     * 访问时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelProperty("访问时间")
    private Date loginTime;

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIpaddr() {
        return ipaddr;
    }

    public void setIpaddr(String ipaddr) {
        this.ipaddr = ipaddr;
    }

    public String getLoginLocation() {
        return loginLocation;
    }

    public void setLoginLocation(String loginLocation) {
        this.loginLocation = loginLocation;
    }

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

}
