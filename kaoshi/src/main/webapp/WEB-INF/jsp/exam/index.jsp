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
    <blockquote class="layui-elem-quote quoteBox">
            <h2>考试列表</h2>
    </blockquote>

    <table id="List" lay-filter="List"></table>

    <script type="text/html" id="ListBar">
        <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="list">成绩列表</a>
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
        elem: '#List',
        url : 'http://localhost:8080/kaoshi/admin/exam/getList',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 20,
        limits : [10,15,20,25],
        id : "ListTable",
        cols : [[
            {field: 'name', title: '名称', minWidth:100, align:'center'},
            {field: 'num', title: '题数', width:100, align:'center'},
            {field: 'fen', title: '时间(分)', width:100, align:'center'},
            {field: 'date', title: '考试提示', minWidth:100, align:'center'},
            {field: 'kname', title: '科目', width:150, align:'center'},
            {field: 'bname', title: '班级', width:150, align:'center'},
            {field: 'nname', title: '年级', width:150, align:'center'},
            {field: 'state', title: '状态', width:100, align:'center',templet:function(d){
            	if (d.state==0) {
                    return '进行中';
				}else if (d.state==1) {
                    return '已结束';
				}else{
                    return '未知';
				}
            }},
            {title: '操作', maxWidth:200, templet:'#ListBar',fixed:"right",align:"center"}
        ]]
    });


    function list(data){
        var index = layui.layer.open({
            title : "成绩列表",
            type : 2,
            content : "http://localhost:8080/kaoshi/admin/exam/list?id="+data.id,
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
    table.on('tool(List)', function(obj){
        var Event = obj.event,
        Data = obj.data;
        if (Event === 'list') {
        	list(Data);
        }
        
    });


})
</script>        
</body>
</html>