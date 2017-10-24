package com.bootdo.oa.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;



/**
 * 通知通告
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-05 17:11:16
 */
public class NotifyDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//编号
	private Long id;
	//类型
	private String type;
	//标题
	private String title;
	//内容
	private String content;
	//附件
	private String files;
	//状态
	private String status;
	//创建者
	private Long createBy;
	//创建时间
	private Date createDate;
	//更新者
	private String updateBy;
	//更新时间
	private Date updateDate;
	//备注信息
	private String remarks;
	//删除标记
	private String delFlag;
	
	private Long[] userIds;

	/**
	 * 设置：编号
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：编号
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public String getType() {
		return type;
	}
	/**
	 * 设置：标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：标题
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：内容
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：附件
	 */
	public void setFiles(String files) {
		this.files = files;
	}
	/**
	 * 获取：附件
	 */
	public String getFiles() {
		return files;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * 设置：创建者
	 */
	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}
	/**
	 * 获取：创建者
	 */
	public Long getCreateBy() {
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
	public Long[] getUserIds() {
		return userIds;
	}
	public void setUserIds(Long[] userIds) {
		this.userIds = userIds;
	}

	@Override
	public String toString() {
		return "NotifyDO{" +
				"id=" + id +
				", type='" + type + '\'' +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", files='" + files + '\'' +
				", status='" + status + '\'' +
				", createBy=" + createBy +
				", createDate=" + createDate +
				", updateBy='" + updateBy + '\'' +
				", updateDate=" + updateDate +
				", remarks='" + remarks + '\'' +
				", delFlag='" + delFlag + '\'' +
				", userIds=" + Arrays.toString(userIds) +
				'}';
	}
}
