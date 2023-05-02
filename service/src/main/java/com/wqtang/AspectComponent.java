package com.wqtang;

import com.wqtang.object.annotation.DoAspect;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.enumerate.BusinessStatus;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.po.BaseEntity;
import com.wqtang.object.po.system.SystemOperationLog;
import com.wqtang.system.SystemOperationLogService;
import com.wqtang.util.IPAddressUtils;
import com.wqtang.util.JsonUtils;
import com.wqtang.util.SecurityUtils;
import com.wqtang.util.ServletUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/4/21
 */
@Aspect
@Component
public class AspectComponent {

    private static final Logger LOGGER = LoggerFactory.getLogger(AspectComponent.class);

    @Resource(name = "IPAddressUtils")
    private IPAddressUtils ipAddressUtils;
    @Resource(name = "systemOperationLogService")
    private SystemOperationLogService systemOperationLogService;

    @Before(value = "@annotation(annotation)")
    public void doBefore(JoinPoint joinPoint, DoAspect annotation) {
        BaseEntity request = (BaseEntity) joinPoint.getArgs()[0];
        String username = SecurityUtils.getCurrentUsername();
        LOGGER.info("getCurrentUsername = {}", username);
        if (annotation.businessType() == BusinessType.INSERT) {
            request.setCreateBy(username);
        } else if (annotation.businessType() == BusinessType.UPDATE) {
            request.setUpdateBy(username);
        }
    }

    @AfterReturning(value = "@annotation(annotation)", returning = "responseData")
    public void doAfterReturning(JoinPoint joinPoint, OperationLog annotation, Object responseData) {
        recordOperationLog(joinPoint, annotation, responseData, null);
    }

    @AfterThrowing(value = "@annotation(annotation)", throwing = "exception")
    public void doAfterThrowing(JoinPoint joinPoint, OperationLog annotation, Exception exception) {
        recordOperationLog(joinPoint, annotation, null, exception);
    }

    private void recordOperationLog(JoinPoint joinPoint, OperationLog annotation, Object responseData, Exception exception) {
        SystemOperationLog operationLog = new SystemOperationLog();
        if (exception == null) {
            operationLog.setStatus(BusinessStatus.SUCCESS.ordinal());
        } else {
            operationLog.setStatus(BusinessStatus.FAIL.ordinal());
            operationLog.setErrorMsg(exception.getMessage());
        }
        operationLog.setOperIp(IPAddressUtils.getIPAddressFromHttpServletRequest());
        operationLog.setOperLocation(ipAddressUtils.getLocationByIPAddress(operationLog.getOperIp()));
        operationLog.setOperName(SecurityUtils.getCurrentUsername());
        operationLog.setMethod(methodReference(joinPoint));
        operationLog.setRequestMethod(ServletUtils.getHttpServletRequest().getMethod());
        // 处理注解上携带的信息
        handleAnnotation(joinPoint, annotation, operationLog, responseData);
        // 保存进数据库中
        systemOperationLogService.insert(operationLog);
    }

    private String methodReference(JoinPoint joinPoint) {
        String className = joinPoint.getTarget().getClass().getName(), methodName = joinPoint.getSignature().getName();
        return className + "." + methodName + "()";
    }

    private void handleAnnotation(JoinPoint joinPoint, OperationLog annotation, SystemOperationLog operationLog, Object responseData) {
        operationLog.setBusinessType(annotation.businessType().ordinal());
        operationLog.setTitle(annotation.title());
        operationLog.setOperatorType(annotation.operatorType().ordinal());
        // 是否需要记录请求信息
        if (annotation.isSaveRequestData()) {
            operationLog.setOperParam(getOperParamFromHttpRequest(joinPoint, operationLog));
        }
        // 是否需要记录响应信息
        if (annotation.isSaveResponseData() && responseData != null) {
            operationLog.setJsonResult(JsonUtils.getJson(responseData));
        }
    }

    /**
     * 请求参数拼接
     *
     * @param joinPoint
     * @param operationLog
     * @return
     */
    private String getOperParamFromHttpRequest(JoinPoint joinPoint, SystemOperationLog operationLog) {
        if (!StringUtils.equalsAny(operationLog.getRequestMethod(), HttpMethod.POST.name(), HttpMethod.PUT.name())) {
            Map<?, ?> map = (Map<?, ?>) ServletUtils.getHttpServletRequest().getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
            return map.toString();
        }
        StringBuilder resultBuilder = new StringBuilder();
        Object[] paramArray = joinPoint.getArgs();
        if (ArrayUtils.isNotEmpty(paramArray)) {
            for (Object param : paramArray) {
                if (!isIgnoredParam(param)) {
                    resultBuilder.append(JsonUtils.getJson(param)).append(StringUtils.SPACE);
                }
            }
        }
        if (resultBuilder.length() > 0) {
            // 去除多余的尾空格
            resultBuilder.deleteCharAt(resultBuilder.length() - 1);
        }
        return resultBuilder.toString();
    }

    /**
     * 判断参数是否是不需要记录的
     * 例如: MultipartFile类型不需要进行记录
     *
     * @param param
     * @return
     */
    private boolean isIgnoredParam(Object param) {
        Class<?> clazz = param.getClass();
        if (clazz.isArray()) {
            return clazz.getComponentType().isAssignableFrom(MultipartFile.class);
        }
        if (Collection.class.isAssignableFrom(clazz)) {
            for (Object element : (Collection<?>) param) {
                if (element instanceof MultipartFile) {
                    return true;
                }
            }
            return false;
        }
        if (Map.class.isAssignableFrom(clazz)) {
            Map<?, ?> map = (Map<?, ?>) param;
            for (Map.Entry<?, ?> entry : map.entrySet()) {
                if (entry.getValue() instanceof MultipartFile) {
                    return true;
                }
            }
            return false;
        }
        return param instanceof MultipartFile
                || param instanceof HttpServletRequest
                || param instanceof HttpServletResponse
                || param instanceof BindingResult;
    }

}
