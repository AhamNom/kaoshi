package com.runda.module;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "menu")
public class Menu {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;//id
	private String href;//后台模块链接
	private String title;//后台模块名称
	private Integer pid;//后台父模块id
	private String icon;//后台模块标识
	private Integer sort;//后台模块序号
	private Integer spread;//后台模块是否点击状态
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getSpread() {
		return spread;
	}
	public void setSpread(Integer spread) {
		this.spread = spread;
	}
	
	@Override
	public String toString() {
		return "Menu [id=" + id + ", href=" + href + ", title=" + title + ", pid=" + pid + ", icon=" + icon + ", sort="
				+ sort + ", spread=" + spread + "]";
	}
	
	
}
