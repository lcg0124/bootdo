package com.bootdo.activiti.domain;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.util.Date;
import java.util.List;

/**
 *
 */
public class ActivitiDO {
    private String taskId; 		// 任务编号
    private String taskName; 	// 任务名称
    private String taskDefKey; 	// 任务定义Key（任务环节标识）

    private String procInsId; 	// 流程实例ID
    private String procDefId; 	// 流程定义ID
    private String procDefKey; 	// 流程定义Key（流程定义标识）

    private String businessTable;	// 业务绑定Table
    private String businessId;		// 业务绑定ID

    private String title; 		// 任务标题

    private String status; 		// 任务状态（todo/claim/finish）

    private String procExecUrl; 	// 流程执行（办理）RUL
    private String comment; 	// 任务意见
    private String flag; 		// 意见状态

    private Task task; 			// 任务对象
    private ProcessDefinition procDef; 	// 流程定义对象
    private ProcessInstance procIns;	// 流程实例对象
    private HistoricTaskInstance histTask; // 历史任务
    private HistoricActivityInstance histIns;	//历史活动任务

    private String assignee; // 任务执行人编号
    private String assigneeName; // 任务执行人名称

    private Variable vars; 		// 流程变量
    private Variable taskVars; 	// 流程任务变量

    private Date beginDate;	// 开始查询日期
    private Date endDate;	// 结束查询日期

    private List<ActivitiDO> list; // 任务列表

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDefKey() {
        return taskDefKey;
    }

    public void setTaskDefKey(String taskDefKey) {
        this.taskDefKey = taskDefKey;
    }

    public String getProcInsId() {
        return procInsId;
    }

    public void setProcInsId(String procInsId) {
        this.procInsId = procInsId;
    }

    public String getProcDefId() {
        return procDefId;
    }

    public void setProcDefId(String procDefId) {
        this.procDefId = procDefId;
    }

    public String getProcDefKey() {
        return procDefKey;
    }

    public void setProcDefKey(String procDefKey) {
        this.procDefKey = procDefKey;
    }

    public String getBusinessTable() {
        return businessTable;
    }

    public void setBusinessTable(String businessTable) {
        this.businessTable = businessTable;
    }

    public String getBusinessId() {
        return businessId;
    }

    public void setBusinessId(String businessId) {
        this.businessId = businessId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProcExecUrl() {
        return procExecUrl;
    }

    public void setProcExecUrl(String procExecUrl) {
        this.procExecUrl = procExecUrl;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public ProcessDefinition getProcDef() {
        return procDef;
    }

    public void setProcDef(ProcessDefinition procDef) {
        this.procDef = procDef;
    }

    public ProcessInstance getProcIns() {
        return procIns;
    }

    public void setProcIns(ProcessInstance procIns) {
        this.procIns = procIns;
    }

    public HistoricTaskInstance getHistTask() {
        return histTask;
    }

    public void setHistTask(HistoricTaskInstance histTask) {
        this.histTask = histTask;
    }

    public HistoricActivityInstance getHistIns() {
        return histIns;
    }

    public void setHistIns(HistoricActivityInstance histIns) {
        this.histIns = histIns;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getAssigneeName() {
        return assigneeName;
    }

    public void setAssigneeName(String assigneeName) {
        this.assigneeName = assigneeName;
    }

    public Variable getVars() {
        return vars;
    }

    public void setVars(Variable vars) {
        this.vars = vars;
    }

    public Variable getTaskVars() {
        return taskVars;
    }

    public void setTaskVars(Variable taskVars) {
        this.taskVars = taskVars;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<ActivitiDO> getList() {
        return list;
    }

    public void setList(List<ActivitiDO> list) {
        this.list = list;
    }
}
