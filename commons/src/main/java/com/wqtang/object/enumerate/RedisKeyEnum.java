package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/4/6
 */
public enum RedisKeyEnum {

    CAPTCHA("captcha"),
    SYSTEM_CONFIG("system_config"),
    LOGIN_TOKEN("login_token"),
    SYSTEM_DICTIONARY("sys_dict"),
    ;

    private String prefix;

    RedisKeyEnum(String prefix) {
        this.prefix = prefix;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

}
