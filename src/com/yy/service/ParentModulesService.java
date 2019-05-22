package com.yy.service;

import java.util.List;

import com.yy.entity.Modules;
import com.yy.entity.ParentModules;

public interface ParentModulesService {
	/**
	 * 查询父块
	 * @param pId
	 * @return
	 */
List<ParentModules> selectByparentId(List<Integer> list);

/**
 * 查询所有父类
 * @return
 */
List<ParentModules> selectParentModulesAll();
/**
 * 添加父模块
 * 
 * @param parentModules
 * @return
 */
Integer addParentModules(ParentModules parentModules);
/**
 * 根据id删除父节点
 * 
 * @param id
 * @return
 */
Integer deleteParentModules(Integer id);
}
