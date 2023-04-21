package com.wqtang.object.annotation;

import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import org.apache.commons.lang3.StringUtils;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author Wenqian Tang
 * @date 2023/4/21
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface OperationLog {

    /**
     * 模块标题
     */
    String title();

    /**
     * 业务类型
     */
    BusinessType businessType();

    /**
     * 操作者类别
     */
    OperatorType operatorType();

    /**
     * 是否需要记录请求信息
     */
    boolean isSaveRequestData() default true;

    /**
     * 是否需要记录响应信息
     */
    boolean isSaveResponseData() default true;

}
