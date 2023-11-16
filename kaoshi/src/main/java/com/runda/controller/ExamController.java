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
import com.runda.dao.ExamDao;
import com.runda.dao.KaoshiDao;
import com.runda.dao.KemuDao;
import com.runda.dao.NianjiDao;
import com.runda.module.Banji;
import com.runda.module.Exam;
import com.runda.module.Kaoshi;
import com.runda.module.Kemu;
import com.runda.module.Nianji;
import com.runda.util.DataEntity;
import com.runda.util.JsonUtils;
import com.runda.util.MathUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@RequestMapping("/admin/exam")
@Controller
public class ExamController {

	@Autowired
	private KaoshiDao dao;
	@Autowired
	private ExamDao edao;
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "exam/index";
	}
	
	
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	@ResponseBody
	public String getList(@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
		PageHelper.startPage(page, limit,true);
		Example example = new Example(Kaoshi.class);
        List<Kaoshi> list = dao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectByExample(example).size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("id", id);
		return "exam/list";
	}
	
	
	@RequestMapping(value="/getExamList",method=RequestMethod.GET)
	@ResponseBody
	public String getExamList(@RequestParam int id,@RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int limit) {
		PageHelper.startPage(page, limit,true);
		Example example = new Example(Exam.class);
		example.createCriteria().andEqualTo("kid", id);
        List<Exam> list = edao.selectByExample(example);
		Map<String,Object> result = new HashMap<>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", dao.selectByExample(example).size());
		result.put("data", list);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
}