package com.yy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.NetfollowsDao;
import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
@Service
public class NetfollowsServiceImp implements NetfollowsService{
	@Autowired
private NetfollowsDao netfollowsDao;
	@Override
	public Fenye<Netfollows> selectNetfollows(Fenye<Netfollows> fenye) {
		// TODO Auto-generated method stub
		List<Netfollows> selectNetfollows = netfollowsDao.selectNetfollows(fenye);
		fenye.setRows(selectNetfollows);
		Integer countNetfollows = netfollowsDao.countNetfollows(fenye);
		fenye.setTotal(countNetfollows);
		return fenye;
	}

}
