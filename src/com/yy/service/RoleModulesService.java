package com.yy.service;

import java.util.List;

import com.yy.entity.RoleModules;

public interface RoleModulesService {
	/**
	 * 根据角色查询所对应管理的模块
	 * @param roleId
	 * @return
	 */
	List<RoleModules> selectRoleModules(List<Integer> list);
	/**
	 * 添加角色模块
	 * @return
	 */
	Integer addRoleModiles(String parentIds,Integer rId);
}
