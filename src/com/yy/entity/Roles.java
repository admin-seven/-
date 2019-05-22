package com.yy.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {
private Integer id;
private String name;
public Roles() {
	super();
	// TODO Auto-generated constructor stub
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
@Override
public String toString() {
	return "Roles [id=" + id + ", name=" + name + "]";
}

}
