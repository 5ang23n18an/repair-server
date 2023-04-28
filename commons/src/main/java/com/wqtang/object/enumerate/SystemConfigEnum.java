package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public enum SystemConfigEnum {

    CAPTCHA("captcha"),
    REGISTER("register"),
    DEFAULT_PASSWORD("defaultPassword"),
    SKIN("skin"),
    THEME("theme"),
    ;

    private String configKey;

    SystemConfigEnum(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

}
