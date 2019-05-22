package com.yy.dao;

import java.util.List;



import com.yy.entity.Fenye;
import com.yy.entity.Roles;

public interface RolesDao {
	/**
	 * 查询用户角色
	 * @param list
	 * @return
	 */
	List<Roles> selectRoles(List<Integer> list);
	/**
	 * 分页查询角色总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountRoles(Fenye<Roles> fenye);
	/**
	 * 查询角色
	 * @param fenye
	 * @return
	 */
	List<Roles> selectAllRoles(Fenye<Roles> fenye);
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
	
	
	/**
	 * 根据角色名查询
	 * @param roles
	 * @return
	 */
	Roles selectByName(Roles roles);

	
}
