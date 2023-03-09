package com.wqtang.exception;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/1/22
 */
@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class RequestExceptionHandler extends ResponseEntityExceptionHandler {

    @Resource(name = "errorAttributes")
    private ErrorAttributes errorAttributes;

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<Object> handleBusinessException(BusinessException businessException, WebRequest webRequest) {
        return ResponseEntity
                .status(businessException.getErrorEnum().getErrorCode())
                .body(errorAttributes.getErrorAttributes(webRequest, null));
    }

}
