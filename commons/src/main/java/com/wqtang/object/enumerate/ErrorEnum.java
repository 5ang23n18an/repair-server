package com.wqtang.object.enumerate;

import org.springframework.http.HttpStatus;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum ErrorEnum {

    // 500xxx
    ERROR(500000, HttpStatus.INTERNAL_SERVER_ERROR, "Oops...Seems to occur a server error", "啊哦...看起来服务器产生了异常"),
    FILE_WRITE_FAIL(500100, HttpStatus.INTERNAL_SERVER_ERROR, "Failed to write file", "文件写入失败"),
    FILE_READ_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "Failed to read file", "文件读取失败"),
    FILE_DOWNLOAD_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "Failed to download file", "文件下载失败"),
    FILE_UPLOAD_FAIL(500101, HttpStatus.INTERNAL_SERVER_ERROR, "Failed to upload file", "文件上传失败"),

    // 401xxx
    UNAUTHORIZED(401000, HttpStatus.UNAUTHORIZED, "Unauthorized", "未经授权"),

    // 403xxx
    BUSINESS_REFUSE(403000, HttpStatus.FORBIDDEN, "For business reasons, your operation is refused", "由于业务原因，您的操作被拒绝了"),

    // 404xxx
    USER_NOT_FOUND(404000, HttpStatus.NOT_FOUND, "User not found", "用户不存在"),
    ;

    private final int errorCode;
    private final HttpStatus httpStatus;
    private final String messageEn;
    private final String messageCn;

    ErrorEnum(int errorCode, HttpStatus httpStatus, String messageEn, String messageCn) {
        this.errorCode = errorCode;
        this.httpStatus = httpStatus;
        this.messageEn = messageEn;
        this.messageCn = messageCn;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public String getMessageEn() {
        return messageEn;
    }

    public String getMessageCn() {
        return messageCn;
    }

}
