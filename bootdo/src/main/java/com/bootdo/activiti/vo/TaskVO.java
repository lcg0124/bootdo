package com.bootdo.activiti.vo;

import org.activiti.engine.task.Task;

/**

 */
public class TaskVO  {

    public TaskVO(Task task){

        this.setId(task.getId());
        this.setKey(task.getTaskDefinitionKey());
        this.setName(task.getName());
        this.setDescription(task.getDescription());
        this.setAssignee(task.getAssignee());
        this.setFormKey(task.getFormKey());
        this.setProcessId(task.getProcessInstanceId());
        this.setProcessDefinitionId(task.getProcessDefinitionId());
        this.setExecutionId(task.getExecutionId());
    }
    private  String id;
    private String name;
    private String key;
    private String description;
    private  String formKey;
    private  String assignee;
    private String processId;
    private String processDefinitionId;
    private String executionId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFormKey() {
        return formKey;
    }

    public void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getProcessId() {
        return processId;
    }

    public void setProcessId(String processId) {
        this.processId = processId;
    }

    public String getProcessDefinitionId() {
        return processDefinitionId;
    }

    public void setProcessDefinitionId(String processDefinitionId) {
        this.processDefinitionId = processDefinitionId;
    }

    public String getExecutionId() {
        return executionId;
    }

    public void setExecutionId(String executionId) {
        this.executionId = executionId;
    }
}
