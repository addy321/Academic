<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		 <link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/tool.js" ></script> 
	</head>
	<body> 
		<div class="container">
			<div class="page-header">
				<h1>上传公告<small>请输入公告信息</small></h1>
			</div> 
			 <input type="email" name="title" style="margin: 30px 0px; width: 742px;" class="form-control" placeholder="标题">
			<textarea rows="10" cols="30"  style="margin: 0px; width: 742px; height: 251px;">
			
			</textarea>
			<br />
			<button type="button" class="btn btn-primary" style="margin-top: 20px;width: 100px;" onclick="tijiao()">提交</button>
		</div>
	</body>
	<script>
	function tijiao(){
		var content=$("textarea").val().trim()
		var title=$("input[name='title']").val().trim()
		$.ajax({
	        type: 'post',
	        url: "/Academic/office/AddAnnouncement",
	        data:{ "content": content, "title": title },
	        datatype: 'json',
	        success: function (res) {
	        	alert(res.success)
	        	$("textarea").val("")
	        	$("input[name='title']").val(" ")
	        }, error:function(err){
	        	console.log(err)
	            alert("请求异常")
	        }
	    }); 
	}
	</script>
</html>
