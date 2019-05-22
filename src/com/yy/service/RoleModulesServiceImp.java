package com.yy.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.RoleModulesDao;
import com.yy.entity.RoleModules;

@Service
public class RoleModulesServiceImp implements RoleModulesService {
	@Autowired
	private RoleModulesDao roleModulesDao;

	@Override
	public List<RoleModules> selectRoleModules(List<Integer> list) {
		// TODO Auto-generated method stub
		return roleModulesDao.selectRoleModules(list);
	}
	@Override
	public Integer addRoleModiles(String parentIds, Integer rId) {
		// TODO Auto-generated method stub
		Integer k=0;
		String[] split = parentIds.split(",");
		List<RoleModules> modulesByRid = roleModulesDao.selectRoleModulesByRId(rId);
		List<Integer> rmlist=new ArrayList<Integer>();
		for(int i=0;i<modulesByRid.size();i++){
			rmlist.add(modulesByRid.get(i).getModuleId());
		}
		List<Integer> mlist=new ArrayList<Integer>();
		for(int i=0;i<split.length;i++){
			String string = split[i];
			int parseInt = Integer.parseInt(string);
			mlist.add(parseInt);
		}
		for(Integer a:rmlist){
			if(mlist.contains(a)){
				mlist.remove(a);
			}
		}
		for(int i=0;i<mlist.size();i++){
			RoleModules roleModules = new RoleModules();
			roleModules.setRoleId(rId);
			System.out.println(mlist.get(i));
			roleModules.setModuleId(mlist.get(i));
			k=roleModulesDao.addRoleModules(roleModules);
		}
		return k;
	}

}
