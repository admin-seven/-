package com.yy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
import com.yy.entity.Student;
import com.yy.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Student student;
	@Autowired
	private Fenye<Student> fenye;

	@RequestMapping(value = "/getStu", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> getStuAll(Student student, Integer page, Integer rows) {

		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setStudent(student);
		fenye = studentService.selectFenyeStu(fenye);
		return fenye;

	}

	@RequestMapping(value = "addStu", method = RequestMethod.POST)
	@ResponseBody
	public Integer addStu(Student student) {
		// TODO Auto-generated method stub
		return studentService.addStu(student);
	}

	@RequestMapping(value = "updateStu", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return studentService.updateStu(student);
	}



}
