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
		<link href="http://localhost:8080/kaoshi/home/css/public.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://localhost:8080/kaoshi/home/css/style.css">
		<link rel="stylesheet" href="http://localhost:8080/kaoshi/home/css/all.css">
		<script src="http://localhost:8080/kaoshi/home/js/jquery.min.js"></script>
		<script src="http://localhost:8080/kaoshi/home/js/jquery.timeout.js"></script>
		<script src="http://localhost:8080/kaoshi/home/js/WebTimu/index.js"></script>
		<script src="http://localhost:8080/kaoshi/home/js/simpleAlert.js"></script>
		<script>

		</script>
	</head>
	<body>
		<input type="hidden" id="id" name="id" value="${id}"/>
		<input type="hidden" id="time" name="time" value="${kaoshi.fen}"/>
		<div id="header">
  			<div class="wrapper" style="max-width: 992px;min-height:80px">
  				<div class="menu-bar">
	  				<div class="left-part" style="margin-top: 0px">
	  					<a href="http://localhost:8080/kaoshi/admin/home/index">
	  						<h2 style="height: 40px">在线考试系统</h2>
	  					</a>
	  				</div>
  					正在考试 （剩余时间 <span class="timeout"></span>）
		  			<div class="right-part">
		  				<div class="nav-login">
		  					<label style="color: #353535;font-weight: bold;">${admin.name}</label>&nbsp;&nbsp;
			  				<a id="datika">
			  					<div class="login bounce btn rbtn">
				  					<span class="text"> 答题卡</span>
				  				</div>
				  			</a>
			  			</div>
			  			<div class="nav-login">
			  				<a id="jiaojuan" class="login bounce btn rbtn">
				  					<span class="text"> 交卷</span>
				  			</a>
			  			</div>
			  		</div>
  				</div>
  			</div>
  		</div>
		<div class="main">
			<div class="main-wrap">
				<!-- 顶部标题 -->
				<div class="question-top">
					<!-- 试卷标题 -->
					<div class="question-title">${kaoshi.name}</div>
					
				</div>
				<!-- 题目内容 -->
				<!-- <form action="" method="post" id="testForm"> -->
					<!-- 单选题 -->
					<div id="single" class="anchor" ></div>
					<div class="question-wrap">
						<div class="question-type"></div>
						<div class="question-each">
							<!-- 标题 -->
							<div class="question-name"></div>
							<!-- 选项 -->
							<div class="question-option"></div>
						</div>
					</div>
					<!-- 题型导航 -->
					<div class="question-btn">
						<div class="question-nav">
							<a hidden class="shang" href="javascript:void(0);">上一题</a>
							<a class="xia" href="javascript:void(0);">下一题</a>
						</div>					
						
					</div>
				<!-- </form> -->
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

		<script src="http://localhost:8080/kaoshi/home/js/jquery.hDialog.min.js"></script>

		<!-- 答题卡 -->
		<div id="HBox" hidden="true" class="rt_content">
			<div class="rt_content_nr answerSheet">
				<ul id="dtk">
					
				</ul>
			</div>
		</div>

	</body>
</html>