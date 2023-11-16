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
import com.runda.dao.KaoshiDao;
import com.runda.dao.KemuDao;
import com.runda.dao.TestDao;
import com.runda.module.Banji;
import com.runda.module.Kaoshi;
import com.runda.module.Kemu;
import com.runda.module.Test;
import com.runda.util.DataEntity;
import com.runda.util.JsonUtils;
import com.runda.util.MathUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@RequestMapping("/admin/test")
@Controller
public class TestController {

	@Autowired
	private TestDao dao;
	@Autowired
	private KemuDao kdao;
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "test/index";
	}
	
	
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
		PageHelper.startPage(page, limit,true);
		Example example = new Example(Test.class);
        List<Test> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectByExample(example).size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addGET(HttpServletRequest request) {
		List<Kemu> kemulist = kdao.selectAll();
		request.setAttribute("kemulist", kemulist);
		return "test/add";
	}

	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addPOST(Test data) {
		Kemu k = kdao.selectByPrimaryKey(data.getKid());
		data.setKname(k.getName());
		Integer res = dao.insert(data);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String editGET(@RequestParam Integer id,HttpServletRequest request) {
		Test data = dao.selectByPrimaryKey(id);
		request.setAttribute("data", data);
		List<Kemu> kemulist = kdao.selectAll();
		request.setAttribute("kemulist", kemulist);
		return "test/edit";
	}

	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity editPOST(Test data) {
		Kemu k = kdao.selectByPrimaryKey(data.getKid());
		data.setKname(k.getName());
		Integer res = dao.updateByPrimaryKey(data);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity delete(@RequestParam Integer id) {
		Integer res = dao.deleteByPrimaryKey(id);
		if(res==1){
			return new DataEntity("200", "操作成功", null);
		}else {
			return new DataEntity("400", "操作失败", null);
		}
	}
	
}