package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class Askers {
	private Integer askerId;
	private String askerName;
	private String checkState;
	private String checkInTime;
	private Integer userid;
	private Integer weight;
	private String roleName;
	private String bakContent;

	public Integer getAskerId() {
		return askerId;
	}

	public void setAskerId(Integer askerId) {
		this.askerId = askerId;
	}

	public String getAskerName() {
		return askerName;
	}

	public void setAskerName(String askerName) {
		this.askerName = askerName;
	}

	public String getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getBakContent() {
		return bakContent;
	}

	public void setBakContent(String bakContent) {
		this.bakContent = bakContent;
	}

	public String getCheckState() {
		return checkState;
	}

	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Askers [askerId=" + askerId + ", askerName=" + askerName
				+ ", checkState=" + checkState + ", checkInTime=" + checkInTime
				+ ", userid=" + userid + ", weight=" + weight + ", roleName="
				+ roleName + ", bakContent=" + bakContent + "]";
	}

	
	

}
