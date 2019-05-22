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
	 * 删除学生
	 * 
	 * @param id
	 * @return
	 */
	Integer delStu(Integer id);

	/**
	 * 多条件查询
	 * 
	 * @param fenye
	 * @return
	 */
	List<Student> selectOnlineStu(Fenye<Student> fenye);

	/**
	 * 查询总条数
	 * 
	 * @param fenye
	 * @return
	 */
	Integer CountOnlineStu(Fenye<Student> fenye);

	/**
	 * 添加网络学生
	 * 
	 * @param student
	 * @return
	 */
	Integer addOnlineStu(Student student);

	/**
	 * 查询我的学生总条数
	 * 
	 * @param fenye
	 * @return
	 */
	Integer CountMyStu(Fenye<Student> fenye);

	/**
	 * 查询我的学生
	 * 
	 * @param fenye
	 * @return
	 */
	List<Student> selectMyStu(Fenye<Student> fenye);

	/**
	 * 查询所有未分配学生
	 * 
	 * @return
	 */
	List<Student> selectStuAll();

	/**
	 * 查询管理学生
	 * 
	 * @param netPusherId
	 * @return
	 */
	List<Student> selectMyStuBynetPusherId(Integer netPusherId);

	/**
	 * 追踪
	 * 
	 * @param netfollows
	 * @return
	 */
	Integer addNetfollows(Netfollows netfollows);

}
