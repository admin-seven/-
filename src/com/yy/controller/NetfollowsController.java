package com.yy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Fenye;
import com.yy.entity.Netfollows;
import com.yy.service.NetfollowsService;
import com.yy.service.StudentService;

@Controller
@RequestMapping(value = "/stu")
public class NetfollowsController {
	@Autowired
	private Fenye<Netfollows> fenye;
	@Autowired
	private NetfollowsService netfollowsService;
	@Autowired
	private StudentService studentService;

	@RequestMapping(value = "selectNetfollows", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<Netfollows> selectNetfollows(Netfollows netfollows, Integer page, Integer rows) {

		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setNetfollows(netfollows);
		fenye = netfollowsService.selectNetfollows(fenye);
		return fenye;

	}

	/* Ìí¼Ó¸ú×Ù */
	@RequestMapping(value = "zzStu", method = RequestMethod.POST)
	@ResponseBody
	public Integer getgenzong(HttpSession session, Netfollows netfollows) {
		Integer userid =  (Integer)session.getAttribute("userid");
		netfollows.setUserId(userid);
		return studentService.addNetfollows(netfollows);
	}
}
