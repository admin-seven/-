package com.yy.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class ParentModules {
private Integer id;
private String text;
private Integer parentId;
private List<Modules> children;
public ParentModules() {
	super();
	// TODO Auto-generated constructor stub
}

public List<Modules> getChildren() {
	return children;
}

public void setChildren(List<Modules> children) {
	this.children = children;
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

@Override
public String toString() {
	return "ParentModules [id=" + id + ", text=" + text + ", parentId="
			+ parentId + ", children=" + children + "]";
}



}
