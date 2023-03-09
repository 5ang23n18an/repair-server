package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum SystemConfigKeyEnum {

    CAPTCHA("captcha"),
    ;

    private String key;

    SystemConfigKeyEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

}
