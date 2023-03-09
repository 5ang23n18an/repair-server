package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum ErrorEnum {

    ERROR(500000, "Oops...Seems to occur a server error", "啊哦...看起来服务器产生了异常"),
    BUSINESS_REFUSE(500100, "For business reasons, your operation is refused", "由于业务原因，您的操作被拒绝了"),
    INVALID_RANDOM_CODE(500101, "Invalid random code, please recheck it", "无效的随机生成码，请重新检查"),
    FILE_WRITE_FAIL(500200, "Failed to write file", "文件写入失败"),
    FILE_READ_FAIL(500201, "Failed to read file", "文件读取失败"),
    ;

    private int errorCode;
    private String messageEn;
    private String messageCn;

    ErrorEnum(int errorCode, String messageEn, String messageCn) {
        this.errorCode = errorCode;
        this.messageEn = messageEn;
        this.messageCn = messageCn;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getMessageEn() {
        return messageEn;
    }

    public void setMessageEn(String messageEn) {
        this.messageEn = messageEn;
    }

    public String getMessageCn() {
        return messageCn;
    }

    public void setMessageCn(String messageCn) {
        this.messageCn = messageCn;
    }

}
