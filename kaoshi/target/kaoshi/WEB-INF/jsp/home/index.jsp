<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"><!--ie使用edge渲染模式-->
		<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
		<meta name="renderer" content="webkit"><!--360渲染模式-->
		<meta name="format-detection" content="telephone=notelphone=no, email=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="shortcut icon" href="http://localhost:8080/kaoshi/home/favicon.ico" type="image/x-icon" />
		<meta name="apple-touch-fullscreen" content="yes"><!-- 是否启用 WebApp 全屏模式，删除苹果默认的工具栏和菜单栏 -->
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta http-equiv="Cache-Control" content="no-siteapp" /><!-- 不让百度转码 -->
		<meta name="HandheldFriendly" content="true"><!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
		<meta name="MobileOptimized" content="320"><!-- 微软的老式浏览器 -->
		<meta name="screen-orientation" content="portrait"><!-- uc强制竖屏 -->
		<meta name="x5-orientation" content="portrait"><!-- QQ强制竖屏 -->
		<meta name="browsermode" content="application"><!-- UC应用模式 -->
		<meta name="x5-page-mode" content="app"><!-- QQ应用模式 -->
		<meta name="msapplication-tap-highlight" content="no"><!-- windows phone 点击无高光 -->
		<title>在线考试</title>
		<link href="http://localhost:8080/kaoshi/home/css/WebIndex/index.css" rel="stylesheet" type="text/css">
		<link href="http://localhost:8080/kaoshi/home/css/public.css" rel="stylesheet" type="text/css">
		<link href="http://localhost:8080/kaoshi/home/css/gr.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="http://localhost:8080/kaoshi/home/css/main.css">
		<script src="http://localhost:8080/kaoshi/home/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="http://localhost:8080/kaoshi/home/js/WebIndex/transit.js"></script>
		<script type="text/javascript" src="http://localhost:8080/kaoshi/home/home/js/WebIndex/touchSwipe.js"></script>
		<script type="text/javascript" src="http://localhost:8080/kaoshi/home/js/WebIndex/simpleSlider.js"></script>
		<script type="text/javascript" src="http://localhost:8080/kaoshi/home/js/WebIndex/backstretch.js"></script>
		<script src="http://localhost:8080/kaoshi/home/js/jquery.min.js"></script>
		<script src="http://localhost:8080/kaoshi/home/js/WebIndex/index.js"></script>
	</head>
	<body id="back" class="es-marketing">
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
			  			</div>
			  		</div>
  				</div>
  			</div>
  		</div>
  		<div class="es-indexpage es-product es-product-colleges es-product-train es-product-train-new main">
	  		<div class="swiper-container">
		  		<div class="swiper-wrapper">
			       <div class="swiper-slide">
				        <section class="bg-banner" style="background-image: url(http://localhost:8080/kaoshi/home/images/bg.jpg);background-image: -webkit-image-set(url(http://localhost:8080/kaoshi/home/images/bg.jpg) 1x, urlhttp://localhost:8080/kaoshi/home/images/bg.jpg) 2x)">
				         <div class="banner-hover-container container">
				            <div class="banner-hover-header">
				              <div class="title color-light">
				                <p class="banner-hover-title">在线考试系统</p>
				                <p class="banner-hover-detail">为所有考生提供优质服务</p>
				              </div>
				            </div>
				            <div class="banner-hover-footer">
				              <div class="homepage-link-content">
				                <a href="http://localhost:8080/kaoshi/admin/home/exam" class="js-consult-btn homepage-link" >考试模式</a>
				              </div>
				              <div class="homepage-link-content">
				                <a href="http://localhost:8080/kaoshi/admin/home/list" class="marketing-btn marketing-btn-line reverse-white-btn mlxl hidden-xs disabled js-video-btn">考试记录</a>
				              </div>
				            </div>
				         </div>
				       </section>
			      	</div>
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
