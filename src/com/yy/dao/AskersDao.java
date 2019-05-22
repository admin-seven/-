package com.yy.dao;

import java.util.List;

import com.yy.entity.Askers;
import com.yy.entity.Fenye;

public interface AskersDao {
	/**
	 * ��ҳ��ѯ�����û���Ϣ
	 * 
	 * @param fenye
	 * @return
	 */
	List<Askers> selectAllAskers(Fenye<Askers> fenye);

	/**
	 * ��ҳ��������ѯ
	 * 
	 * @param fenye
	 * @return
	 */
	Integer selectCountAskers(Fenye<Askers> fenye);
	/**
	 * ��ӷ�����Ա����Ϣ
	 * @param askers
	 * @return
	 */
	Integer addAskersUsername(Askers askers);
}
