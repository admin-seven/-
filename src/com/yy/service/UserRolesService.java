package com.yy.service;

import java.util.List;

import com.yy.entity.UserRoles;

public interface UserRolesService {
	/**
	 * 根据用户id查询所属角色
	 * @param id
	 * @return
	 */
	List<UserRoles> selectUserRoles(Integer id);
	/**
	 * 根据rolesId查询用户id
	 * @param id
	 * @return
	 */
	List<UserRoles> selectUserRolesByRolesId(Integer id);
	/**
	 * 添加角色权限
	 * @param roles
	 * @return
	 */
	Integer addUserRole(UserRoles userRoles);
	/**
	 * 删除角色权限
	 * @param roles
	 * @return
	 */
	Integer delUserRole(UserRoles userRoles);

	
}
