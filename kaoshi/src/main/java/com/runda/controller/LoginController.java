package com.runda.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.runda.module.User;
import com.runda.service.UserService;
import com.runda.util.DataEntity;
import com.runda.util.MD5Utils;

@RequestMapping("/adminLogin")
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	//调用登录页面
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	//退出登录方法
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("admin", null);
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	
	@RequestMapping("/register")
	public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}
	
	//调用登录实现
	@RequestMapping(value="/manager",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity manager(@RequestParam String username,@RequestParam String password,
			HttpServletRequest request, HttpServletResponse response) {
		List<User> user = userService.getUserList(username);
		if(user.isEmpty()) {
			return new DataEntity("400", "帐号不存在!","");
		}
		if(user.get(0).getPassword().equals(MD5Utils.getMD5Str(password))) {
			request.getSession().setAttribute("admin", user.get(0));
			if (user.get(0).getRid()==3) {
				return new DataEntity("200", "登录成功", "admin/home/index");
			}
			return new DataEntity("200", "登录成功", "admin/index/index");
		}else {
			return new DataEntity("400", "密码输入有误!","");
		}
	}
	
	@RequestMapping(value="/zhuce",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity zhuce(@RequestParam String username,@RequestParam String password,@RequestParam String spassword,@RequestParam String name,
			HttpServletRequest request, HttpServletResponse response) {
		if(!password.equals(spassword)) {
			return new DataEntity("400", "两次密码输入不一致!","");
		}
		User data = new User();
		data.setName(name);
		data.setUsername(username);
		data.setPassword(password);
		Integer res = userService.insert(data);
		if(res>0) {
			return new DataEntity("200", "注册成功", "adminLogin/login");
		}else {
			return new DataEntity("400", "注册失败!","");
		}
	}
	
	//点击是否登录验证
	@RequestMapping("/checkSession")
	@ResponseBody
	public boolean check(HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		if(user!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
