package com.bootdo.oa.domain;

import com.bootdo.activiti.domain.ActivitiDO;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.Date;


/**
 * 请假信息
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-11 11:30:52
 */
public class LeaveDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //id
    private String id;
    //请假事由
    private String reason;
    //开始时间
    @NotEmpty(message = "开始时间不能为空")
    private Date startTime;
    //结束时间
    @NotEmpty(message = "结束时间不能为空")
    private Date endTime;
    //直接主管意见（1同意0不同意）
    private Integer directOpinion;
    //部门领导意见（1同意0不同意）
    private Integer leaderOpinion;
    //hr是否通过（1同意0不同意）
    private Integer hrOpinion;

    private Integer UserOpinion;

    private String processInstanceId;

    /**
     * 设置：id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取：id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置：请假事由
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 获取：请假事由
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置：开始时间
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取：开始时间
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * 设置：结束时间
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取：结束时间
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 设置：直接主管意见（1同意0不同意）
     */
    public void setDirectOpinion(Integer directOpinion) {
        this.directOpinion = directOpinion;
    }

    /**
     * 获取：直接主管意见（1同意0不同意）
     */
    public Integer getDirectOpinion() {
        return directOpinion;
    }

    /**
     * 设置：部门领导意见（1同意0不同意）
     */
    public void setLeaderOpinion(Integer leaderOpinion) {
        this.leaderOpinion = leaderOpinion;
    }

    /**
     * 获取：部门领导意见（1同意0不同意）
     */
    public Integer getLeaderOpinion() {
        return leaderOpinion;
    }

    /**
     * 设置：hr是否通过（1同意0不同意）
     */
    public void setHrOpinion(Integer hrOpinion) {
        this.hrOpinion = hrOpinion;
    }

    /**
     * 获取：hr是否通过（1同意0不同意）
     */
    public Integer getHrOpinion() {
        return hrOpinion;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public Integer getUserOpinion() {
        return UserOpinion;
    }

    public void setUserOpinion(Integer userOpinion) {
        UserOpinion = userOpinion;
    }
}
