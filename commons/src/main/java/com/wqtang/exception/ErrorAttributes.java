package com.wqtang.exception;

import com.google.common.collect.Maps;
import com.wqtang.util.ServletUtils;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.WebRequest;

import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Component
public class ErrorAttributes extends DefaultErrorAttributes {

    /**
     * 包含6类信息: timestamp, path, error, errorCode, message
     *
     * @param webRequest
     * @param options
     * @return
     */
    @Override
    public Map<String, Object> getErrorAttributes(WebRequest webRequest, ErrorAttributeOptions options) {
        Map<String, Object> errorAttributes = Maps.newLinkedHashMapWithExpectedSize(6);
        long timestamp = System.currentTimeMillis();
        String path = ServletUtils.getHttpServletRequest().getRequestURI();
        Throwable exception = getError(webRequest);
        BusinessException businessException = exception instanceof BusinessException ? ((BusinessException) exception) : ((BusinessException) exception.getCause());
        String errorStr = businessException.getErrorEnum().name();
        int errorCode = businessException.getErrorEnum().getErrorCode();
        String message = businessException.getMessage();
        errorAttributes.put("timestamp", timestamp);
        errorAttributes.put("path", path);
        errorAttributes.put("error", errorStr);
        errorAttributes.put("errorCode", errorCode);
        errorAttributes.put("message", message);
        return errorAttributes;
    }

}
