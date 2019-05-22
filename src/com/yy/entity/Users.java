package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class Users {
private Integer id;
private String loginName;
private String passWord;
private Integer isLockOut;
private String lastLoginTime;
private String createTime;
private Integer psdWrongTime;
private String lockTime;
private String protectEmail;
private String protectMTel;
public Users() {
	super();
	// TODO Auto-generated constructor stub
}

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getLoginName() {
	return loginName;
}
public void setLoginName(String loginName) {
	this.loginName = loginName;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}
public Integer getIsLockOut() {
	return isLockOut;
}
public void setIsLockOut(Integer isLockOut) {
	this.isLockOut = isLockOut;
}
public String getLastLoginTime() {
	return lastLoginTime;
}
public void setLastLoginTime(String lastLoginTime) {
	this.lastLoginTime = lastLoginTime;
}
public String getCreateTime() {
	return createTime;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}

public Integer getPsdWrongTime() {
	return psdWrongTime;
}

public void setPsdWrongTime(Integer psdWrongTime) {
	this.psdWrongTime = psdWrongTime;
}

public String getLockTime() {
	return lockTime;
}
public void setLockTime(String lockTime) {
	this.lockTime = lockTime;
}
public String getProtectEmail() {
	return protectEmail;
}
public void setProtectEmail(String protectEmail) {
	this.protectEmail = protectEmail;
}
public String getProtectMTel() {
	return protectMTel;
}
public void setProtectMTel(String protectMTel) {
	this.protectMTel = protectMTel;
}

@Override
public String toString() {
	return "Users [id=" + id + ", loginName=" + loginName + ", passWord="
			+ passWord + ", isLockOut=" + isLockOut + ", lastLoginTime="
			+ lastLoginTime + ", createTime=" + createTime + ", psdWrongTime="
			+ psdWrongTime + ", lockTime=" + lockTime + ", protectEmail="
			+ protectEmail + ", protectMTel=" + protectMTel + "]";
}

}
