package com.yy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Student;
import com.yy.service.StudentService;
@Controller
@RequestMapping("/stu")
public class OnlineStudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Student student;
	@Autowired
	private Fenye<Student> fenye;
	
	/**
	 * 查询数据
	 */
	@RequestMapping(value="selectOnline",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectOnline(HttpServletRequest request,Integer page,Integer rows,Student student){
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setStudent(student);
		fenye = studentService.selectOnlineStu(request, fenye);
		
		return fenye;
		
	}
	/**
	 * 添加
	 * @param student
	 * @return
	 */
	@RequestMapping(value="addOnlineStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer addOnlineStu(Student student){
		return studentService.addOnlineStu(student);
		
		
	}
}
