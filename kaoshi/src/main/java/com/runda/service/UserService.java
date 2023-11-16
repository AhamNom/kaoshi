package com.runda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.runda.module.User;
import com.runda.util.DataEntity;

public interface UserService{

	List<User> select();
	
	
	Integer delete(Integer id);
	
	Integer insert(User data);
	
	Integer update(User data);
	
	List<User> getUserList(String username);
	
	User getUser(Integer id);
	
	List<User> getUserList();
	
	DataEntity updateUser(String username,String password,String passwordl,String passwordld);
}
