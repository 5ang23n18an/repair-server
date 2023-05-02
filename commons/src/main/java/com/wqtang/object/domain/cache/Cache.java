package com.wqtang.object.domain.cache;

import java.util.List;
import java.util.Properties;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class Cache {

    private Properties info;
    private Long dbSize;
    private List<DataNode> commandStaticsInfo;

    public Properties getInfo() {
        return info;
    }

    public void setInfo(Properties info) {
        this.info = info;
    }

    public Long getDbSize() {
        return dbSize;
    }

    public void setDbSize(Long dbSize) {
        this.dbSize = dbSize;
    }

    public List<DataNode> getCommandStaticsInfo() {
        return commandStaticsInfo;
    }

    public void setCommandStaticsInfo(List<DataNode> commandStaticsInfo) {
        this.commandStaticsInfo = commandStaticsInfo;
    }

    public static class DataNode {

        private String name;
        private String value;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

    }

}
