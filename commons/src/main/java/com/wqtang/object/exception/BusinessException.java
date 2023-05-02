package com.wqtang.object.exception;

import com.wqtang.object.enumerate.ErrorEnum;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class BusinessException extends RuntimeException {

    private ErrorEnum errorEnum;

    public BusinessException() {
        this(ErrorEnum.ERROR);
    }

    public BusinessException(ErrorEnum errorEnum) {
        this(errorEnum, errorEnum.getMessage());
    }

    public BusinessException(ErrorEnum errorEnum, String message) {
        super(message);
        this.errorEnum = errorEnum;
    }

    public BusinessException(Exception e) {
        super(e.getMessage());
        this.errorEnum = ErrorEnum.ERROR;
    }

    public ErrorEnum getErrorEnum() {
        return errorEnum;
    }

    public void setErrorEnum(ErrorEnum errorEnum) {
        this.errorEnum = errorEnum;
    }

}
