package com.yy.service;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.RoleModulesDao;
import com.yy.dao.RolesDao;
import com.yy.dao.UserRolesDao;
import com.yy.entity.RoleModules;
import com.yy.entity.UserRoles;

@Service
public class UserRolesServiceImp implements UserRolesService {
	@Autowired
	private UserRolesDao userRolesDao;
	@Autowired
	private RolesDao rolesDao;
	@Autowired
	private RoleModulesDao roleModulesDao;

	@Override
	public List<UserRoles> selectUserRoles(Integer id) {
		// TODO Auto-generated method stub
		return userRolesDao.selectUserRoles(id);
	}

	@Override
	public List<UserRoles> selectUserRolesByRolesId(Integer id) {
		// TODO Auto-generated method stub
		return userRolesDao.selectUserRolesByRolesId(id);
	}

	@Override
	public Integer addUserRole(UserRoles userRoles) {
		// TODO Auto-generated method stub
		Integer i = null;
		List<UserRoles> selectUserRolesByRolesId = userRolesDao
				.selectURByRidAndUid(userRoles);
		if (selectUserRolesByRolesId.size() > 0) {
			i = 10;
		} else {
			i = userRolesDao.addUserRole(userRoles);
		}
		return i;
	}

	@Override
	public Integer delUserRole(UserRoles userRoles) {
		// TODO Auto-generated method stub
		return userRolesDao.delUserRole(userRoles);
	}

	
	

	

}
