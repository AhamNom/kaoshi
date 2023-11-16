<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="http://localhost:8080/kaoshi/layui-v2/css/layui.css" media="all" />
<link rel="stylesheet" href="http://localhost:8080/kaoshi/css/public.css" media="all" />
<link rel="stylesheet" href="http://localhost:8080/kaoshi/css/all.css" media="all" />
</head>
<body class="childrenBody">
<form id="mainfrom" class="layui-form" style="width:80%;">

  <input type="hidden" name="id" value="${data.id}" >
  
  <div class="layui-form-item layui-row layui-col-xs12">
	      <label class="layui-form-label">所属年级：</label>
	      <div class="layui-input-block" style="display: flex; align-items: center;">
	        <select id="nid" name="nid">
		        <c:forEach var="n" items="${nianjilist}">
			    	<option value="${n.id}" <c:if test="${data.nid == n.id}"> selected ="true"</c:if>>${n.name}</option>
		        </c:forEach>
	        </select>
	      </div>
	</div>
  
	<div class="layui-form-item layui-row layui-col-xs12">
	      <label class="layui-form-label">所属班级：</label>
	      <div class="layui-input-block" style="display: flex; align-items: center;">
	        <select id="bid" name="bid">
		        <c:forEach var="b" items="${banjilist}">
			    	<option value="${b.id}" <c:if test="${data.bid == b.id}"> selected ="true"</c:if>>${b.name}</option>
		        </c:forEach>
	        </select>
	      </div>
	</div>
	  
	  
  <div class="layui-form-item layui-row layui-col-xs12">
      <label class="layui-form-label">科目：</label>
      <div class="layui-input-block" style="display: flex; align-items: center;">
        <select id="kid" name="kid">
	        <c:forEach var="k" items="${kemulist}">
		    	<option value="${k.id}" <c:if test="${data.kid == k.id}"> selected ="true"</c:if>>${k.name}</option>
	        </c:forEach>
        </select>
      </div>
  </div>
  
  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">名称：</label>
    <div class="layui-input-block">
      <input type="text" name="name" class="layui-input width400 name" value="${data.name}" lay-verify="required" placeholder="请输名称">
    </div>
  </div>
  
  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">题数：</label>
    <div class="layui-input-block">
      <input type="number" name="num" class="layui-input width200 num" value="${data.num}" lay-verify="required" placeholder="请输题数">
    </div>
  </div>
  
  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">时间(分)：</label>
    <div class="layui-input-block">
      <input type="number" name="fen" class="layui-input width200 fen" value="${data.fen}" lay-verify="required" placeholder="请输时间(分)">
    </div>
  </div>
  
  
  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">考试提示：</label>
    <div class="layui-input-block">
      <input type="text" name="date" class="layui-input width400 date" value="${data.date}" lay-verify="required" placeholder="请输考试提示">
    </div>
  </div>
  
  <div class="layui-form-item layui-row layui-col-xs12">
      <label class="layui-form-label">状态：</label>
      <div class="layui-input-block" style="display: flex; align-items: center;">
        <select id="state" name="state">
		    <option value="0"<c:if test="${data.state == 0}"> selected ="true"</c:if>>进行中</option>
		    <option value="1"<c:if test="${data.state == 1}"> selected ="true"</c:if>>已结束</option>
        </select>
      </div>
  </div>


  <div class="layui-form-item layui-row layui-col-xs12">
    <div class="layui-input-block">
      <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="edit">立即保存</button>
      <button type="reset" id="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
    </div>
  </div>

</form>

<script type="text/javascript" src="http://localhost:8080/kaoshi/layui-v2/layui.js"></script>
<script>
layui.use(['form','layer','layedit','laydate','upload'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        laypage = layui.laypage,
        upload = layui.upload,
        layedit = layui.layedit,
        laydate = layui.laydate,
        $ = layui.jquery;
	    form.on("submit(edit)",function(data){
	        
	        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
	        	$.ajax({
	                  url:'http://localhost:8080/kaoshi/admin/kaoshi/edit',
	                  type:'post',           //post提交
	                  dataType:"json",        //json格式
	                  data:$("#mainfrom").serialize(),    
	                  success:function(data){
	                        if(data.status!=200){
	
	                          layer.msg(data.info);
	                          
	                        }else{
	                            setTimeout(function(){
	                                top.layer.close(index);
	                                top.layer.msg(data.info);
	                                layer.closeAll("iframe");
	                                //刷新父页面
	                                parent.location.reload();
	                            },2000);
	                        }
	                        
	                    },
	                    error:function(XmlHttpRequest,textStatus,errorThrown){
	                        layer.msg('操作失败:服务器处理失败');
	                    }
	           	});
	            
		        return false;
		});
	
	    $("#reset").on("click",function(){
	        layer.closeAll("iframe");
	        parent.location.reload();
	    });

})
</script>
</body>
</html>