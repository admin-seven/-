package com.yy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Roles;
import com.yy.entity.UserRoles;
import com.yy.entity.Users;
import com.yy.service.RolesService;
import com.yy.service.UserRolesService;
import com.yy.service.UsersService;
@Controller
@RequestMapping(value = "/syss")
public class UsersController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private Fenye fenye;
	@Autowired
	private RolesService rolesService;
	@Autowired
	private UserRolesService userRolesService;
	

	@RequestMapping(value = "getUserAlls", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Users> getUserAlls(Integer page, Integer rows,String userName,String startTime,String endTime,Integer isclose) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setUserName(userName);
		fenye.setStartTime(startTime);
		fenye.setEndTime(endTime);
		fenye.setIsclose(isclose);
		fenye = usersService.selectAllUsers(fenye);
		return fenye;
	}

	@RequestMapping(value = "addAllUsers")
	@ResponseBody
	public Integer addAllUsers(Users users) {
		return usersService.addUsers(users);

	}

	@RequestMapping(value = "deleteAllUsers")
	@ResponseBody
	public Integer deleteAllUsers(Integer id) {
		return usersService.deleteUsers(id);

	}
	@RequestMapping(value = "updateAllUsers")
	@ResponseBody
	public Integer updateAllUsers(Users users) {
		return usersService.updateUsers(users);

	}
	/*锁定，解锁用户*/
	@RequestMapping(value=("OpenCloseUser"),method=RequestMethod.POST)
	@ResponseBody
	public Integer OpenCloseUser(Users users) {
		return usersService.updateYonghujiesoByisLockout(users);
	}
//	重置密碼 
	@RequestMapping(value=("ResetUserPas"),method=RequestMethod.POST)
	@ResponseBody
	public Integer ResetUserPas(Users users) { 
		return usersService.updateResetpas(users);
	}
//根据角色查询相应权限
	@RequestMapping(value=("getUserByRolesId"),method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Users> getUserByRolesId(Integer page, Integer rows,Integer roleId){
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		return usersService.selectUserByRolesId(fenye, roleId);
	}
	@RequestMapping(value=("getRolesAll"),method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> getRolesAll(Integer page, Integer rows){
		fenye.setPage(0);
		fenye.setPageSize(100);
		return rolesService.selectAllRoles(fenye);
		
	}
	@RequestMapping(value=("getuRoles"),method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> getRoles(Integer id){
		
		return rolesService.selectrolebyid(id);
		
	};
	@RequestMapping(value=("addUserRole"),method=RequestMethod.POST)
	@ResponseBody
	public Integer addUserRoles(UserRoles userRoles){
		return userRolesService.addUserRole(userRoles);
		
	}
	@RequestMapping(value=("delUserRole"),method=RequestMethod.POST)
	@ResponseBody
	public Integer delUserRoles(UserRoles userRoles){
		return userRolesService.delUserRole(userRoles);
		
	}
}
