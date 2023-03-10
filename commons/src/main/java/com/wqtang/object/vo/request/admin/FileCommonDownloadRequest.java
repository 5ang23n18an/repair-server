package com.wqtang.object.vo.request.admin;

/**
 * @author Wenqian Tang
 * @date 2023/3/10
 */
public class FileCommonDownloadRequest {

    private String fileName;
    private Boolean delete;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Boolean getDelete() {
        return delete;
    }

    public void setDelete(Boolean delete) {
        this.delete = delete;
    }

}
