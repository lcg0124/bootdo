package com.bootdo.activiti.vo;

import java.time.LocalDateTime;
import java.util.Date;

public class HisTaskDTO {
    /**
     * 节点名称
     */
    private String name;
    /**
     * 处理人
     */
    private String user;

    /**
     * 处理时间
     */
    private Date date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
