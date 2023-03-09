package com.wqtang.exception;

import com.wqtang.object.enumerate.ErrorEnum;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class BusinessException extends RuntimeException {

    private ErrorEnum errorEnum;
    private String extraMessage;

    public BusinessException() {
    }

    public BusinessException(ErrorEnum errorEnum) {
        this(errorEnum, errorEnum.getMessageEn(), errorEnum.getMessageCn());
    }

    public BusinessException(ErrorEnum errorEnum, String message) {
        this(errorEnum, message, message);
    }

    public BusinessException(ErrorEnum errorEnum, String messageEn, String messageCn) {
        super(messageEn);
        this.errorEnum = errorEnum;
        this.extraMessage = messageCn;
    }

    public ErrorEnum getErrorEnum() {
        return errorEnum;
    }

    public void setErrorEnum(ErrorEnum errorEnum) {
        this.errorEnum = errorEnum;
    }

    public String getExtraMessage() {
        return extraMessage;
    }

    public void setExtraMessage(String extraMessage) {
        this.extraMessage = extraMessage;
    }

}
