package com.bootdo.activiti.domain;

import java.util.Map;

/**
 * @author bootdo 1992lcg@163.com
 */
public class TaskDO {
    private  String taskId;
    private String taskComment;
    private String taskPass;
    private Map<String,Object> vars;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskComment() {
        return taskComment;
    }

    public void setTaskComment(String taskComment) {
        this.taskComment = taskComment;
    }

    public String getTaskPass() {
        return taskPass;
    }

    public void setTaskPass(String taskPass) {
        this.taskPass = taskPass;
    }

    public Map<String, Object> getVars() {
        return vars;
    }

    public void setVars(Map<String, Object> vars) {
        this.vars = vars;
    }


}
