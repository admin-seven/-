package com.yy.dao;

import java.util.List;

import com.yy.entity.Askers;
import com.yy.entity.Fenye;

public interface AskersDao {
	/**
	 * 分页查询所有用户信息
	 * 
	 * @param fenye
	 * @return
	 */
	List<Askers> selectAllAskers(Fenye<Askers> fenye);

	/**
	 * 分页多条件查询
	 * 
	 * @param fenye
	 * @return
	 */
	Integer selectCountAskers(Fenye<Askers> fenye);
	/**
	 * 添加分量表员工信息
	 * @param askers
	 * @return
	 */
	Integer addAskersUsername(Askers askers);
}
