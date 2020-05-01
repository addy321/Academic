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
	</head>

	<body>
		<div class="container">
			<div class="page-header">
				<h1>疑难杂惑<small>请输入你的问题</small></h1>
			</div> 
			<textarea rows="10" cols="30"  style="margin: 0px; width: 742px; height: 251px;">
			
			</textarea>
			<br />
			<button type="button" class="btn btn-primary" style="margin-top: 20px;width: 100px;" onclick="tijiao()">提交</button>
		</div>

	</body>
	
	<script type="text/javascript"> 
	
	function tijiao( ){
		$.ajax({
		     type:'get',
		     url: "/Academic/Student/getName",
		     datatype: 'json', 
		     success: function (res) {
				var problem=$("textarea").val().trim()
				var studentId=res.data
				$.ajax({
			        type: 'get',
			        url: "/Academic/Student/addquestion",
			        data:{ "studentId": studentId, "problem": problem },
			        datatype: 'json',
			        success: function (res) {
			        	alert(res.success)
			        	$("textarea").val("")
			        }, error:function(err){
			        	console.log(err)
			            alert("请求异常")
			        }
			    }); 
		     }, error:function(err){
			     	console.log(err);
			        alert("请求异常")
			  }
		});
	}
	</script>
</html>