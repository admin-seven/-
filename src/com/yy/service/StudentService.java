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
	 * 多条件查询
	 * 
	 * @param fenye
	 * @return
	 */
	Fenye<Student> selectOnlineStu(HttpServletRequest request, Fenye<Student> fenye);

	/**
	 * 查询我的学生
	 * 
	 * @param request
	 * @param fenye
	 * @return
	 */
	Fenye<Student> selectMyStu(HttpServletRequest request, Fenye<Student> fenye);

	/**
	 * 查询所有未分配学生
	 * 
	 * @param student
	 * @return
	 */
	Fenye selectStuAll();

	/**
	 * 添加网络学生
	 * 
	 * @param student
	 * @return
	 */
	Integer addOnlineStu(Student student);

	/**
	 * 追踪
	 * 
	 * @param netfollows
	 * @return
	 */
	Integer addNetfollows(Netfollows netfollows);

}
