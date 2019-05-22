package com.yy.dao;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;

public interface NetfollowsDao {
	/**
	 * 查询总数据
	 * 
	 * @param fenye
	 * @return
	 */
	List<Netfollows> selectNetfollows(Fenye<Netfollows> fenye);

	/**
	 * 总条数
	 * 
	 * @param fenye
	 * @return
	 */
	Integer countNetfollows(Fenye<Netfollows> fenye);

	

}
