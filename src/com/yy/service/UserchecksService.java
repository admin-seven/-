package com.yy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yy.entity.Fenye;
import com.yy.entity.Userchecks;


public interface UserchecksService {
	//添加签到信息
	Integer addUsercheck(HttpServletRequest request);
	//查询签到情况
	List<Userchecks> selectCheckUserJinTian(HttpServletRequest request);
	//添加签出信息
	Integer updateUserCheck(HttpServletRequest request);
	//查询签到情况
	Fenye<Userchecks> selectCheckUser(Fenye<Userchecks> fenye);
	//经理强制退出
	Integer updateUserCheckQC(Userchecks userchecks);
}
