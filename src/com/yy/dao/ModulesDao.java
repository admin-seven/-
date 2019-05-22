package com.yy.dao;

import java.util.List;

import com.yy.entity.Modules;

public interface ModulesDao {
	/**
	 * 根据角色id查出所管理的模块
	 * @param list
	 * @return
	 */
List<Modules> selectModules(List<Integer> list);
/**
 * 根据父类查子类模块
 * @param parentId
 * @return
 */
List<Modules> selectModulesByParentId(Integer parentId);

/**
 * 查询所有子类
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

}
