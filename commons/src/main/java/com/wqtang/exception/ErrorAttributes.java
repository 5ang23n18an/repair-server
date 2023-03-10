package com.wqtang.exception;

import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.request.WebRequest;

import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Component
public class ErrorAttributes extends DefaultErrorAttributes {

    /**
     * errorAttributes: timestamp, path, error, errorCode, message, extraMessage
     *
     * @param webRequest
     * @param options
     * @return
     */
    @Override
    public Map<String, Object> getErrorAttributes(WebRequest webRequest, ErrorAttributeOptions options) {
        Map<String, Object> errorAttributes = CollectionUtils.newHashMap(6);
        long timestamp = System.currentTimeMillis();
        String path = (String) webRequest.getAttribute("javax.servlet.error.request_uri", 0);
        if (StringUtils.isBlank(path)) {
            path = webRequest.getContextPath();
        }
        String errorStr = StringUtils.EMPTY, message = StringUtils.EMPTY, extraMessage = StringUtils.EMPTY;
        int errorCode = 0;
        Throwable exception = getError(webRequest);
        if (exception instanceof BusinessException) {
            BusinessException businessException = (BusinessException) exception;
            errorStr = businessException.getErrorEnum().name();
            errorCode = businessException.getErrorEnum().getErrorCode();
            message = businessException.getMessage();
            extraMessage = businessException.getExtraMessage();
        }
        errorAttributes.put("timestamp", timestamp);
        errorAttributes.put("path", path);
        errorAttributes.put("error", errorStr);
        errorAttributes.put("errorCode", errorCode);
        errorAttributes.put("message", message);
        errorAttributes.put("extraMessage", extraMessage);
        return errorAttributes;
    }

}
