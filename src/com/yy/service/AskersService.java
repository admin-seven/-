package com.yy.service;

import com.yy.entity.Askers;
import com.yy.entity.Fenye;

public interface AskersService {
	/**
	 * ��ҳ��ѯ�����û���Ϣ
	 * 
	 * @param fenye
	 * @return
	 */
	Fenye<Askers> selectAllAskers(Fenye<Askers> fenye);

}
