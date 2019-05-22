package com.yy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Modules;
import com.yy.entity.ParentModules;
import com.yy.entity.RoleModules;
import com.yy.entity.Roles;
import com.yy.entity.TreeParent;
import com.yy.entity.UserRoles;
import com.yy.entity.Userchecks;
import com.yy.entity.Users;
import com.yy.service.ModulesService;
import com.yy.service.ParentModulesService;
import com.yy.service.RoleModulesService;
import com.yy.service.RolesService;
import com.yy.service.UserRolesService;
import com.yy.service.UserchecksService;
import com.yy.service.UsersService;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private UserRolesService userRolesService;
	@Autowired
	private RolesService rolesService;
	@Autowired
	private RoleModulesService roleModulesService;
	@Autowired
	private ModulesService modulesService;
	@Autowired
	private ParentModulesService parentModulesService;
	@Autowired
	private UserchecksService userchecksService;

	//获取tree树
	@RequestMapping(value = "tree", method = RequestMethod.POST)
	@ResponseBody
	public List<TreeParent> getRoleModules(HttpServletRequest request) {
		/* 获取session值 */
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		List<Userchecks> selectCheckUserJinTian = userchecksService.selectCheckUserJinTian(request);
		if(selectCheckUserJinTian.size()>0){
			session.setAttribute("qdstate", selectCheckUserJinTian.get(0).getCheckState());
			session.setAttribute("qcstate", selectCheckUserJinTian.get(0).getIsCancel());
		}else{
			session.removeAttribute("qdstate");
			session.removeAttribute("qcstate");
		}
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersService.selectByname(u);
		session.setAttribute("user", selectuser);
		Integer uid = selectuser.get(0).getId();
		/* 查询用户角色 */
		List<UserRoles> selectUserRoles = userRolesService.selectUserRoles(uid);

		List<Integer> urlist = new ArrayList<Integer>();
		for (int i = 0; i < selectUserRoles.size(); i++) {
			urlist.add(selectUserRoles.get(i).getRoleId());
		}
		List<Roles> selectRoles = rolesService.selectRoles(urlist);
		session.setAttribute("RolesName", selectRoles);
		/* 根据角色查询管理模块 */
		List<Integer> rlist = new ArrayList<Integer>();
		for (int i = 0; i < selectRoles.size(); i++) {
			rlist.add(selectRoles.get(i).getId());
		}
		List<RoleModules> selectRoleModules = roleModulesService
				.selectRoleModules(rlist);
		List<Integer> mlist = new ArrayList<Integer>();
		for (int i = 0; i < selectRoleModules.size(); i++) {
			mlist.add(selectRoleModules.get(i).getModuleId());
		}
		List<Modules> selectModules = modulesService.selectModules(mlist);
		/* 查询父模块 */
		List<Integer> pList = new ArrayList<Integer>();
		for (int i = 0; i < selectModules.size(); i++) {
			pList.add(selectModules.get(i).getParentId());
		}
		List<ParentModules> selectByparentId = parentModulesService
				.selectByparentId(pList);
		List<TreeParent> aa = new ArrayList<TreeParent>();

		for (int i = 0; i < selectByparentId.size(); i++) {
			List<Modules> bb = new ArrayList<Modules>();
			TreeParent treeParent = new TreeParent();
			treeParent.setId(selectByparentId.get(i).getId());
			treeParent.setText(selectByparentId.get(i).getText());
			treeParent.setState("closed");
			for (int j = 0; j < selectModules.size(); j++) {
				if (selectByparentId.get(i).getId() == selectModules.get(
						j).getParentId()) {
					Modules modules = selectModules.get(j);
					bb.add(modules);
				}
				treeParent.setChildren(bb);
			}
			aa.add(treeParent);
		}
		return aa;
	}
	//修改联系方式
	@RequestMapping(value="updateTelAndEmail",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateTelAndEmail(HttpServletRequest request,Users u){
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersService.selectByname(u);
		session.setAttribute("user", selectuser);
		Integer uid = selectuser.get(0).getId();
		u.setId(uid);
		return usersService.updateUserLoginInfo(u);
	}
	
	//密码修改
	@RequestMapping(value="updatePsw",method=RequestMethod.POST)
	@ResponseBody
	public Integer initPsw(HttpServletRequest request,Users u){
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersService.selectByname(u);
		session.setAttribute("user", selectuser);
		Integer uid = selectuser.get(0).getId();
		u.setId(uid);
		return usersService.updateUserLoginInfo(u);
	}
	//添加员工签到信息
	@RequestMapping(value="addUserCheck",method=RequestMethod.POST)
	@ResponseBody
	public Integer addUserCheck(HttpServletRequest request){
		return userchecksService.addUsercheck(request);
	}
	
	//添加员工签出
	@RequestMapping(value="updateUserCheck",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUserCheck(HttpServletRequest request){
		return userchecksService.updateUserCheck(request);
	}

}
