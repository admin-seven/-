package com.yy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.Users;
import com.yy.service.UsersService;

@Controller
@ResponseBody
@WebServlet(name = "login")
public class LoginController {
	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/ulogin", method = RequestMethod.POST)
	public Integer login(HttpServletRequest request,
			HttpServletResponse response) {
		Integer i = null;
		String name = request.getParameter("un");
		String pwd = request.getParameter("pwd");
		Users users = new Users();
		users.setLoginName(name);
		List<Users> user = usersService.selectByname(users);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(date);
		if (user.size() > 0) {
			if (user.get(0).getIsLockOut() == 0) {
				if (pwd.equals(user.get(0).getPassWord())) {
					HttpSession session = request.getSession();
					session.setAttribute("name", name);
					session.setAttribute("userid", user.get(0).getId());
					Integer id = user.get(0).getId();
					users.setId(id);
					users.setLastLoginTime(format);
					users.setPsdWrongTime(1);
					usersService.updateUserLoginInfo(users);
					i = 1;/* 登陆成功 */
				} else {
					i = 2; /* 密码错误 */
					Integer id = user.get(0).getId();
					users.setId(id);
					
					Integer pswWrongTime = user.get(0).getPsdWrongTime();
					if (pswWrongTime == 4) {
						i = 3;
						users.setIsLockOut(1);
						users.setLockTime(format);
						usersService.updateUserLoginInfo(users);

					}
					users.setPsdWrongTime(pswWrongTime + 1);
					usersService.updateUserLoginInfo(users);
				}
			} else {
				i = 3;/* 该账户已被锁定 */
			}

		} else {
			i = 0;/* 用户不存在 */
		}

		return i;
	}
	
	@RequestMapping(value = "/logout")
	public Integer logout(HttpSession session) {
		Integer i=0;
		if(session.getAttribute("name") != null) {
			session.removeAttribute("name");
			i=2;
		}
		return i;
	}

}
