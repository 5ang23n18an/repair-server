package com.wqtang.exception;

import com.wqtang.object.enumerate.ErrorEnum;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class BusinessException extends RuntimeException {

    private ErrorEnum errorEnum;

    public BusinessException() {
    }

    public BusinessException(ErrorEnum errorEnum) {
        this(errorEnum, errorEnum.getMessage());
    }

    public BusinessException(ErrorEnum errorEnum, String message) {
        super(message);
        this.errorEnum = errorEnum;
    }

    public ErrorEnum getErrorEnum() {
        return errorEnum;
    }

    public void setErrorEnum(ErrorEnum errorEnum) {
        this.errorEnum = errorEnum;
    }

}
