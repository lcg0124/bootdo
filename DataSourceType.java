package com.bootdo.common.config;

import lombok.Getter;

/**
 * Created by LaoWang on 2017/11/18.
 */
public enum DataSourceType {
    read("read", "从库"),
    write("write", "主库");
    @Getter
    private String type;
    @Getter
    private String name;

    DataSourceType(String type, String name) {
        this.type = type;
        this.name = name;
    }
}
