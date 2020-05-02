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
	<style>
		html{
			height: 100%;
		}
		.list-group-item span{
			float: left;
			margin-left: 40px;
		}
		.update input{
			width:120px;
		}
	</style>
	<body style="height: 100%;">
		<div style="height: 100%;"> 
			<div class="panel panel-default" style="width: 18%;height: 100%;text-align: center;float: left;">
			  <!-- Default panel contents -->
			  <div class="panel-heading">个人信息</div>
			  <div class="panel-body">
			    <p><img src="/Academic/static/img/dada.png" style="width: 100px;"><br><span id="teacherID">${teacherUser.teacherID }</span></p>
			  </div>
			
			  <!-- List group -->
			  <ul class="list-group showMess">
			    <li class="list-group-item"><span>姓名：</span><a class="aname">${teacherUser.name }</a></li>
			    <li class="list-group-item">
			    	<span>性别：</span>
			    	<a class="agender"><c:if test="${teacherUser.gender==0}">女</c:if>
				    <c:if test="${teacherUser.gender==1}">男</c:if> </a>
			    </li>
			    <li class="list-group-item"><span>年龄：</span><a class="aage">${teacherUser.age }</a></li>
			    <li class="list-group-item"><span>教授年级：</span><a class="agrade">${teacherUser.grade }</a>年级</li>
			    <li class="list-group-item"><span>联系电话：</span><a class="aphone">${teacherUser.phone }</a></li>
			     <li class="list-group-item"><span>所教课程：</span><a class="acourseName">${teacherUser.courseName }</a></li>
			    <li class="list-group-item">
			    	<a class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="showUpdate()">修改个人信息</a>
			    	<a class="btn btn-primary" style="margin-top: 50px;width: 100px;" href="http://localhost:8080/Academic">退出</a>
			    </li>
			  </ul>
			  
			  <ul class="list-group update" style="display: none;">
			   <li class="list-group-item"><label>姓名：</label><input type="text" name="name" value="${teacherUser.name }" /></li>
			   <li class="list-group-item"><label>性别：</label>
			    	 <select class="gender" style="height: 30px; width:110px">
			    	 <option value="0" <c:if test="${teacherUser.gender=='0'}">selected</c:if>>女</option> 
			    	 <option value="1" <c:if test="${teacherUser.gender=='1'}">selected</c:if>>男</option>
				    </select>
			    </li> 
			    <li class="list-group-item"><label>年龄：</label><input type="text" name="age" value="${teacherUser.age }" /></li>
			    <li class="list-group-item"><label>所教年级：</label>
			    	<select class="grade" style="height: 30px;width:110px;">
					   	 <option value="1" <c:if test="${teacherUser.grade=='1'}">selected</c:if>>一年级</option>
					   	 <option value="2" <c:if test="${teacherUser.grade=='2'}">selected</c:if>>二年级</option>
					   	 <option value="3" <c:if test="${teacherUser.grade=='3'}">selected</c:if>>三年级</option>
					   	 <option value="4" <c:if test="${teacherUser.grade=='4'}">selected</c:if>>四年级</option>
				    </select>
			    </li>
			    <li class="list-group-item"><label>联系电话：</label><input type="text" name="phone" value="${teacherUser.phone }" /></li>
			     <li class="list-group-item"><label>所教课程：</label><input type="text" name="courseName" value="${teacherUser.courseName }" /></li>
			     <li class="list-group-item"><label>密码：</label><input type="password" name="pass" value="${teacherUser.password }" /></li>
			    <li class="list-group-item">
			    	<button type="button" class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="updateTeacher()">保存</button>
			    	<button type="button" class="btn btn-primary" style="margin-top: 50px;width: 100px;" onclick="returnMess()">返回</button>
			    </li>
			  </ul>
			</div>
			<div style="float: left;width: 82%;height: 100%;">
				 <div class="page-header">
				   <h1 style="text-align: center;">某某学业系统&nbsp;&nbsp;&nbsp;<small>2020/03/22</small></h1>
				</div>
				<ul class="nav nav-tabs nav-pills">
				  <li role="presentation" class="active"><a href="#" url="curriculum.jsp">课程申请</a></li>
				  <li role="presentation"><a href="#" url="TeacherTimetable.jsp">选课情况查询</a></li>
				  <li role="presentation"><a href="#" url="student.jsp">成绩录入</a></li>
				   <li role="presentation"><a href="#" url="Reply.jsp">教师答疑</a></li>
				    <li role="presentation"><a href="#" url="compulsory.jsp">必修课程表</a></li>
				</ul>
				<iframe style="width:100%;margin-top: 30px;height: 80%;"  frameborder="no" src=""></iframe>
			</div>
		</div>
	</body> 
	<script>
	
	 var teacherID=$("#teacherID").text();
	    function updateTeacher(){
	    	var name=$("input[name='name']").val().trim()
	    	var grade=$(".grade").val()
	    	var gender=$(".gender").val()
	    	var phone=$("input[name='phone']").val().trim() 
	    	var age=$("input[name='age']").val().trim() 
	    	var courseName=$("input[name='courseName']").val().trim() 
	    	var pass=$("input[name='pass']").val().trim()
	    	if(name!="" && courseName!="" && grade!="" && gender!="" && pass!="" && phone!="" ){
	    		$.ajax({
			        type: 'post',
			        url: "/Academic/Teacher/update",
			        data:{"teacherID":teacherID,"name": name, "courseName": courseName,"grade":grade,"gender":gender,"password":pass,"age":age,"phone":phone },
			        datatype: 'json',
			        success: function (res) {
			        	alert(res.success)
			        	$(".aname").text(name)
			        	$(".acourseName").text(courseName)
			        	$(".aage").text(age)
			        	$(".aphone").text(phone)
			        	$(".agrade").text(grade)
			        	$(".agender").text(gender==0?"女":"男")
			        }, error:function(err){
			        	console.log(err)
	                    alert("请求异常")
	                }
			    }); 
	    	}else{
	    		alert("请输入所有填空")
	    	}
	    }
	
		//切换功能
	$(".nav-pills li").click(function(){
		var lis=$(this).siblings();
		$.each(lis, function(i,item){
		    $(item).attr("class"," ")
		});
		$(this).attr("class","active");
		var url= $(this).children("a").attr("url")
		$("iframe").attr("src","/Academic/static/jsp/teacher/"+url+"?teacherid="+teacherID);
	})
	$("iframe").attr("src","/Academic/static/jsp/teacher/curriculum.jsp?teacherid="+teacherID);
	
	</script>
</html>
