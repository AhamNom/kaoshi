<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户管理</title>
<link rel="stylesheet" href="http://localhost:8080/kaoshi/layui-v2/css/layui.css" media="all" />
<link rel="stylesheet" href="http://localhost:8080/kaoshi/css/all.css" media="all" />
</head>
<body>
	<input type="hidden" id="rid" name="rid" value="${rid}">
    <blockquote class="layui-elem-quote quoteBox">
            <a class="layui-btn layui-btn-normal add">新增</a>
    </blockquote>

    <table id="UserList" lay-filter="UserList"></table>

    <script type="text/html" id="UserListBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>


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
        elem: '#UserList',
        url : 'http://localhost:8080/kaoshi/admin/user/getList?rid='+$("#rid").val(),
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 20,
        limits : [10,15,20,25],
        id : "UserListTable",
        cols : [[
            {field: 'id', title: 'ID', width:200, align:'center'},
            {field: 'username', title: '账号', minWidth:100, align:'center'},
            {field: 'name', title: '姓名', minWidth:100, align:'center'},
            {field: 'phone', title: '联系方式', minWidth:100, align:'center'},
            {field: 'zhiwei', title: '职位', minWidth:100, align:'center'},
            {field: 'danwei', title: '单位', minWidth:100, align:'center'},
            {field: 'rname', title: '角色', minWidth:100, align:'center'},
            {field: 'bname', title: '班级', minWidth:100, align:'center'},
            {field: 'nname', title: '年级', minWidth:100, align:'center'},
            {title: '操作', maxWidth:200, templet:'#UserListBar',fixed:"right",align:"center"}
        ]]
    });

    $(".add").on("click",function(){
        add();
    });


    function add(){
        var index = layui.layer.open({
            title : "添加页面",
            type : 2,
            content : "http://localhost:8080/kaoshi/admin/user/add?rid="+$('#rid').val(),
            success : function(layero, index){
                form.render();
                setTimeout(function(){
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)

                layui.layer.full(index);
                window.sessionStorage.setItem("index",index);
                //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
                $(window).on("resize",function(){
                    layui.layer.full(window.sessionStorage.getItem("index"));
                })

            },
        })
    }

    function edit(data){
        var index = layui.layer.open({
            title : "修改页面",
            type : 2,
            content : "http://localhost:8080/kaoshi/admin/user/edit?id="+data.id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                form.render();
                setTimeout(function(){
                    layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)

                layui.layer.full(index);
                window.sessionStorage.setItem("index",index);
                //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
                $(window).on("resize",function(){
                    layui.layer.full(window.sessionStorage.getItem("index"));
                })

            },
        })
    }

    //列表操作
    table.on('tool(UserList)', function(obj){
        var Event = obj.event,
        Data = obj.data;
        if (Event === 'edit') {
            edit(Data);
        }
        if (Event === 'del') {
            layer.confirm('您确定要删除这条信息？',{icon:3,title:'提示信息'},function(index){
                $.get("http://localhost:8080/kaoshi/admin/user/del",{
                    id : Data.id,
                },function(data){
                    if (data.status!=200) {
                        layer.msg(data.info);
                    }else{
                        layer.msg(data.info,{icon:1,time: 500,offset:'t'},function(){
                            tableIns.reload();
                            layer.close(index);
                        });
                    }
                })
            });
        }

    });


})
</script>        
</body>
</html>