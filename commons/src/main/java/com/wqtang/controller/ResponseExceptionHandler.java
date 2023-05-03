package com.wqtang.controller;

import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.vo.response.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author Wenqian Tang
 * @date 2023/5/1
 */
@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
public class ResponseExceptionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(ResponseExceptionHandler.class);

    @ExceptionHandler(BusinessException.class)
    public Response handleBusinessException(BusinessException e) {
        LOGGER.error("error message is {}", e.getMessage(), e);
        return Response.error(e.getErrorEnum(), e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public Response handleException(Exception e) {
        LOGGER.error("error message is {}", e.getMessage(), e);
        return Response.error(ErrorEnum.ERROR, e.getMessage());
    }

}
