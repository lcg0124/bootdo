package com.bootdo.activiti.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-17 10:00:10
 */
public class CustomActivitiesDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//
	private String processDefinitionId;
	//
	private Integer processVersion;
	//
	private String processDefinitionKey;
	//
	private String activityType;
	//
	private String activityId;
	//
	private String activityName;
	//
	private Integer assigneeType;
	//
	private String assignee;

	private String assigneeName;
	//
	private String candidateGroup;

	private String candidateGroupName;
	//
	private String candidateUser;

	private String candidateUserName;

	private String todoMessage;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}
	/**
	 * 获取：
	 */
	public String getProcessDefinitionId() {
		return processDefinitionId;
	}
	/**
	 * 设置：
	 */
	public void setProcessVersion(Integer processVersion) {
		this.processVersion = processVersion;
	}
	/**
	 * 获取：
	 */
	public Integer getProcessVersion() {
		return processVersion;
	}
	/**
	 * 设置：
	 */
	public void setProcessDefinitionKey(String processDefinitionKey) {
		this.processDefinitionKey = processDefinitionKey;
	}
	/**
	 * 获取：
	 */
	public String getProcessDefinitionKey() {
		return processDefinitionKey;
	}
	/**
	 * 设置：
	 */
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	/**
	 * 获取：
	 */
	public String getActivityType() {
		return activityType;
	}
	/**
	 * 设置：
	 */
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	/**
	 * 获取：
	 */
	public String getActivityId() {
		return activityId;
	}
	/**
	 * 设置：
	 */
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	/**
	 * 获取：
	 */
	public String getActivityName() {
		return activityName;
	}
	/**
	 * 设置：
	 */
	public void setAssigneeType(Integer assigneeType) {
		this.assigneeType = assigneeType;
	}
	/**
	 * 获取：
	 */
	public Integer getAssigneeType() {
		return assigneeType;
	}
	/**
	 * 设置：
	 */
	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}
	/**
	 * 获取：
	 */
	public String getAssignee() {
		return assignee;
	}
	/**
	 * 设置：
	 */
	public void setCandidateGroup(String candidateGroup) {
		this.candidateGroup = candidateGroup;
	}
	/**
	 * 获取：
	 */
	public String getCandidateGroup() {
		return candidateGroup;
	}
	/**
	 * 设置：
	 */
	public void setCandidateUser(String candidateUser) {
		this.candidateUser = candidateUser;
	}
	/**
	 * 获取：
	 */
	public String getCandidateUser() {
		return candidateUser;
	}

	public String getAssigneeName() {
		return assigneeName;
	}

	public void setAssigneeName(String assigneeName) {
		this.assigneeName = assigneeName;
	}

	public String getCandidateGroupName() {
		return candidateGroupName;
	}

	public void setCandidateGroupName(String candidateGroupName) {
		this.candidateGroupName = candidateGroupName;
	}

	public String getCandidateUserName() {
		return candidateUserName;
	}

	public void setCandidateUserName(String candidateUserName) {
		this.candidateUserName = candidateUserName;
	}

	public String getTodoMessage() {
		return todoMessage;
	}

	public void setTodoMessage(String todoMessage) {
		this.todoMessage = todoMessage;
	}
}
