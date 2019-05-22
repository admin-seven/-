package com.yy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.ModulesDao;
import com.yy.dao.RoleModulesDao;
import com.yy.entity.Modules;
import com.yy.entity.RoleModules;

@Service
public class ModulesServiceImp implements ModulesService {
	@Autowired
	private ModulesDao modulesDao;
	@Autowired
	private RoleModulesDao roleModulesDao;

	@Override
	public List<Modules> selectModules(List<Integer> list) {
		// TODO Auto-generated method stub
		return modulesDao.selectModules(list);
	}

	@Override
	public List<Modules> selectModulesByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		return modulesDao.selectModulesByParentId(parentId);
	}

	@Override
	public List<Modules> selectChildrenModules() {
		// TODO Auto-generated method stub
		return modulesDao.selectChildrenModules();
	}

	@Override
	public Integer addModules(Modules modules) {
		// TODO Auto-generated method stub
		return modulesDao.addModules(modules);
	}

	@Override
	public Integer deleteModules(Integer id) {
		// TODO Auto-generated method stub
		return modulesDao.deleteModules(id);
	}

	@Override
	public List<Integer> selectModuleByRid(Integer id) {
		// TODO Auto-generated method stub
		List<RoleModules> selectRoleModulesByRId = roleModulesDao
				.selectRoleModulesByRId(id);
		List<Integer> rmlist = new ArrayList<Integer>();
		for (int i = 0; i < selectRoleModulesByRId.size(); i++) {
			rmlist.add(selectRoleModulesByRId.get(i).getModuleId());
		}

		return rmlist;
	}

}
