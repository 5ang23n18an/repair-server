package com.wqtang.object.enumerate;

import org.springframework.http.HttpStatus;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum ErrorEnum {

    // 500xxx
    ERROR(500000, HttpStatus.INTERNAL_SERVER_ERROR, "啊哦...看起来服务器产生了异常"),
    FILE_WRITE_FAIL(500100, HttpStatus.INTERNAL_SERVER_ERROR, "文件写入失败"),
    FILE_READ_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "文件读取失败"),
    FILE_DOWNLOAD_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "文件下载失败"),
    FILE_UPLOAD_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "文件上传失败"),

    // 401xxx
    UNAUTHORIZED(401000, HttpStatus.UNAUTHORIZED, "未经授权"),

    // 403xxx
    BUSINESS_REFUSE(403000, HttpStatus.FORBIDDEN, "由于业务原因，您的操作被拒绝了"),

    // 404xxx
    USER_NOT_FOUND(404000, HttpStatus.NOT_FOUND, "用户不存在"),
    ;

    private final int errorCode;
    private final HttpStatus httpStatus;
    private final String message;

    ErrorEnum(int errorCode, HttpStatus httpStatus, String message) {
        this.errorCode = errorCode;
        this.httpStatus = httpStatus;
        this.message = message;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public String getMessage() {
        return message;
    }

}
