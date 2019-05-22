package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class Userchecks {
	private Integer Id;
	private Integer userId;
	private String userName;
	private String checkInTime;
	private String checkState;
	private String isCancel;
	private String checkOutTime;
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getCheckState() {
		return checkState;
	}
	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}
	public String getIsCancel() {
		return isCancel;
	}
	public void setIsCancel(String isCancel) {
		this.isCancel = isCancel;
	}
	public String getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public Userchecks() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Userchecks [Id=" + Id + ", userId=" + userId + ", userName="
				+ userName + ", checkInTime=" + checkInTime + ", checkState="
				+ checkState + ", isCancel=" + isCancel + ", checkOutTime="
				+ checkOutTime + "]";
	}
	
	
}
