package com.wqtang.api.monitor;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.wqtang.object.annotation.OperationLog;
import com.wqtang.object.domain.user.OnlineUser;
import com.wqtang.object.enumerate.BusinessType;
import com.wqtang.object.enumerate.OperatorType;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.po.user.LoginUser;
import com.wqtang.util.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
@RestController
@RequestMapping("/monitor/onlineUser")
public class MonitorOnlineUserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MonitorOnlineUserController.class);

    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    /**
     * 获取当前在线用户信息列表
     *
     * @param ipaddr
     * @param username
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public PageInfo<OnlineUser> getPage(String ipaddr, String username,
                                        @RequestParam(required = false, defaultValue = "1", value = "pageNumber") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "20", value = "pageSize") int pageSize) {
        LOGGER.info("ipaddr = {}, username = {},\r\npageNumber = {}, pageSize = {}", ipaddr, username, pageNumber, pageSize);
        PageHelper.startPage(pageNumber, pageSize);
        List<OnlineUser> list = Lists.newArrayList();
        for (String key : redisUtils.keysMatchPrefix(RedisKeyEnum.LOGIN_TOKEN.getPrefix())) {
            LoginUser loginUser = redisUtils.getAndCast(key, LoginUser.class);
            if (loginUser == null) {
                continue;
            }
            if (StringUtils.isAllBlank(ipaddr, username)) {
                list.add(convertLoginUserToOnlineUser(loginUser));
                continue;
            }
            if (StringUtils.isNoneBlank(ipaddr, username)) {
                if (ipaddr.equals(loginUser.getIpAddr()) && username.equals(loginUser.getUsername())) {
                    list.add(convertLoginUserToOnlineUser(loginUser));
                }
                continue;
            }
            if (StringUtils.isNotBlank(ipaddr)) {
                if (ipaddr.equals(loginUser.getIpAddr())) {
                    list.add(convertLoginUserToOnlineUser(loginUser));
                }
                continue;
            }
            if (StringUtils.isNotBlank(username)) {
                if (username.equals(loginUser.getUsername())) {
                    list.add(convertLoginUserToOnlineUser(loginUser));
                }
            }
        }
        Collections.reverse(list);
        return new PageInfo<>(list);
    }

    private OnlineUser convertLoginUserToOnlineUser(LoginUser loginUser) {
        OnlineUser onlineUser = new OnlineUser();
        onlineUser.setToken(loginUser.getToken());
        onlineUser.setUsername(loginUser.getUsername());
        if (loginUser.getUser() != null && loginUser.getUser().getDept() != null) {
            onlineUser.setDeptName(loginUser.getUser().getDept().getDeptName());
        }
        onlineUser.setIpaddr(loginUser.getIpAddr());
        onlineUser.setLoginLocation(loginUser.getLoginLocation());
        onlineUser.setBrowser(loginUser.getBrowser());
        onlineUser.setOs(loginUser.getOs());
        onlineUser.setLoginTime(loginUser.getLoginTime());
        return onlineUser;
    }

    /**
     * 强退用户
     *
     * @param token
     */
    @DeleteMapping("/forceLogout")
    @OperationLog(title = "在线用户", businessType = BusinessType.FORCE, operatorType = OperatorType.ADMIN)
    public void forceLogout(String token) {
        redisUtils.delete(RedisUtils.getRedisKey(RedisKeyEnum.LOGIN_TOKEN, token));
    }

}
