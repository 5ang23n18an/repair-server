package com.wqtang.object.vo.response.ip;

/**
 * @author Wenqian Tang
 * @date 2023/4/30
 */
public class IPServiceResponse {

    /**
     * 117.143.148.161
     */
    private String ip;

    /**
     * 上海市
     */
    private String pro;

    /**
     * 310000
     */
    private String proCode;

    /**
     * 上海市
     */
    private String city;

    /**
     * 310000
     */
    private String cityCode;

    private String region;

    private String regionCode;

    private String regionNames;

    /**
     * 上海市 移通
     */
    private String addr;

    private String err;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public String getRegionNames() {
        return regionNames;
    }

    public void setRegionNames(String regionNames) {
        this.regionNames = regionNames;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getErr() {
        return err;
    }

    public void setErr(String err) {
        this.err = err;
    }

}
