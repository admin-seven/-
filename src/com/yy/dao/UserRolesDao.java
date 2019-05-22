package com.yy.dao;

import java.util.List;

import com.yy.entity.UserRoles;

public interface UserRolesDao {
	/**
	 * 根绝用户id查询所属角色
	 * @param id
	 * @return
	 */
List<UserRoles> selectUserRoles(Integer id);

/**
 * 根据角色查询用户
 * @param userRoles
 * @return
 */
List<UserRoles> selectByRolesId(List<Integer> list);

List<UserRoles> selectURByRidAndUid(UserRoles userRoles);
/**
 * 根据rolesId查userId
 * @param id
 * @return
 */

List<UserRoles> selectUserRolesByRolesId(Integer id);
/**
 * 添加角色权限
 * @param roles
 * @return
 */
Integer addUserRole(UserRoles roles);
/**
 * 删除角色权限
 * @param roles
 * @return
 */
Integer delUserRole(UserRoles roles);

}
