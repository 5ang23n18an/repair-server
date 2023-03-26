package com.wqtang.object.enumerate;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
public enum UserStatus {

    OK("0", "正常"),
    DISABLED("1", "停用"),
    DELETED("2", "删除"),
    ;

    private final String code;
    private final String info;

    UserStatus(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }

}
