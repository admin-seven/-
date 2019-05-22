package com.yy.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.UserRolesDao;
import com.yy.dao.UsersDao;
import com.yy.entity.Fenye;
import com.yy.entity.UserRoles;
import com.yy.entity.Users;

@Service
public class UsersServiceImp implements UsersService {
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private UserRolesService userRolesService;
	@Autowired
	private UserRolesDao userRolesDao;

	@Override
	public List<Users> selectByname(Users u) {
		// TODO Auto-generated method stub
		return usersDao.selectByname(u);
	}

	@Override
	public Integer updateUserLoginInfo(Users u) {
		// TODO Auto-generated method stub
		return usersDao.updateUserLoginInfo(u);
	}

	@Override
	public Fenye<Users> selectAllUsers(Fenye<Users> fenye) {
		Integer total = usersDao.selectCountUsers(fenye);
		fenye.setList(new ArrayList<Integer>());
		List<Users> selectAllUsers = usersDao.selectAllUsers(fenye);
		fenye.setRows(selectAllUsers);
		fenye.setTotal(total);
		return fenye;
	}

	@Override
	public Integer addUsers(Users users) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(date);
		users.setCreateTime(format);
		List<Users> selectByname = usersDao.selectByname(users);
		System.out.println(selectByname);
		Integer i =null;
		if(selectByname.size()==0){
			System.out.println("111222222222");
			i= usersDao.addUsers(users);
			System.out.println("wwwwwwwww"+i);
		}else{
			i=0;
		}
		return i;
	}

	@Override
	public Integer deleteUsers(Integer id) {
		// TODO Auto-generated method stub
		Integer deleteUsers = usersDao.deleteUsers(id);
		return deleteUsers;
	}

	@Override
	public Integer updateUsers(Users users) {
		// TODO Auto-generated method stub
		return usersDao.updateUsers(users);
	}

	@Override
	public Integer updateYonghujiesoByisLockout(Users users) {
		// TODO Auto-generated method stub
		return usersDao.updateYonghujiesoByisLockout(users);
	}

	@Override
	public Integer updateResetpas(Users users) {
		// TODO Auto-generated method stub
		return usersDao.updateResetpas(users);
	}

	@Override
	public Fenye<Users> selectUserByRolesId(Fenye<Users> fenye, Integer rolesId) {
		// TODO Auto-generated method stub
		List<UserRoles> selectUserRolesByRolesId = userRolesService
				.selectUserRolesByRolesId(rolesId);
		List<Integer> urList = new ArrayList<Integer>();
		for (int i = 0; i < selectUserRolesByRolesId.size(); i++) {
			Integer userId = selectUserRolesByRolesId.get(i).getUserId();
			urList.add(userId);
		}
		fenye.setList(urList);
		List<Users> selectAllUsers = usersDao.selectAllUsers(fenye);
		Integer selectCountUsers = usersDao.selectCountUsers(fenye);
		fenye.setTotal(selectCountUsers);
		fenye.setRows(selectAllUsers);
		return fenye;
	}

	@Override
	public Fenye selectAllEmp() {
		// TODO Auto-generated method stub
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(2);
		list.add(3);
		List<UserRoles> selectByRolesId = userRolesDao.selectByRolesId(list);
		List<Integer> uList = new ArrayList<Integer>();
		for (int i = 0; i < selectByRolesId.size(); i++) {
			uList.add(selectByRolesId.get(i).getUserId());
		}
		List<Users> selectAllEmp = usersDao.selectAllEmp(uList);
		Fenye<Users> fenye = new Fenye<Users>();
		fenye.setRows(selectAllEmp);
		return fenye;
	}

}
