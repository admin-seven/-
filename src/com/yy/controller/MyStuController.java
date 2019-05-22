package com.yy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Student;
import com.yy.service.StudentService;

@Controller
@RequestMapping(value="/stu")
public class MyStuController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Student student;
	@Autowired
	private Fenye<Student> fenye;
	
	
	@RequestMapping(value="selectMyStu",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectMyStu(HttpServletRequest request,Integer page,Integer rows,Student student){
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setStudent(student);
		fenye = studentService.selectMyStu(request, fenye);

		return fenye;
		
	}
	
}
