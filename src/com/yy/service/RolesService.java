package com.yy.service;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Roles;

public interface RolesService {
	/**
	 * 查询用户角色
	 * @param list
	 * @return
	 */
	List<Roles> selectRoles(List<Integer> list);
	
	Fenye<Roles> selectAllRoles(Fenye<Roles> fenye);
	/**
	 * 添加角色
	 * @param roles
	 * @return
	 */
	Integer addRoles(Roles roles);
	/**
	 * 修改角色
	 * @param roles
	 * @return
	 */
	Integer updateRoles(Roles roles);
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	Integer delRoles(Integer id);
	
	List<Roles> selectrolebyid(Integer id);
	
	
}
