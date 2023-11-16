package com.runda.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.runda.module.Menu;

public interface MenuService{

	List<Menu> select(HttpServletRequest request);
	
	Integer delete(Integer id);
	
	Integer insert(Menu data);
	
	Integer update(Menu data);
}
