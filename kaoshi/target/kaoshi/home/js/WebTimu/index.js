$(function () {
	var kaishi = 0; //开始时间
	var jieshu = 0; //结束时间
	var timu = [];
	var index = 0;
	dblChoseAlert();
	getTimu();
	timeOver = false; //保存当前是否已经达到交卷时间

	//关闭页面前提示
	$(window).on("beforeunload", function () {
		return "您尚未交卷！此操作将导致您的回答丢失。";
	});

	function timeout(){
		//倒计时功能
		$(".timeout").timeout({
			//考试时间（页面刷新时，时间会重置。）
			"maxTime": parseInt($("#time").val())*60,
			//到达时间自动交卷。（如果浏览器禁用JavaScript，此功能不会生效）
			"onTimeOver": function () {
				timeOver = true;
				alert("考试时间结束，系统自动交卷。");
				$("#jiaojuan").click();
				maxTime = 0;
			}
		});
	}

	$("#datika").hDialog({title: '答题卡',modalHide: false,width:600,height: 550}); //false:点击遮罩背景不关闭弹框,反之关闭；

	//交卷点击
	$("#jiaojuan").click(function () {
		$(window).off("beforeunload");  //解除绑定页面关闭事件
		if(checkMultiple()){
			jieshu = parseInt(new Date().getTime()/1000);
			jiaojuan();
		}
	});

	//多选题至少选择一项
	function checkMultiple() {
		for (var i = 0; i < timu.length; i++) {
			if(timu[i].xuan==null){
				alert('您有多题未作答。');
				return false;
			}
		}
		return true;
	};

	function jiaojuan(){
		$.post("http://localhost:8080/kaoshi/admin/home/jiaojuan",
		{	
			"kid":$("#id").val()
		},
		function(data){
			var dblChoseAlert = simpleAlert({
				"content":"考试结束!您的分数："+data.data,
				"buttons":{
					"返回主页":function () {
						document.location.href="http://localhost:8080/kaoshi/admin/home/exam"
				},
			}
		})
		});
	}

	function getTimu(){
		$.get("http://localhost:8080/kaoshi/admin/home/getTimu",
		{id:$("#id").val()},
		function(data){
			console.log(data);
			timu = data.data;
			datika();
			Timu();
		});
	}

	function Timu(){
		var data = timu[index];
		$('.question-type').html('选择题'+'<span>（本卷共'+timu.length+'题，满分'+timu.length+'分）</span>');
		$('.question-name').html('<span class="question-name-h">'+(index+1)+'.</span>'+data.name);
		
		var str = ""; 
		if (timu[index].xuan=="a") {
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="a" name="xx" checked="checked" required>'
				+'A.'+data.a+'</label>';
		}else{
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="a" name="xx"  required>'
				+'A.'+data.a+'</label>';
		}
		if (timu[index].xuan=="b") {
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="b" name="xx" checked="checked" required>'
				+'B.'+data.b+'</label>';
		}else{
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="b" name="xx" required>'
				+'B.'+data.b+'</label>';
		}
		if (timu[index].xuan=="c") {
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="c" name="xx" checked="checked" required>'
				+'C.'+data.c+'</label>';
		}else{
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="c" name="xx" required>'
				+'C.'+data.c+'</label>';
		}
		if (timu[index].xuan=="d") {
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="d" name="xx" checked="checked" required>'
				+'D.'+data.d+'</label>';
		}else{
			str+='<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="selected" value="d" name="xx" required>'
				+'D.'+data.d+'</label>';
		}
		
		$('.question-option').html(str);

		if(index==0){
			$(".shang").hide();
			$(".xia").show();
		}else{
			$(".shang").show();
		}
		if(index==timu.length-1){
			$(".xia").hide();
			$(".shang").show();
		}else{	
			$(".xia").show();
		}
		$('.selected').change(function(e){
			var xid = null;
				xuan = e.target.defaultValue;
				timu[index].xuan = xuan;

				if (timu[index].daan == xuan) {
					timu[index].isright = 1;
				}else{
					timu[index].isright = 0;
				}
			var cardLi = $('#'+index);
			cardLi.addClass('hasBeenAnswer');
			add();
		});
	}

	$('.shang').click(function(){
		index-=1;
		Timu();
	});
	$('.xia').click(function(){
		index+=1;
		Timu();
	});

	function add(){
		$.post("http://localhost:8080/kaoshi/admin/home/addExamTimu",
		{
			"idx":index+1,
			"kid":$("#id").val(),
			"tid":timu[index].id,
			"daan":timu[index].daan,
			"xuan":timu[index].xuan,
			"isright":timu[index].isright,
			
		},
		function(data){	
		});
	}

	//考试加载弹框
	function dblChoseAlert(){
		$.get("http://localhost:8080/kaoshi/admin/home/checkExam",
		{id:$("#id").val()},
		function(data){
			data = data.data;
			var dblChoseAlert = null;
			if(data.state==1){
				dblChoseAlert = simpleAlert({
					"content":"考试结束!您的分数："+data.fen,
					"buttons":{
						"返回上一页":function () {
							dblChoseAlert.close();
							$(window).off("beforeunload");
							document.location.href="http://localhost:8080/kaoshi/admin/home/exam"
						},
					}
				})
			}else{
					dblChoseAlert = simpleAlert({
						"content":"考题自动生成!",
						"buttons":{
							"开始考试":function () {
								dblChoseAlert.close();
								timeout();
							},
						}
					})
				
			}
		});
		
	}

	//答题卡生成
	function datika(){
		var dtk = $("#dtk");
		for (var i = 0; i < timu.length; i++) {
			dtk.append("<li><a id="+i+" class='dati' href='javascript:void(0);'>"+(i+1)+"</a></li>");

		}
		$(".dati").click(function(e){
			index = parseInt(e.currentTarget.id);
			Timu();
			$("#HCloseBtn span").click();
		});
		
	}


});