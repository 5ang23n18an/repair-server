package com.wqtang.util;

import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.util.Collections;
import java.util.Map;

/**
 * @author Wenqian Tang
 * @date 2023/3/15
 */
@Component
public class IPAddressUtils {

    private static final String UNKNOWN_IP = "unknown";
    private static final String BLANK_IP = "0:0:0:0:0:0:0:1";

    @Resource
    private RestTemplate restTemplate;

    public static String getIPAddress() {
        HttpServletRequest httpServletRequest = ServletUtils.getHttpServletRequest();
        String ipAddress = httpServletRequest.getHeader(com.google.common.net.HttpHeaders.X_FORWARDED_FOR);
        if (StringUtils.isNotEmpty(ipAddress) && !UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            if (ipAddress.contains(",")) {
                return ipAddress.split(",")[0];
            }
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("Cdn-Src-Ip");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("HTTP_CLIENT_IP");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getHeader("X-Real-IP");
        }
        if (StringUtils.isEmpty(ipAddress) || UNKNOWN_IP.equalsIgnoreCase(ipAddress)) {
            ipAddress = httpServletRequest.getRemoteAddr();
        }
        if (BLANK_IP.equals(ipAddress)) {
            try {
                ipAddress = InetAddress.getLocalHost().getHostAddress();
            } catch (Exception ignored) {
            }
        }
        return ipAddress;
    }

    public String getLocationByIPAddress(String ipAddress) {
        if (StringUtils.equalsAny(ipAddress, "127.0.0.1", "localhost")) {
            return "内网IP";
        }
        // 提供IP地理位置查询服务的链接
        String serviceUrl = "http://whois.pconline.com.cn/ipJson.jsp?ip={ipAddress}&json=true";
        ResponseEntity<String> responseEntity;
        try {
            responseEntity = restTemplate.exchange(serviceUrl, HttpMethod.GET, new HttpEntity<>(getHttpHeaders()), String.class, ipAddress);
        } catch (Exception e) {
            return "未知";
        }
        String responseBody = responseEntity.getBody();
        if (responseBody == null) {
            return "未知";
        }
        Map map = JsonUtils.readValue(responseBody, Map.class);
        String province = MapUtils.getString(map, "pro"), city = MapUtils.getString(map, "city");
        return province + " " + city;
    }

    private HttpHeaders getHttpHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.ALL));
        headers.setConnection(com.google.common.net.HttpHeaders.KEEP_ALIVE);
        return headers;
    }

}
