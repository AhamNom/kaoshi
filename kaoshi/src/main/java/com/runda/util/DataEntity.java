package com.runda.util;

public class DataEntity {
	
	private String status;
	private String info;
	private Object data;
	private String url;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public DataEntity(Object data) {
		this.status = "200";
		this.info = "返回结果";
		this.data = data;
	}
	
	public DataEntity(String status, String info, Object data) {
		this.status = status;
		this.info = info;
		this.data = data;
	}


	public DataEntity(String status, String info, String url) {
		this.status = status;
		this.info = info;
		this.url = url;
	}
	
	public DataEntity(String status, String info, Object data, String url) {
		this.status = status;
		this.info = info;
		this.data = data;
		this.url = url;
	}

	
}
