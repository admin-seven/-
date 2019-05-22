package com.yy.service;

import java.util.List;

import com.yy.entity.Fenye;
import com.yy.entity.Users;

public interface UsersService {
	/**
	 * 根据名字查询(登陆)
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
	Fenye<Users> selectAllUsers(Fenye<Users> fenye);

	/**
	 * 添加新用户
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);

	/**
	 * 根据用户id删除用户信息
	 * 
	 * @param id
	 * @return
	 */
	Integer deleteUsers(Integer id);
	/**
	 * 修改用户信息
	 * 
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);
	/**
	 * 锁定，解锁用户信息
	 */
	Integer updateYonghujiesoByisLockout(Users users);
	/**
	 *  用户信息重置密碼
	 */
	  Integer updateResetpas(Users users);
	/**
	 * 通过roleId查user
	 * @return
	 */
	Fenye<Users> selectUserByRolesId(Fenye<Users> fenye,Integer rolesId);
	/**
	 * 查询所有员工
	 * @return
	 */
	Fenye selectAllEmp();
}
