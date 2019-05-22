package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class Netfollows {
	private Integer id;
	private Integer studentId;
	private String content;
	private Integer userId;
	private String createTime;
	/*Ä£ºý²éÑ¯*/
	private String studentName;
	private String followTime;
	private String nextFollowTime;
	private String followState;
	private String followType;
	private String loginName;
	
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getFollowTime() {
		return followTime;
	}
	public void setFollowTime(String followTime) {
		this.followTime = followTime;
	}
	public String getNextFollowTime() {
		return nextFollowTime;
	}
	public void setNextFollowTime(String nextFollowTime) {
		this.nextFollowTime = nextFollowTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public Netfollows() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFollowState() {
		return followState;
	}
	public void setFollowState(String followState) {
		this.followState = followState;
	}
	public String getFollowType() {
		return followType;
	}
	public void setFollowType(String followType) {
		this.followType = followType;
	}
	@Override
	public String toString() {
		return "Netfollows [id=" + id + ", studentId=" + studentId
				+ ", content=" + content + ", userId=" + userId
				+ ", createTime=" + createTime + ", studentName=" + studentName
				+ ", followTime=" + followTime + ", nextFollowTime="
				+ nextFollowTime + ", followState=" + followState
				+ ", followType=" + followType + ", loginName=" + loginName
				+ "]";
	}
	 
 
	

	
	
}
