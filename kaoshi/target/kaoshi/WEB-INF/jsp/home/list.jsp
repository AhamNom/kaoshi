<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>在线考试</title>
		<link rel="shortcut icon" href="http://localhost:8080/kaoshi/home/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="http://localhost:8080/kaoshi/home/css/WebExam/index.css">
		<link href="http://localhost:8080/kaoshi/home/css/public.css" rel="stylesheet" type="text/css">
		<link href="http://localhost:8080/kaoshi/home/css/gr.css" rel="stylesheet" type="text/css">
		<link href="http://localhost:8080/kaoshi/home/css/all.css" rel="stylesheet" type="text/css">
		<script src="http://localhost:8080/kaoshi/home/js/jquery.min.js"></script>
	</head>
	<body id="back">
		<div id="header">
  			<div class="wrapper" style="max-width: 992px;min-height:80px">
  				<div class="menu-bar">
	  				<div class="left-part" style="margin-top: 0px">
	  					<a href="http://localhost:8080/kaoshi/admin/home/index">
	  						<h2 style="height: 40px">在线考试系统</h2>
	  					</a>
	  				</div>
		  			<div class="right-part" style="margin-top:15px">
			  			<div class="nav-login">
			  				<c:if test="${admin == null}">
				  				<a href="http://localhost:8080/kaoshi/adminLogin/login" class="login bounce btn rbtn">
				  					<span class="text"> 登录</span>
				  				</a>
				  			</c:if>
			  				<c:if test="${admin != null}">
			  					<label style="color: #353535;font-weight: bold;">${admin.name}</label>&nbsp;&nbsp;
				  				<a href="http://localhost:8080/kaoshi/adminLogin/logout" class="login bounce btn rbtn">
				  					<span class="text"> 退出</span>
				  				</a>
				  			</c:if>
				  				<a href="http://localhost:8080/kaoshi/admin/home/index" class="login bounce btn rbtn">
				  					<span class="text"> 返回</span>
				  				</a>
			  			</div>
			  		</div>
  				</div>
  			</div>
  		</div>
  		<div class="body main">
  			<div class="content">
				<div class="content-dd">
				
				
			        <c:forEach var="vo" items="${list}">
				    	<div class="dl">
							<div class="dl-title" style="margin: 5px 0px">${vo.kname}</div>
							<div class="dl-shijian" style="margin: 5px 0px">考生：${vo.uname}</div>
							<div class="dl-shijian" style="margin: 5px 0px">分数：${vo.fen}</div>
						</div>
			        </c:forEach>
					
				</div>		
			</div>
  		</div>
		
		<div class="es-copyright">
		  <div class="container">
		    ©2022 某校 All Rights Reserved. 

		    <div style="width:300px;margin:0 auto; padding:20px 0;">
			    <a target="_blank" href="#" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" rel="nofollow">
			    	<p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">某校  XXXXXXXXXXXXX号</p>
			    </a>
		    </div>
		  </div>
		</div>
	</body>
</html>