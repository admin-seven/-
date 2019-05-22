package com.yy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.StudentDao;
import com.yy.dao.UsersDao;
import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
import com.yy.entity.Student;
import com.yy.entity.Users;

@Service
public class StudentServiceImp implements StudentService{
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public Fenye<Student> selectFenyeStu(Fenye<Student> fenye) {
		List<Student> selectAll = studentDao.selectAll(fenye);
		Integer selectCount = studentDao.selectCount(fenye);
		fenye.setTotal(selectCount);
		fenye.setRows(selectAll);
		return fenye;
	}
	

	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return studentDao.updateStu(student);
	}

	



	@Override
	public Integer addStu(Student student) {
		// TODO Auto-generated method stub
		return studentDao.addStu(student);
	}
	



	@Override
	public Fenye<Student> selectOnlineStu(HttpServletRequest request, Fenye<Student> fenye) {
		
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersDao.selectByname(u);
		fenye.setUserId(selectuser.get(0).getId());
		List<Student> selectMyStu = studentDao.selectMyStu(fenye);
		List<Student> selectOnlineStu =studentDao.selectOnlineStu(fenye);
		Integer total = studentDao.CountOnlineStu(fenye);
		fenye.setRows(selectOnlineStu);
		fenye.setTotal(total);
		return fenye;
		
	}



	@Override
	public Integer delStu(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Fenye<Student> selectMyStu(HttpServletRequest request,
			Fenye<Student> fenye) {
		
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Users u = new Users();
		u.setLoginName(name);
		/* 根据名称查询用户信息 */
		List<Users> selectuser = usersDao.selectByname(u);
		fenye.setUserId(selectuser.get(0).getId());
		List<Student> selectMyStu =studentDao.selectMyStu(fenye);
		Integer total = studentDao.CountMyStu(fenye);
		fenye.setRows(selectMyStu);
		fenye.setTotal(total);
		return fenye;
	}


	@Override
	public Fenye<Student> selectStuAll() {
		List<Student> stuAllbyunetPusherId=studentDao.selectStuAll();
		Fenye<Student> fenye = new Fenye<Student>();
		fenye.setRows(stuAllbyunetPusherId);
		return fenye;
	}


	@Override
	public Integer addOnlineStu(Student student) {
		// TODO Auto-generated method stub
		return studentDao.addOnlineStu(student);
	}


	@Override
	public Integer addNetfollows(Netfollows netfollows) {
		// TODO Auto-generated method stub
		return studentDao.addNetfollows(netfollows);
	}






	


	

}
