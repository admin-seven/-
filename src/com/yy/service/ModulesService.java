package com.yy.service;

import java.util.List;

import com.yy.entity.Modules;
import com.yy.entity.TreeParent;

public interface ModulesService {
	/**
	 * 根据角色id查出所管理的模块
	 * 
	 * @param list
	 * @return
	 */
	List<Modules> selectModules(List<Integer> list);

	/**
	 * 根据父类查子类模块
	 * 
	 * @param parentId
	 * @return
	 */
	List<Modules> selectModulesByParentId(Integer parentId);

	/**
	 * 查询所有模块
	 * 
	 * @return
	 */
	List<Modules> selectChildrenModules();

	/**
	 * 添加子节点
	 * 
	 * @param modules
	 * @return
	 */
	Integer addModules(Modules modules);

	/**
	 * 根据id删除模块子节点
	 * 
	 * @param id
	 * @return
	 */
	Integer deleteModules(Integer id);

	/**
	 * 根据rid查询管理模块
	 * 
	 * @param id
	 * @return
	 */
	List<Integer> selectModuleByRid(Integer id);
}
