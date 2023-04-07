package com.wqtang.object.vo;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/26
 */
public class TreeListInfo {

    private List<Long> keys;
    private List<TreeInfo> info;

    public List<Long> getKeys() {
        return keys;
    }

    public void setKeys(List<Long> keys) {
        this.keys = keys;
    }

    public List<TreeInfo> getInfo() {
        return info;
    }

    public void setInfo(List<TreeInfo> info) {
        this.info = info;
    }

}
