package com.yy.dao;

import java.util.List;

import com.yy.entity.RoleModules;
import com.yy.entity.UserRoles;

public interface RoleModulesDao {
	/**
	 * 根据角色查询所对应管理的模块
	 * @param roleId
	 * @return
	 */
List<RoleModules> selectRoleModules(List<Integer> list);
/**
 * 根据rId查询管理模块
 * @param rId
 * @return
 */
	List<RoleModules> selectRoleModulesByRId(Integer rId);
	/**
	 * 添加角色管理模块
	 * @param roleModules
	 * @return
	 */
	Integer addRoleModules(RoleModules roleModules);
	
}
