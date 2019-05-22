package com.yy.entity;


import org.springframework.stereotype.Component;

@Component
public class Modules {
private Integer id;
private String text;
private Integer parentId;
private String path;
private Double weight;
public Modules() {
	super();
	// TODO Auto-generated constructor stub
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}

public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public Integer getParentId() {
	return parentId;
}
public void setParentId(Integer parentId) {
	this.parentId = parentId;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public Double getWeight() {
	return weight;
}
public void setWeight(Double weight) {
	this.weight = weight;
}
@Override
public String toString() {
	return "Modules [id=" + id + ", text=" + text + ", parentId=" + parentId
			+ ", path=" + path + ", weight=" + weight + "]";
}

}
