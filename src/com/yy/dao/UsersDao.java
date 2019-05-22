package com.yy.dao;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Users;

public interface UsersDao {
	/**
	 * 根据名称查询用户是否存在(登陆)
	 * 
	 * @param u
	 * @return
	 */
	List<Users> selectByname(Users u);
	/**
	 * 更新用户登陆信息
	 * @param u
	 * @return
	 */
	Integer updateUserLoginInfo(Users u);
	/**
	 * 分页查询所有用户信息
	 * 
	 * @param fenye
	 * @return
	 */
	List<Users> selectAllUsers(Fenye<Users> fenye);

	/**
	 * 分页多条件查询
	 * 
	 * @param fenye
	 * @return
	 */
	Integer selectCountUsers(Fenye<Users> fenye);

	/**
	 * 添加新用户
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);

	/**
	 * 修改用户信息
	 * 
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);

	/**
	 * 根据用户id删除用户信息
	 * 
	 * @param id
	 * @return
	 */
	Integer deleteUsers(Integer id);
	/**
	 * 解锁，锁定用户信息
	 */
	Integer updateYonghujiesoByisLockout(Users users);
	/**
	 * 重置密码
	 * @param users
	 * @return
	 */
	Integer updateResetpas(Users users);
	/**
	 * 查询所有员工
	 * @return
	 */
	List<Users> selectAllEmp(List<Integer> list);
}
