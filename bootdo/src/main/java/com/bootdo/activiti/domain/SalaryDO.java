package com.bootdo.activiti.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;



/**
 * 审批流程测试表
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-11-25 13:28:58
 */
public class SalaryDO extends  TaskDO implements Serializable  {
	private static final long serialVersionUID = 1L;
	
	//编号
	private String id;
	//流程实例ID
	private String procInsId;
	//变动用户
	private String userId;
	//归属部门
	private String officeId;
	//岗位
	private String post;
	//性别
	private String age;
	//学历
	private String edu;
	//调整原因
	private String content;
	//现行标准 薪酬档级
	private String olda;
	//现行标准 月工资额
	private String oldb;
	//现行标准 年薪总额
	private String oldc;
	//调整后标准 薪酬档级
	private String newa;
	//调整后标准 月工资额
	private String newb;
	//调整后标准 年薪总额
	private String newc;
	//月增资
	private String addNum;
	//执行时间
	private String exeDate;
	//人力资源部门意见
	private String hrText;
	//分管领导意见
	private String leadText;
	//集团主要领导意见
	private String mainLeadText;
	//创建者
	private String createBy;
	//创建时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	//更新者
	private String updateBy;
	//更新时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
	//备注信息
	private String remarks;
	//删除标记
	private String delFlag;

	/**
	 * 设置：编号
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * 获取：编号
	 */
	public String getId() {
		return id;
	}
	/**
	 * 设置：流程实例ID
	 */
	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	/**
	 * 获取：流程实例ID
	 */
	public String getProcInsId() {
		return procInsId;
	}
	/**
	 * 设置：变动用户
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * 获取：变动用户
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * 设置：归属部门
	 */
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	/**
	 * 获取：归属部门
	 */
	public String getOfficeId() {
		return officeId;
	}
	/**
	 * 设置：岗位
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * 获取：岗位
	 */
	public String getPost() {
		return post;
	}
	/**
	 * 设置：性别
	 */
	public void setAge(String age) {
		this.age = age;
	}
	/**
	 * 获取：性别
	 */
	public String getAge() {
		return age;
	}
	/**
	 * 设置：学历
	 */
	public void setEdu(String edu) {
		this.edu = edu;
	}
	/**
	 * 获取：学历
	 */
	public String getEdu() {
		return edu;
	}
	/**
	 * 设置：调整原因
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：调整原因
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：现行标准 薪酬档级
	 */
	public void setOlda(String olda) {
		this.olda = olda;
	}
	/**
	 * 获取：现行标准 薪酬档级
	 */
	public String getOlda() {
		return olda;
	}
	/**
	 * 设置：现行标准 月工资额
	 */
	public void setOldb(String oldb) {
		this.oldb = oldb;
	}
	/**
	 * 获取：现行标准 月工资额
	 */
	public String getOldb() {
		return oldb;
	}
	/**
	 * 设置：现行标准 年薪总额
	 */
	public void setOldc(String oldc) {
		this.oldc = oldc;
	}
	/**
	 * 获取：现行标准 年薪总额
	 */
	public String getOldc() {
		return oldc;
	}
	/**
	 * 设置：调整后标准 薪酬档级
	 */
	public void setNewa(String newa) {
		this.newa = newa;
	}
	/**
	 * 获取：调整后标准 薪酬档级
	 */
	public String getNewa() {
		return newa;
	}
	/**
	 * 设置：调整后标准 月工资额
	 */
	public void setNewb(String newb) {
		this.newb = newb;
	}
	/**
	 * 获取：调整后标准 月工资额
	 */
	public String getNewb() {
		return newb;
	}
	/**
	 * 设置：调整后标准 年薪总额
	 */
	public void setNewc(String newc) {
		this.newc = newc;
	}
	/**
	 * 获取：调整后标准 年薪总额
	 */
	public String getNewc() {
		return newc;
	}
	/**
	 * 设置：月增资
	 */
	public void setAddNum(String addNum) {
		this.addNum = addNum;
	}
	/**
	 * 获取：月增资
	 */
	public String getAddNum() {
		return addNum;
	}
	/**
	 * 设置：执行时间
	 */
	public void setExeDate(String exeDate) {
		this.exeDate = exeDate;
	}
	/**
	 * 获取：执行时间
	 */
	public String getExeDate() {
		return exeDate;
	}
	/**
	 * 设置：人力资源部门意见
	 */
	public void setHrText(String hrText) {
		this.hrText = hrText;
	}
	/**
	 * 获取：人力资源部门意见
	 */
	public String getHrText() {
		return hrText;
	}
	/**
	 * 设置：分管领导意见
	 */
	public void setLeadText(String leadText) {
		this.leadText = leadText;
	}
	/**
	 * 获取：分管领导意见
	 */
	public String getLeadText() {
		return leadText;
	}
	/**
	 * 设置：集团主要领导意见
	 */
	public void setMainLeadText(String mainLeadText) {
		this.mainLeadText = mainLeadText;
	}
	/**
	 * 获取：集团主要领导意见
	 */
	public String getMainLeadText() {
		return mainLeadText;
	}
	/**
	 * 设置：创建者
	 */
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	/**
	 * 获取：创建者
	 */
	public String getCreateBy() {
		return createBy;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：更新者
	 */
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	/**
	 * 获取：更新者
	 */
	public String getUpdateBy() {
		return updateBy;
	}
	/**
	 * 设置：更新时间
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	/**
	 * 获取：更新时间
	 */
	public Date getUpdateDate() {
		return updateDate;
	}
	/**
	 * 设置：备注信息
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	/**
	 * 获取：备注信息
	 */
	public String getRemarks() {
		return remarks;
	}
	/**
	 * 设置：删除标记
	 */
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	/**
	 * 获取：删除标记
	 */
	public String getDelFlag() {
		return delFlag;
	}
}
