<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>访客浏览</title>
		<link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/tool.js" ></script>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
			   <h1>大学生学业管理系统&nbsp;&nbsp;&nbsp;<small>2020/03/22</small></h1>
			</div>
			<div class="list-group Announcements">
			  <a href="#" class="list-group-item active">
			     <span>⚠</span>&nbsp;&nbsp;教务公告
			  </a>
			  <a href="#" class="list-group-item"><span>Dapibus ac facilisis in</span><span style="float: right;">[2020/2/2]</span></a>
			  <a href="#" class="list-group-item">Morbi leo risus<span style="float: right;">[2020/2/2]</a>
			  <a href="#" class="list-group-item">Porta ac consectetur ac<span style="float: right;">[2020/2/2]</a>
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
	</body>
	<script type="text/javascript">
	
	showData(1)//请求数据
	function showData(pageNO){
		getCount("/Academic/getCountAnnouncement","");//请求数量
		$.ajax({
	        type: 'get',
	        url: "/Academic/getAnnouncements",
	        data:{ "pageNO":pageNO},
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
