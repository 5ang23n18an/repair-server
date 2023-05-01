package com.wqtang.object.vo.response;

import com.wqtang.object.enumerate.ErrorEnum;
import org.springframework.http.HttpStatus;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class Response {

    private int code;
    private Object message;

    public Response() {
    }

    public Response(int code, Object message) {
        this.code = code;
        this.message = message;
    }

    public static Response success() {
        return success(null);
    }

    public static Response success(Object message) {
        return new Response(HttpStatus.OK.value(), message);
    }

    public static Response error(ErrorEnum errorEnum) {
        return error(errorEnum, errorEnum.getMessage());
    }

    public static Response error(ErrorEnum errorEnum, Object message) {
        return new Response(errorEnum.getHttpStatus().value(), message);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getMessage() {
        return message;
    }

    public void setMessage(Object message) {
        this.message = message;
    }

}
