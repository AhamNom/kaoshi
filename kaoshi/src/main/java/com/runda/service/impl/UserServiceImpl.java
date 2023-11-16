package com.runda.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.runda.dao.UserDao;
import com.runda.module.User;
import com.runda.service.UserService;
import com.runda.util.DataEntity;
import com.runda.util.MD5Utils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDAO;
	
	@Override
	public List<User> select() {
		// TODO Auto-generated method stub
		List<User> list = userDAO.selectAll();
		return list;
	}

	@Override
	public Integer delete(Integer id) {
		int ints = userDAO.deleteByPrimaryKey(id);
		return ints;
	}

	@Override
	public Integer insert(User data) {
		data.setPassword(MD5Utils.getMD5Str(data.getPassword()));
		int ints = userDAO.insert(data);
		return ints;
	}

	@Override
	public Integer update(User data) {
		if(data.getPassword()!=null&&!data.getPassword().equals("")) {
			data.setPassword(MD5Utils.getMD5Str(data.getPassword()));
		}else {
			User user = getUser(data.getId());
			data.setPassword(user.getPassword());
		}
		int ints = userDAO.updateByPrimaryKeySelective(data);
		return ints;
	}

	@Override
	public List<User> getUserList(String username) {
		Example example = new Example(User.class);
		Criteria criteria = example.createCriteria();
		criteria.andCondition("username='"+username+"'");
		List<User> list = userDAO.selectByExample(example);
		return list;
	}

	@Override
	public DataEntity updateUser(String username, String password,String passwordl,String passwordld) {
		Example example = new Example(User.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("username", username);
		criteria.andEqualTo("password", MD5Utils.getMD5Str(password));
		List<User> user = userDAO.selectByExample(example);
		if(user.size()==0) {
			return new DataEntity("400", "旧密码输入有误!","");
		}
		user.get(0).setPassword(MD5Utils.getMD5Str(passwordl));
		int ints = userDAO.updateByPrimaryKey(user.get(0));
		if(ints==1) {
			return new DataEntity("200", "修改成功!","");
		}else {
			return new DataEntity("400", "修改失败!","");
		}
	}

	@Override
	public User getUser(Integer id) {
		User data = userDAO.selectByPrimaryKey(id);
		return data;
	}

	@Override
	public List<User> getUserList() {
		List<User> list = userDAO.selectAll();
		return list;
	}

	
}
