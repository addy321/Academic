<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员</title>
		<link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/tool.js" ></script>
	</head>
	<style>
		html{
			height: 100%;
		}
		.list-group-item span{
			float: left;
			margin-left: 40px;
		}
		a{text-decoration:none;}
	</style>
	<body style="height: 100%;">
		<div style="height: 100%;">
			<div class="panel panel-default" style="width: 18%;height: 100%;text-align: center;float: left;">
			  <!-- Default panel contents -->
			  <div class="panel-heading">个人信息</div>
			  <div class="panel-body">
			    <p><img src="/Academic/static/img/aaa.png" style="width: 100px;"><br><span id="officeID">${OfficeUser.officeId }</span></p>
			  </div>
			
			  <!-- List group -->
			  <ul class="list-group showMess">  
			    <li class="list-group-item">
			    	<a class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="showUpdate()">修改密码</a>
			    	<a class="btn btn-primary" style="margin-top: 50px;width: 100px;" href="http://localhost:8080/Academic">退出</a>
			    </li>
			  </ul> 
				  <ul class="list-group update" style="display: none;">
				    <li class="list-group-item"><label>密码：</label><input type="password" name="pass" value="${OfficeUser.password }" /></li> 
				    
				    <li class="list-group-item">
				    	<button type="submit" class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="update()">保存</button>
				    	<button type="button" class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="returnMess()">返回</button>
				    </li>
				  </ul>
			</div>
			<div style="float: left;width: 82%;height: 100%;">
				 <div class="page-header">
				   <h1 style="text-align: center;">大学生学业管理系统&nbsp;&nbsp;&nbsp;<small>2020/06/10</small></h1>
				</div>
				<ul class="nav nav-tabs nav-pills">
				  <li role="presentation" class="active"><a href="#" url="addAnnouncement.jsp">上传公告</a></li>
				  <li role="presentation"><a href="#" url="schedule.jsp">排课与教室管理</a></li>
				  <li role="presentation"><a href="#" url="teacher.jsp">教师账号管理</a></li>
				  <li role="presentation"><a href="#" url="student.jsp">学生账号管理</a></li>
				  <li role="presentation"><a href="#" url="registered.jsp">添加新账号</a></li>
				</ul>
				<iframe style="width:100%;margin-top: 30px;height: 80%;"  frameborder="no" src="/Academic/static/jsp/office/addAnnouncement.jsp"></iframe>
			</div>
			
		</div>
	</body> 
	<script>
		var officeID=$("#officeID").text();
	    function update(){
	    	var pass=$("input[name='pass']").val().trim()
	    	if(pass!=""){
	    		$.ajax({
			        type: 'post',
			        url: "/Academic/office/update",
			        data:{"officeId":officeID,"password":pass },
			        datatype: 'json',
			        success: function (res) {
			        	alert(res.success)
			        }, error:function(err){
			        	console.log(err)
	                    alert("请求异常")
	                }
			    }); 
	    	}else{
	    		alert("请输入所有填空")
	    	}
	    }
		$(".nav-pills li").click(function(){
			var lis=$(this).siblings();
			$.each(lis, function(i,item){
			    $(item).attr("class"," ")
			});
			$(this).attr("class","active");
			var url= $(this).children("a").attr("url")
			$("iframe").attr("src","/Academic/static/jsp/office/"+url);
		})
	</script>
</html>
