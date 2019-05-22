package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class RoleModules {
private Integer id;
private Integer roleId;
private Integer moduleId;
public RoleModules() {
	super();
	// TODO Auto-generated constructor stub
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getRoleId() {
	return roleId;
}
public void setRoleId(Integer roleId) {
	this.roleId = roleId;
}
public Integer getModuleId() {
	return moduleId;
}
public void setModuleId(Integer moduleId) {
	this.moduleId = moduleId;
}
@Override
public String toString() {
	return "RoleModules [id=" + id + ", roleId=" + roleId + ", moduleId="
			+ moduleId + "]";
}

}
