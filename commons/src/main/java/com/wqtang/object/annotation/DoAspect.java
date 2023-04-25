package com.wqtang.object.annotation;

import com.wqtang.object.enumerate.BusinessType;

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
public @interface DoAspect {

    BusinessType businessType();

}
