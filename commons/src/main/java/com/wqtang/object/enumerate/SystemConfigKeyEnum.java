package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum SystemConfigKeyEnum {

    CAPTCHA("captcha"),
    REGISTER("register"),
    ;

    private String configKey;

    SystemConfigKeyEnum(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

}
