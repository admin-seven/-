package com.yy.dao;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Userchecks;

public interface UserchecksDao {
	//添加签到信息
	Integer addUsercheck(Userchecks userchecks);
	//查询今日签到
	List<Userchecks> selectCheckUserJinTian(Userchecks userchecks);
	//添加签出信息
	Integer updateUserCheck(Userchecks userchecks);
	//查询签到情况
	List<Userchecks> selectCheckUser(Fenye<Userchecks> fenye);
	//查询签到总条数
	Integer selectCheckUserCount(Fenye<Userchecks> fenye);
	//经理强制签出
	Integer updateUserCheckQC(Userchecks userchecks);
	
	
}
