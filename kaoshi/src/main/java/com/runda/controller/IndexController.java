package com.runda.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.runda.dao.MenuDAO;
import com.runda.dao.RoleMapper;
import com.runda.dao.UserDao;
import com.runda.module.Menu;
import com.runda.module.Role;
import com.runda.module.User;
import com.runda.service.MenuService;
import com.runda.service.UserService;
import com.runda.util.DataEntity;
import com.runda.util.JsonUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@RequestMapping("/admin/index")
@Controller
public class IndexController {
	
	private static final String User = null;
	
	//界面service层
	@Autowired
	private MenuService menuservice;
	//界面dao层
	@Autowired
	private MenuDAO menudao;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private UserDao userdao;
	
	@Autowired
	private RoleMapper roledao;
	
	//获取后台模块节点
	@RequestMapping(value="/getmenu",method=RequestMethod.GET)
	@ResponseBody
	public List<Menu> getmenu(@RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int limit,HttpServletRequest request) {
		Example example = new Example(Menu.class);
		example.setOrderByClause("sort");
		User user = (User)request.getSession().getAttribute("admin");
		Role role = roledao.selectByPrimaryKey(user.getRid());
		String[] Ilist = role.getRole().split(",");
		List<Menu> list = new ArrayList<Menu>();
		for (String id : Ilist) {;
			Menu menu = menudao.selectByPrimaryKey(Integer.parseInt(id));
			list.add(menu);
		}
		return list;
	}
	
	//调用后台模板
	@RequestMapping("/index")
	public String index() {
		return "index/index";
	}
	
	//调用后台首页
	@RequestMapping("/main")
	public String main() {
		return "index/main";
	} 	
	
	//调用修改密码页面
	@RequestMapping("/pwd")
	public String pwd() {
		return "index/pwd";
	}
	
	//实现修改密码方法
	@RequestMapping(value="/updatePwd",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity updatePwd(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("passwordl") String passwordl,@RequestParam("passwordld") String passwordld) {
		DataEntity dataentity = userservice.updateUser(username,password,passwordl,passwordld);
		return dataentity;
	}

	
}
