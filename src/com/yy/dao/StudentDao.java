package com.yy.dao;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
import com.yy.entity.Student;

public interface StudentDao {
	List<Student> selectAll(Fenye<Student> fenye);

	Integer selectCount(Fenye<Student> fenye);

	Integer updateStu(Student student);

	Integer addStu(Student student);

	/**
	 * ɾ��ѧ��
	 * 
	 * @param id
	 * @return
	 */
	Integer delStu(Integer id);

	/**
	 * ��������ѯ
	 * 
	 * @param fenye
	 * @return
	 */
	List<Student> selectOnlineStu(Fenye<Student> fenye);

	/**
	 * ��ѯ������
	 * 
	 * @param fenye
	 * @return
	 */
	Integer CountOnlineStu(Fenye<Student> fenye);

	/**
	 * �������ѧ��
	 * 
	 * @param student
	 * @return
	 */
	Integer addOnlineStu(Student student);

	/**
	 * ��ѯ�ҵ�ѧ��������
	 * 
	 * @param fenye
	 * @return
	 */
	Integer CountMyStu(Fenye<Student> fenye);

	/**
	 * ��ѯ�ҵ�ѧ��
	 * 
	 * @param fenye
	 * @return
	 */
	List<Student> selectMyStu(Fenye<Student> fenye);

	/**
	 * ��ѯ����δ����ѧ��
	 * 
	 * @return
	 */
	List<Student> selectStuAll();

	/**
	 * ��ѯ����ѧ��
	 * 
	 * @param netPusherId
	 * @return
	 */
	List<Student> selectMyStuBynetPusherId(Integer netPusherId);

	/**
	 * ׷��
	 * 
	 * @param netfollows
	 * @return
	 */
	Integer addNetfollows(Netfollows netfollows);

}
