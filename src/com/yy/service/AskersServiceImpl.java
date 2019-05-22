package com.yy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.AskersDao;
import com.yy.entity.Askers;
import com.yy.entity.Fenye;

@Service
public class AskersServiceImpl implements AskersService {
	@Autowired
	private AskersDao askersDao;

	@Override
	public Fenye<Askers> selectAllAskers(Fenye<Askers> fenye) {
		// TODO Auto-generated method stub
		Integer total = askersDao.selectCountAskers(fenye);
		List<Askers> selectAllAskers = askersDao.selectAllAskers(fenye);
		fenye.setTotal(total);
		fenye.setRows(selectAllAskers);
		return fenye;
	}

}
