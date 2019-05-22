package com.yy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Roles;
import com.yy.service.RoleModulesService;
import com.yy.service.RolesService;
import com.yy.service.UserRolesService;

@Controller
@RequestMapping(value = "/syss")
public class RolesController {
	@Autowired
	private Fenye<Roles> fenye;
	@Autowired
	private RolesService rolesService;
	@Autowired
	private UserRolesService userRolesService;
	@Autowired
	private RoleModulesService roleModulesService;

	@RequestMapping(value = "getRoles", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> getRoles(Integer page, Integer rows, String rolesName) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setRolesName(rolesName);
		fenye = rolesService.selectAllRoles(fenye);
		return fenye;
	}

	@RequestMapping(value = "DelRoles", method = RequestMethod.POST)
	@ResponseBody
	public Integer DelRoles(Integer id) {

		return rolesService.delRoles(id);

	}

	@RequestMapping(value = "AddRoles", method = RequestMethod.POST)
	@ResponseBody
	public Integer AddRoles(Roles roles) {
		return rolesService.addRoles(roles);
	}

	@RequestMapping(value = "UpudeRoles", method = RequestMethod.POST)
	@ResponseBody
	public Integer UpudeRoles(Roles roles) {
		return rolesService.updateRoles(roles);
	}
	@RequestMapping(value = "addRoleModiles", method = RequestMethod.POST)
	@ResponseBody
	public Integer addRoleModiles(String parentIds,Integer rId){
		return roleModulesService.addRoleModiles(parentIds, rId);
		
	}
}
