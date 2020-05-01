<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/tool.js" ></script>
	</head>
	<style>
		.fuwu a{
			border-radius: 20px;
			text-align: center;
		}
	</style>
	<body>
		<div class="container">
			 <div class="page-header">
			   <h1>大学生学业管理系统&nbsp;&nbsp;&nbsp;<small>2020/03/22</small></h1>
			</div>
			<div style="width: 300px;margin-top: 20px;float: left;">
				<div class="list-group fuwu">
				  <a href="#" class="list-group-item active">
				    学生服务区
				  </a>
				   <a href="#" class="list-group-item"><span>参加课程</span></a>
				   <a href="#" class="list-group-item">成绩查询</a>
				   <a href="#" class="list-group-item">提出问题</a>
				   	<a href="#" class="list-group-item" style="background-color: #1B6D85;"></a>
				  <a href="#" class="list-group-item">申请课程</a>
				   <a href="#" class="list-group-item">已选课程查询</a>
				   <a href="#" class="list-group-item">成绩录入</a> 
				   <a href="#" class="list-group-item">教师答疑</a> 
				   <a href="#" class="list-group-item active">
				        教师服务区
				  </a>
				</div>
			</div>
			<div style="width: 500px;margin-top: 20px;float: left;margin-left: 30px;">
				<div class="input-group" style="margin: auto;margin-bottom: 15px;">
				  <input type="text" name="title">&nbsp;&nbsp;&nbsp;
				  <button type="button" class="btn btn-primary btn-sm" onclick="showData(1)">搜索</button>
				</div>
				<div class="list-group Announcements">
				  <a href="#" class="list-group-item active ">
				     <span>⚠</span>&nbsp;&nbsp;</small>教务公告
				  </a>
				   <a href="#" class="list-group-item"><span>Dapibus ac facilisis in</span><span style="float: right;">[2020/2/2]</span></a>
				   <a href="#" class="list-group-item">Morbi leo risus<span style="float: right;">[2020/2/2]</a>
				   <a href="#" class="list-group-item">Porta ac consectetur ac<span style="float: right;">[2020/2/2]</a>
				   <a href="#" class="list-group-item">Vestibulum at eros<span style="float: right;">[2020/2/2]</a>
				  	<a href="#" class="list-group-item">Vestibulum at eros<span style="float: right;">[2020/2/2]</a>
			  		<a href="#" class="list-group-item">Vestibulum at eros<span style="float: right;">[2020/2/2]</a>
		  			<a href="#" class="list-group-item">Vestibulum at eros<span style="float: right;">[2020/2/2]</a>
	  				<a href="#" class="list-group-item">Vestibulum at eros<span style="float: right;">[2020/2/2]</a>
				</div>
				<div class="container">
					 <button type="button" class="btn btn-default active" onclick="upPage()">上一页</button> 
					 <span class="pageNO">1</span>/<span class="pageSize">2</span>
					 <button type="button" class="btn btn-default active" onclick="nextPage()">下一页</button>  
					 <span>跳转到</span> 
					 <input type="text" name="page" style="width: 30px;">
					 <span>页</span> 
					 <button type="button" class="btn btn-default active" onclick="PageGO()">GO</button>  
				</div>
			</div>
			<div class="page-header" style="float: left;width: 260px;margin-top: 100px;margin-left: 40px;">
			  <h1>2020版大学生学业管理系统 <br><br><small>&nbsp;<a href="/Academic/login.jsp">点击此处进行跳转登录</a></small></h1>
			</div>
			
		</div>
		 <p align="center" style="margin-top: 50px;color:#878B91;">
	            Copyright &copy;2020 Dreyer  XXX-XXXX-XXXX-XXXX-XXXX
	      </p>
	</body>
	<script type="text/javascript">
	showData(1)//请求数据
	function showData(pageNO){
		var title=$("input[name='title']").val().trim()
		getCount("/Academic/getCountAnnouncement",title);//请求数量
		$.ajax({
	        type: 'get',
	        url: "/Academic/getAnnouncements",
	        data:{ "pageNO":pageNO,"title":title},
	        datatype: 'json',
	        success: function (res) {
	        	$(".Announcements>a:first").nextAll().remove()
	        	console.log(res.data)
	        	var ahtml="";
	        	res.data.forEach((data)=>{
	        		ahtml+='<a href="#" class="list-group-item">'+data.title+'<span style="float: right;">['+data.releaseTime+']</a>' 
	        	});
	        	$(".Announcements").append(ahtml)
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常")
	        }
	    });
	}
	</script>
</html>
