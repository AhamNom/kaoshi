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
<link rel="stylesheet" href="http://localhost:8080/kaoshi/layui-v2/css/layui.css" media="all" />
<link rel="stylesheet" href="http://localhost:8080/kaoshi/css/all.css" media="all" />
</head>
<body>
	<input type="hidden" id="id" value="${id}">
    <blockquote class="layui-elem-quote quoteBox">
            <h2>考试成绩</h2>
    </blockquote>

    <table id="List" lay-filter="List"></table>

<script type="text/javascript" src="http://localhost:8080/kaoshi/layui-v2/layui.js"></script>
<script type="text/javascript">
layui.use(['form','layer','table','laytpl','util'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table,
        savetag = null,
        util = layui.util;

    //列表
    var tableIns = table.render({
        elem: '#List',
        url : 'http://localhost:8080/kaoshi/admin/exam/getExamList?id='+$("#id").val(),
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 20,
        limits : [10,15,20,25],
        id : "ListTable",
        cols : [[
            {field: 'kname', title: '考试名称', minWidth:100, align:'center'},
            {field: 'uname', title: '考生', minWidth:100, align:'center'},
            {field: 'fen', title: '分数', minWidth:100, align:'center'},
            {field: 'starttime', title: '考试时间', minWidth:100, align:'center'},
            {field: 'state', title: '状态', minWidth:100, align:'center',templet:function(d){
            	if (d.state==0) {
                    return '未完成';
				}else if (d.state==1) {
                    return '已完成';
				}else{
                    return '未知';
				}
            }}
        ]]
    });




})
</script>        
</body>
</html>