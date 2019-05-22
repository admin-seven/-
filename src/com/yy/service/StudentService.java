package com.yy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.http.HttpRequest;

import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
import com.yy.entity.Student;

public interface StudentService {
	Fenye<Student> selectFenyeStu(Fenye<Student> fenye);

	Integer updateStu(Student student);

	Integer delStu(Integer id);

	Integer addStu(Student student);

	/**
	 * ��������ѯ
	 * 
	 * @param fenye
	 * @return
	 */
	Fenye<Student> selectOnlineStu(HttpServletRequest request, Fenye<Student> fenye);

	/**
	 * ��ѯ�ҵ�ѧ��
	 * 
	 * @param request
	 * @param fenye
	 * @return
	 */
	Fenye<Student> selectMyStu(HttpServletRequest request, Fenye<Student> fenye);

	/**
	 * ��ѯ����δ����ѧ��
	 * 
	 * @param student
	 * @return
	 */
	Fenye selectStuAll();

	/**
	 * �������ѧ��
	 * 
	 * @param student
	 * @return
	 */
	Integer addOnlineStu(Student student);

	/**
	 * ׷��
	 * 
	 * @param netfollows
	 * @return
	 */
	Integer addNetfollows(Netfollows netfollows);

}
