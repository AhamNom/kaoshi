package com.runda.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.github.pagehelper.PageHelper;
import com.runda.dao.BanjiDao;
import com.runda.dao.KemuDao;
import com.runda.dao.NianjiDao;
import com.runda.dao.RoleMapper;
import com.runda.dao.UserDao;
import com.runda.module.Banji;
import com.runda.module.Kemu;
import com.runda.module.Nianji;
import com.runda.module.Role;
import com.runda.module.User;
import com.runda.service.UserService;
import com.runda.util.DataEntity;
import com.runda.util.JsonUtils;

import tk.mybatis.mapper.entity.Example;

@RequestMapping("/admin/user")
@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	@Autowired
	private UserDao dao;
	@Autowired
	private RoleMapper roledao;
	@Autowired
	private NianjiDao ndao;
	@Autowired
	private BanjiDao bdao;
	
	//调用用户管理主页
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(@RequestParam Integer rid,HttpServletRequest request) {
		request.setAttribute("rid", rid);
		return "user/index";
	}
	
	//查询用户管理列表
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(@RequestParam int rid,@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
        PageHelper.startPage(page, limit,true);
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("rid", rid);
        List<User> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectAll().size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	//调用添加用户管理页面
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addGET(@RequestParam Integer rid,HttpServletRequest request) {
		request.setAttribute("rid", rid);
		List<Nianji> nianjilist = ndao.selectAll();
		request.setAttribute("nianjilist", nianjilist);
		List<Banji> banjilist = bdao.selectAll();
		request.setAttribute("banjilist", banjilist);
		return "user/add";
	}

	//添加用户管理方法
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addPOST(User user) {
		Role role = roledao.selectByPrimaryKey(user.getRid());
		user.setRname(role.getName());
		Nianji nianji = ndao.selectByPrimaryKey(user.getNid());
		user.setNname(nianji.getName());
		Banji banji = bdao.selectByPrimaryKey(user.getBid());
		user.setBname(banji.getName());
		Integer res = userservice.insert(user);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	//调用编辑用户管理页面
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String editGET(@RequestParam Integer id,HttpServletRequest request) {
		User data = userservice.getUser(id);
		request.setAttribute("data", data);
		List<Nianji> nianjilist = ndao.selectAll();
		request.setAttribute("nianjilist", nianjilist);
		List<Banji> banjilist = bdao.selectAll();
		request.setAttribute("banjilist", banjilist);
		return "user/edit";
	}

	//编辑用户管理方法
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity editPOST(User user) {
		Role role = roledao.selectByPrimaryKey(user.getRid());
		user.setRname(role.getName());
		Nianji nianji = ndao.selectByPrimaryKey(user.getNid());
		user.setNname(nianji.getName());
		Banji banji = bdao.selectByPrimaryKey(user.getBid());
		user.setBname(banji.getName());
		Integer res = userservice.update(user);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	//删除用户管理方法
	@RequestMapping(value="/del",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity delete(@RequestParam Integer id) {
		Integer res = userservice.delete(id);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
}