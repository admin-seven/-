package com.yy.service;


import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;

public interface NetfollowsService {
	/**
	 * 查询总数据
	 * @param fenye
	 * @return
	 */
	Fenye<Netfollows> selectNetfollows(Fenye<Netfollows> fenye);
}
