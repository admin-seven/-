package com.yy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Modules;
import com.yy.entity.ParentModules;
import com.yy.entity.TreeParent;
import com.yy.service.ModulesService;
import com.yy.service.ParentModulesService;

@Controller
@RequestMapping("/syss")
public class ModulesController {
	@Autowired
	private ModulesService modulesService;

	@Autowired
	private ParentModulesService parentModulesService;

	@RequestMapping(value = "getModules", method = RequestMethod.POST)
	@ResponseBody
	public List<TreeParent> getModules() {

		List<ParentModules> selectParentModulesAll = parentModulesService.selectParentModulesAll();
		List<Modules> selectChildrenModules = modulesService
				.selectChildrenModules();
		List<TreeParent>  aa = new ArrayList<TreeParent> ();
		for (int i = 0; i < selectParentModulesAll.size(); i++) {
			List<Modules> bb = new ArrayList<Modules>();
			TreeParent treeParent = new TreeParent();
			treeParent.setId(selectParentModulesAll.get(i).getId());
			treeParent.setText(selectParentModulesAll.get(i).getText());
			treeParent.setState("open");
			for (int j = 0; j < selectChildrenModules.size(); j++) {
				if (selectParentModulesAll.get(i).getId() == selectChildrenModules
						.get(j).getParentId()) {
					Modules modules = selectChildrenModules.get(j);
					bb.add(modules);
				}
				treeParent.setChildren(bb);
			}
			aa.add(treeParent);
		}
		return aa;

	}
	
	/**
	 * 添加父模块
	 * 
	 * @param parentModules
	 * @return
	 */
	@RequestMapping(value = "AddParentmodules", method = RequestMethod.POST)
	@ResponseBody
	public Integer AddParentmodules(ParentModules parentModules) {
		return parentModulesService.addParentModules(parentModules);
	}

	/**
	 * 添加子节点
	 * 
	 * @param modules
	 * @return
	 */
	@RequestMapping(value = "AddChildmodules", method = RequestMethod.POST)
	@ResponseBody
	public Integer addChildmodules(Modules modules) {
		Integer addModules = modulesService.addModules(modules);
		return addModules;
	}

	/**
	 * 删除子节点
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "DeleteChildmodules", method = RequestMethod.POST)
	@ResponseBody
	public Integer DeleteChildmodules(Integer id) {
		Integer deleteModules = modulesService.deleteModules(id);
		return deleteModules;
	}

	/**
	 * 删除父节点
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "DeleteParentmodules", method = RequestMethod.POST)
	@ResponseBody
	public Integer DeleteParentmodules(Integer id) {
		Integer deleteParentModules = parentModulesService
				.deleteParentModules(id);
		return deleteParentModules;
	}
	/**
	 * 查询所属模块
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getModulesByRid", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> getModulesByRid(Integer id){
		return modulesService.selectModuleByRid(id);
	}
}
