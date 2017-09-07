package com.bootdo;

class Test {

	private String id;
	private String pid;
	private String text;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Test(String id, String pid, String text) {
		super();
		this.id = id;
		this.pid = pid;
		this.text = text;
	}

	public Test() {
		super();
	}

	@Override
	public String toString() {
		return "Test [id=" + id + ", pid=" + pid + ", text=" + text + "]";
	}

}
