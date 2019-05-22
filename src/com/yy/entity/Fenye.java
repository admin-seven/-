package com.yy.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	/*模糊查询*/
	private Integer userId;
    private String userName;
    private String startTime;
    private String endTime;
    private Integer isclose;
    /**
     * 角色名称模糊查询
     */
    private String rolesName;
    /**
     * 网络跟踪
     */
    
    private Userchecks userchecks;
    private Netfollows netfollows;
    //int集合
    private List<Integer> list;
    
    private Student student;
    private Users users;
    

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Netfollows getNetfollows() {
		return netfollows;
	}

	public Userchecks getUserchecks() {
		return userchecks;
	}

	public void setUserchecks(Userchecks userchecks) {
		this.userchecks = userchecks;
	}

	public void setNetfollows(Netfollows netfollows) {
		this.netfollows = netfollows;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Integer> getList() {
		return list;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setList(List<Integer> list) {
		this.list = list;
	}

	public String getRolesName() {
		return rolesName;
	}

	public void setRolesName(String rolesName) {
		this.rolesName = rolesName;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getIsclose() {
		return isclose;
	}

	public void setIsclose(Integer isclose) {
		this.isclose = isclose;
	}

	

}
