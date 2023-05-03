package com.wqtang.object.vo.response.file;

/**
 * @author Wenqian Tang
 * @date 2023/4/29
 */
public class FileUploadResponse {

    private String fileName;
    private String url;
    private String flag;
    private String depth;
    private String paramOne;
    private String paramTwo;
    private String paramThree;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getParamOne() {
        return paramOne;
    }

    public void setParamOne(String paramOne) {
        this.paramOne = paramOne;
    }

    public String getParamTwo() {
        return paramTwo;
    }

    public void setParamTwo(String paramTwo) {
        this.paramTwo = paramTwo;
    }

    public String getParamThree() {
        return paramThree;
    }

    public void setParamThree(String paramThree) {
        this.paramThree = paramThree;
    }

}
