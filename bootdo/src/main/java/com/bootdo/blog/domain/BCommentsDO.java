package com.bootdo.blog.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-10 19:27:42
 */
public class BCommentsDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Integer id;
	//创建者
	private String created;
	//标题
	private String title;
	//作者
	private String author;
	//作者编号
	private Integer authorId;
	//归属人编号
	private Integer ownerId;
	//邮箱
	private String email;
	//链接地址
	private String url;
	//ip地址
	private String ip;
	//代理人
	private String agent;
	//内容
	private String content;
	//类型
	private String type;
	//状态
	private String status;
	//
	private Integer parent;

	/**
	 * 设置：主键
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：主键
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：创建者
	 */
	public void setCreated(String created) {
		this.created = created;
	}
	/**
	 * 获取：创建者
	 */
	public String getCreated() {
		return created;
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
	 * 设置：作者
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * 获取：作者
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * 设置：作者编号
	 */
	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}
	/**
	 * 获取：作者编号
	 */
	public Integer getAuthorId() {
		return authorId;
	}
	/**
	 * 设置：归属人编号
	 */
	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}
	/**
	 * 获取：归属人编号
	 */
	public Integer getOwnerId() {
		return ownerId;
	}
	/**
	 * 设置：邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置：链接地址
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * 获取：链接地址
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * 设置：ip地址
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	/**
	 * 获取：ip地址
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * 设置：代理人
	 */
	public void setAgent(String agent) {
		this.agent = agent;
	}
	/**
	 * 获取：代理人
	 */
	public String getAgent() {
		return agent;
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
	 * 设置：
	 */
	public void setParent(Integer parent) {
		this.parent = parent;
	}
	/**
	 * 获取：
	 */
	public Integer getParent() {
		return parent;
	}
}
