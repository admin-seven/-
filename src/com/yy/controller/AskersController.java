package com.yy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Askers;
import com.yy.entity.Fenye;
import com.yy.entity.Student;
import com.yy.service.AskersService;
import com.yy.service.StudentService;
import com.yy.service.UsersService;

@Controller
@RequestMapping(value = "/emp")
public class AskersController {
	@Autowired
	private Fenye fenye;
	@Autowired
	private AskersService askersService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private UsersService usersService;
	@RequestMapping(value = "getAskerAlls", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Askers> getAskerAlls(Integer page, Integer rows) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye = askersService.selectAllAskers(fenye);
		return fenye;
	}
	@RequestMapping(value = "updateWeight", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateWeight(){
		
		return null;
	}
	
	@RequestMapping(value="getStuAll",method=RequestMethod.POST)
	@ResponseBody
	public Fenye getStuAll(Student student){
		fenye = studentService.selectStuAll();
		return fenye;
		
	}
	@RequestMapping(value="getempAll",method=RequestMethod.POST)
	@ResponseBody
	public Fenye getempByUid(){
		
		return usersService.selectAllEmp();
	}
}
