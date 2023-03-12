package com.wqtang.object.vo.response;

import com.wqtang.object.enumerate.ErrorEnum;
import org.springframework.http.HttpStatus;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class Response {

    private int code;
    private String message;
    private Object extraMessage;

    public Response() {
    }

    public Response(int code, String message, Object extraMessage) {
        this.code = code;
        this.message = message;
        this.extraMessage = extraMessage;
    }

    public static Response success() {
        return success(null);
    }

    public static Response success(Object extraMessage) {
        return new Response(HttpStatus.OK.value(), "Success", extraMessage);
    }

    public static Response error(ErrorEnum errorEnum) {
        return error(errorEnum, null);
    }

    public static Response error(ErrorEnum errorEnum, Object extraMessage) {
        return new Response(errorEnum.getErrorCode(), errorEnum.getMessageEn(), extraMessage);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getExtraMessage() {
        return extraMessage;
    }

    public void setExtraMessage(Object extraMessage) {
        this.extraMessage = extraMessage;
    }

}
