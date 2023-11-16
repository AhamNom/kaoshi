package com.runda.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
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
import com.runda.dao.ExamtimeDao;
import com.runda.dao.KaoshiDao;
import com.runda.dao.TestDao;
import com.runda.module.Banji;
import com.runda.module.Exam;
import com.runda.module.Examtime;
import com.runda.module.Kaoshi;
import com.runda.module.Test;
import com.runda.module.User;
import com.runda.util.DataEntity;
import com.runda.util.JsonUtils;
import com.runda.util.MathUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@RequestMapping("/admin/home")
@Controller
public class HomeController {

	@Autowired
	private KaoshiDao kaoshidao;

	@Autowired
	private TestDao testdao;
	
	@Autowired
	private BanjiDao banjidao; 
	
	@Autowired
	private ExamDao examdao; 
	
	@Autowired
	private ExamtimeDao examtimedao; 
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "home/index";
	}

	@RequestMapping(value="/exam",method=RequestMethod.GET)
	public String exam(HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		if(user==null) {
			return "../../login";
		}
		Example example = new Example(Kaoshi.class);
		example.orderBy("state").asc();
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("bid", user.getBid());
		criteria.andEqualTo("nid", user.getNid());
		List<Kaoshi> kaoshilist = kaoshidao.selectByExample(example);
		request.setAttribute("kaoshilist", kaoshilist);
		return "home/exam";
	}

	@RequestMapping(value="/timu",method=RequestMethod.GET)
	public String timu(Integer id,HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		if(user==null) {
			return "../../login";
		}
		Kaoshi kaoshi = kaoshidao.selectByPrimaryKey(id);
		request.setAttribute("kaoshi", kaoshi);
		request.setAttribute("id", id);
		return "home/timu";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		if(user==null) {
			return "../../login";
		}
		Example example = new Example(Exam.class);
		example.createCriteria().andEqualTo("uid", user.getId()).andEqualTo("state", 1);
		List<Exam> list = examdao.selectByExample(example);
		request.setAttribute("list", list);
		return "home/list";
	}
	
	
	@RequestMapping(value="/getTimu",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity getTimu(Integer id,HttpServletRequest request, HttpServletResponse response) {
		Kaoshi kaoshi = kaoshidao.selectByPrimaryKey(id);
		Example example = new Example(Kaoshi.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("kid", kaoshi.getKid());
		List<Test> testlist = testdao.selectByExample(example);
		List<Test> list = new ArrayList<Test>();
		list = this.suiji(testlist, kaoshi.getNum());
		return new DataEntity("200", "返回结果", list);
	}
	

	
	@RequestMapping(value="/checkExam",method=RequestMethod.GET)
	@ResponseBody
	public DataEntity checkExam(Integer id,HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		Example example = new Example(Exam.class);
		example.createCriteria().andEqualTo("kid", id).andEqualTo("uid", user.getId());
		List<Exam> list = examdao.selectByExample(example);
		if (list.size()>0) {
			return new DataEntity("200", "返回结果", list.get(0));
		}else {
			Kaoshi kaoshi = kaoshidao.selectByPrimaryKey(id);
			Exam exam = new Exam();
			exam.setUid(user.getId());
			exam.setUname(user.getName());
			exam.setFen(0);
			exam.setState(0);
			exam.setKid(id);
			exam.setKname(kaoshi.getName());
			exam.setStarttime(MathUtils.currentDateStr());
			examdao.insert(exam);
			list = examdao.selectByExample(example);
			return new DataEntity("200", "返回结果", list.get(0));
		}
	}
	
	@RequestMapping(value="/addExamTimu",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity addExamTimu(Integer idx,Integer kid,Integer tid,String daan,String xuan,Integer isright,HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		Example example = new Example(Examtime.class);
		example.createCriteria().andEqualTo("kid", kid).andEqualTo("idx", idx).andEqualTo("uid", user.getId());
		List<Examtime> list = examtimedao.selectByExample(example);
		if (list.size()>0) {
			Examtime examtime = list.get(0);
			examtime.setIdx(idx);
			examtime.setUid(user.getId());
			examtime.setUname(user.getName());
			Kaoshi kaoshi = kaoshidao.selectByPrimaryKey(kid);
			examtime.setKid(kaoshi.getId());
			examtime.setKname(kaoshi.getName());
			Test test = testdao.selectByPrimaryKey(tid);
			examtime.setTid(test.getId());
			examtime.setTname(test.getName());
			examtime.setDaan(daan);
			examtime.setXuan(xuan);
			examtime.setIsright(isright);
			examtime.setCreatedate(MathUtils.currentDateStr());
			examtimedao.updateByPrimaryKey(examtime);
		}else {
			Examtime examtime = new Examtime();
			examtime.setIdx(idx);
			examtime.setUid(user.getId());
			examtime.setUname(user.getName());
			Kaoshi kaoshi = kaoshidao.selectByPrimaryKey(kid);
			examtime.setKid(kaoshi.getId());
			examtime.setKname(kaoshi.getName());
			Test test = testdao.selectByPrimaryKey(tid);
			examtime.setTid(test.getId());
			examtime.setTname(test.getName());
			examtime.setDaan(daan);
			examtime.setXuan(xuan);
			examtime.setIsright(isright);
			examtime.setCreatedate(MathUtils.currentDateStr());
			examtimedao.insert(examtime);
		}
		return new DataEntity("200", "返回结果", null);
	}
	
	
	
	@RequestMapping(value="/jiaojuan",method=RequestMethod.POST)
	@ResponseBody
	public DataEntity jiaojuan(Integer kid,HttpServletRequest request, HttpServletResponse response) {
		User user = (User)request.getSession().getAttribute("admin");
		Example example = new Example(Exam.class);
		example.createCriteria().andEqualTo("kid", kid).andEqualTo("uid", user.getId());
		List<Exam> elist = examdao.selectByExample(example);
		Exam exam = elist.get(0);
		Example etexample = new Example(Examtime.class);
		example.createCriteria().andEqualTo("kid", kid).andEqualTo("uid", user.getId());
		List<Examtime> list = examtimedao.selectByExample(etexample);
		int fen = 0;
		for (Examtime examtime : list) {
			if (examtime.getIsright()==1) {
				fen = fen+1;
			}
		}
		exam.setFen(fen);
		exam.setEndtime(MathUtils.currentDateStr());
		exam.setState(1);
		examdao.updateByPrimaryKey(exam);
		return new DataEntity("200", "返回结果", fen);
	}
	
	public List<Test> suiji(List<Test> testlist,Integer num) {
		List<Test> list = new ArrayList<Test>();
		for (int i = 1; i <= num; i++) {
			Test test = this.panduan(list,testlist);
			list.add(test);
		}
		return list;
	}

	public Test panduan(List<Test> list,List<Test> testlist) {
		boolean bool = true;
		Test test = testlist.get((int) (Math.random() * (testlist.size())));
//		System.out.println(testlist.size());
//		System.out.println(test.getId());
		for (Test t : list) {
			if (t.getId()==test.getId()) {
				bool = false;
			}
		}
//		System.out.println(bool);
		if (bool) {
			return test;
		}else {
			return panduan(list,testlist);
		}
	}
	
	
}