package com.wqtang.util;

import com.wqtang.object.vo.response.ip.IPServiceResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Collections;

/**
 * @author Wenqian Tang
 * @date 2023/3/15
 */
@Component
public class IPAddressUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(IPAddressUtils.class);

    @Resource(name = "restTemplate")
    private RestTemplate restTemplate;

    public static String getIPAddressFromHttpServletRequest() {
        String unknownIP = "unknown", blankIP = "0:0:0:0:0:0:0:1";
        HttpServletRequest httpServletRequest = ServletUtils.getHttpServletRequest();
        String ipAddress = httpServletRequest.getHeader(com.google.common.net.HttpHeaders.X_FORWARDED_FOR);
        if (StringUtils.isNotEmpty(ipAddress) && !unknownIP.equalsIgnoreCase(ipAddress)) {
            if (ipAddress.contains(",")) {
                return ipAddress.split(",")[0];
            }
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("Cdn-Src-Ip");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("HTTP_CLIENT_IP");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("X-Real-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || unknownIP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getRemoteAddr();
        }
        if (blankIP.equals(ipAddress)) {
            try {
                ipAddress = InetAddress.getLocalHost().getHostAddress();
            } catch (Exception e) {
                LOGGER.error("error message is {}", e.getMessage(), e);
            }
        }
        return ipAddress;
    }

    public String getLocationByIPAddress(String ipAddress) {
        String internal = "内网IP", unknown = "未知";
        if (StringUtils.equalsAny(ipAddress, "127.0.0.1", "localhost")) {
            return internal;
        }
        // 提供IP地理位置查询服务的链接
        String serviceUrl = "http://whois.pconline.com.cn/ipJson.jsp?ip={ipAddress}&json=true";
        ResponseEntity<IPServiceResponse> responseEntity;
        try {
            responseEntity = restTemplate.exchange(serviceUrl, HttpMethod.GET, new HttpEntity<>(getHttpHeaders()), IPServiceResponse.class, ipAddress);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            return unknown;
        }
        IPServiceResponse serviceResponse = responseEntity.getBody();
        if (serviceResponse == null) {
            return unknown;
        }
        return serviceResponse.getPro() + StringUtils.SPACE + serviceResponse.getCity();
    }

    private HttpHeaders getHttpHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.ALL));
        headers.setConnection(com.google.common.net.HttpHeaders.KEEP_ALIVE);
        return headers;
    }

    public static String getHostIP() {
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            return "127.0.0.1";
        }
    }

    public static String getHostName() {
        try {
            return InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            return "未知";
        }
    }

}
