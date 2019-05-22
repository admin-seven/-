package com.yy.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.AskersDao;
import com.yy.dao.RolesDao;
import com.yy.dao.UserRolesDao;
import com.yy.dao.UserchecksDao;
import com.yy.entity.Askers;
import com.yy.entity.Fenye;
import com.yy.entity.Roles;
import com.yy.entity.UserRoles;
import com.yy.entity.Userchecks;
import com.yy.entity.Users;

@Service
public class UserchecksServiceImp implements UserchecksService {
	@Autowired
	private UserchecksDao userchecksDao;
	@Autowired
	private AskersDao askersDao;
	@Autowired
	private UserRolesDao userRolesDao;
	@Autowired
	private RolesDao rolesDao;
	
	@Autowired
	private UsersService usersService;
	@Override
	public Integer addUsercheck(HttpServletRequest request) {
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		UserRoles userRoles = new UserRoles();
		
		
		List<Users> selectuser = usersService.selectByname(u);
		userRoles.setUserId(selectuser.get(0).getId());
		List<UserRoles> selectURByRidAndUid = userRolesDao.selectURByRidAndUid(userRoles);
		List<Integer> urlist = new ArrayList<Integer>();
		for (int i = 0; i < selectURByRidAndUid.size(); i++) {
				urlist.add(selectURByRidAndUid.get(i).getRoleId());
		}
		List<Roles> selectRoles = rolesDao.selectRoles(urlist);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(date);
		userchecks.setUserId(selectuser.get(0).getId());
		userchecks.setUserName(name);
		userchecks.setCheckInTime(format);
		userchecks.setCheckState(request.getParameter("checkState"));
		userchecks.setIsCancel("未签出");
		Askers askers = new Askers();
		askers.setAskerName(name);
		askers.setRoleName(selectRoles.get(0).getName());
		askers.setCheckState(request.getParameter("checkState"));
		askers.setCheckInTime(format);
		askers.setUserid(selectuser.get(0).getId());
		askersDao.addAskersUsername(askers);
		return userchecksDao.addUsercheck(userchecks);
	}
	@Override
	public List<Userchecks> selectCheckUserJinTian(HttpServletRequest request) {
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		List<Users> selectuser = usersService.selectByname(u);
		userchecks.setUserId(selectuser.get(0).getId());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(date);
		userchecks.setCheckInTime(format);
		return userchecksDao.selectCheckUserJinTian(userchecks);
	}
	@Override
	public Integer updateUserCheck(HttpServletRequest request) {
		Integer i=0;
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersService.selectByname(u);
		Date date = new Date();
	
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String checkTime = sdf1.format(date);
		userchecks.setUserName(name);
		userchecks.setCheckInTime(checkTime);
		userchecks.setUserId(selectuser.get(0).getId());
		List<Userchecks> selectCheckUserJinTian = userchecksDao.selectCheckUserJinTian(userchecks);
		if(selectCheckUserJinTian.size()>0){
			String isCancel = request.getParameter("isCancel");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String CheckOutTime = sdf.format(date);
			userchecks.setCheckOutTime(CheckOutTime);
			userchecks.setIsCancel(isCancel);
			userchecks.setCheckInTime(selectCheckUserJinTian.get(0).getCheckInTime());
			userchecksDao.updateUserCheck(userchecks);
			i=1;
		}
		return i;
	}
	@Override
	public Fenye<Userchecks> selectCheckUser(Fenye<Userchecks> fenye) {
		List<Userchecks> selectCheckUser = userchecksDao.selectCheckUser(fenye);
		Integer selectCheckUserCount = userchecksDao.selectCheckUserCount(fenye);
		fenye.setTotal(selectCheckUserCount);
		fenye.setRows(selectCheckUser);
		return fenye;
	}
	@Override
	public Integer updateUserCheckQC(Userchecks userchecks) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(date);
		userchecks.setCheckOutTime(format);
		return userchecksDao.updateUserCheckQC(userchecks);
	}

}
