package com.yy.service;

import com.yy.entity.Askers;
import com.yy.entity.Fenye;

public interface AskersService {
	/**
	 * 分页查询所有用户信息
	 * 
	 * @param fenye
	 * @return
	 */
	Fenye<Askers> selectAllAskers(Fenye<Askers> fenye);

}
