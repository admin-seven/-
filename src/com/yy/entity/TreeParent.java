package com.yy.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class TreeParent {
	private Integer id;
	private String text;
	private String state;
	private List<Modules> children;

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}



	public List<Modules> getChildren() {
		return children;
	}

	public void setChildren(List<Modules> children) {
		this.children = children;
	}

	public TreeParent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "TreeParent [id=" + id + ", text=" + text + ", state=" + state
				+ ", children=" + children + "]";
	}


}
