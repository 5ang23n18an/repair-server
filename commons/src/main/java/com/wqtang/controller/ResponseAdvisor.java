package com.wqtang.controller;

import com.wqtang.object.vo.response.Response;
import com.wqtang.util.JsonUtils;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * @author Wenqian Tang
 * @date 2023/3/12
 */
@RestControllerAdvice(basePackages = {"com.wqtang.api"})
public class ResponseAdvisor implements ResponseBodyAdvice<Object> {

    /**
     * 负责判断何时才需要对"响应信息"做额外处理
     *
     * @param returnType
     * @param converterType
     * @return 如果结果为true, 则会继续调用下面的 beforeBodyWrite() 方法, 对"响应信息"做具体的处理
     */
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        // 如果一个Controller层的接口方法的返回类型不是 Response 类型或 ResponseEntity 类型, 才需要对它进行额外处理, 封装成 Response 类型
        Class<?> parameterType = returnType.getParameterType();
        return !(parameterType.isAssignableFrom(Response.class) || parameterType.isAssignableFrom(ResponseEntity.class));
    }

    /**
     * 对 response 进行具体的处理
     *
     * @param body
     * @param returnType
     * @param selectedContentType
     * @param selectedConverterType
     * @param request
     * @param response
     * @return 处理后的"响应信息", 返回给前端
     */
    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        Response myResponse = Response.success(body);
        return body instanceof String ? JsonUtils.getJson(myResponse) : myResponse;
    }

}
