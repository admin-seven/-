package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class UserRoles {
private Integer id;
private Integer userId;
private Integer roleId;
public UserRoles() {
	super();
	// TODO Auto-generated constructor stub
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public Integer getRoleId() {
	return roleId;
}
public void setRoleId(Integer roleId) {
	this.roleId = roleId;
}
@Override
public String toString() {
	return "UserRoles [id=" + id + ", userId=" + userId + ", roleId=" + roleId
			+ "]";
}

}
