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
		<script type="text/javascript" src="/Academic/static/js/verification.js" ></script>
	</head>
	<style>
		.centre{
			width: 40%;
			position: absolute;
		    left: 30%;
		}
		.teacher{
			display: none;
		}
		.student{
			display: none;
		}
		#lock{height:40px;background: beige;border-radius: 20px;width: 400px;position: relative;left: 120px;}
		#lock span{position:absolute;width:60px;height:40px;cursor:pointer;background-color: black;border-radius: 20px;text-align: center;line-height: 40px;margin-right: 0px;}
	</style>
	<body>
		<div class="container">
			<div class="centre">
				<h1>用户注册&nbsp;&nbsp;&nbsp;<small>请输入以下信息</small></h1>
				<form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">编号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="account" placeholder="account">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" name="pass" placeholder="Password">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">确定密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" name="pass2" placeholder="Password">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">姓名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="name" placeholder="姓名">
				    </div>
				  </div>
				   
				  
				   <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
				    <div class="col-sm-10">
				       <input type="checkbox" name="male" value="0" onclick="a()" /> 女
				       <input type="checkbox" name="female" value="1" onclick="b()"/> 男
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">身份</label>
				    <div class="col-sm-10">
				        <input type="checkbox" name="student" value="0" onclick="c()"  /> 学生
				        <input type="checkbox" name="teacher" value="1" onclick="d()" /> 教师
				    </div>
				  </div> 
				  
				  <div class="form-group student">
				    <label class="col-sm-2 control-label">年级</label>
				    <div class="col-sm-10">
				    	<select id="grade" style="height: 30px;">
					   	 <option value="0">请选择年级</option>
					   	 <option value="1">一年级</option>
					   	 <option value="2">二年级</option>
					   	 <option value="3">三年级</option>
					   	 <option value="4">四年级</option>
					   </select>
				    </div>
				  </div>
				  
				  <div class="form-group student">
				    <label class="col-sm-2 control-label">班级</label>
				    <div class="col-sm-10">
				    <select id="classname" style="height: 30px;">
					   	 <option value="0">请选择班级</option>
					   	 <option value="A1">A1</option>
					   	 <option value="B2">B2</option>
					   	 <option value="C3">C3</option>
					   	 <option value="D4">D4</option>
					   </select>
				    </div>
				  </div>
				  
				  
				   <div class="form-group teacher">
				    <label class="col-sm-2 control-label">教授年级</label>
				    <div class="col-sm-10">
				      <select id="grade2" style="height: 30px;">
					   	 <option value="0">请选择年级</option>
					   	 <option value="1">一年级</option>
					   	 <option value="2">二年级</option>
					   	 <option value="3">三年级</option>
					   	 <option value="4">四年级</option>
					   </select>
				    </div>
				  </div>
				  
				  <div class="form-group teacher">
				    <label class="col-sm-2 control-label">联系电话</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="phone" placeholder="联系电话	">
				    </div>
				  </div>
				  
				  <div class="form-group teacher">
				    <label class="col-sm-2 control-label">年龄</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="age" placeholder="年龄">
				    </div>
				  </div> 
				  
				  <div class="form-group teacher">
				    <label class="col-sm-2 control-label">所教课程</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="courseName" placeholder="所教课程">
				    </div>
				  </div> 
				  
				  <div class="form-group">
				  	<div id="lock"><span></span></div>	
				    <div class="col-sm-offset-2 col-sm-10"> 
				      <button type="button" class="btn btn-primary" style="margin-top: 20px;width: 100px;" onclick="registered()">注册</button>
				    </div>
				  </div>
				</form>
				<p align="center" style="margin-top: 20px;color:#878B91;">
		            Copyright &copy;2020 Dreyer  XXX-XXXX-XXXX-XXXX-XXXX
		       	</p>
		       	
			</div>
			
		</div>
	</body>
<script type="text/javascript">
var gender=-1
var Identity=-1
function a(){
	$("input[name='female']").prop('checked', false);
	gender=0
}
function b(){
	$("input[name='male']").prop('checked', false);
	gender=1
}
function c(){
	$("input[name='teacher']").prop('checked', false);
	$(".student").css("display","block")
	$(".teacher").css("display","none")
	Identity=0
}
function d(){
	$("input[name='student']").prop('checked', false);
	$(".teacher").css("display","block")
	$(".student").css("display","none")
	Identity=1
}
 
//注册
function registered(){
	var account= $("input[name='account']").val().trim()
	var pass= $("input[name='pass']").val().trim()
	var pass2=  $("input[name='pass2']").val().trim()
	var name= $("input[name='name']").val().trim()
	var classa= $("classname]").val()
	var grade=  $("#grade").val()
	var grade2= $("#grade2").val()
	var phone= $("input[name='phone']").val().trim()
	var age= $("input[name='age']").val().trim()
	var courseName= $("input[name='courseName']").val().trim()
	if(account!="" && pass!="" && pass2!="" && name!=""  && gender!=-1 && Identity!=-1){
		if(pass!=pass2){
			alert("密码不一致")
			return
		}
		if(Identity==0){
			if(classa!="" && grade!=0){
				var student={"studentID":account,"password":pass,"name":name,"classname":classa,"grade":grade,"gender":gender}
				console.log(student)
				isStudent(student)
			}else{
				alert("请完成所有选项和填空。")
			}
		}else if(Identity==1){
			if(grade2!=0 && phone!="" && age!="" && courseName!=""){
				var teachers={"teacherID":account,"password":pass,"name":name,"gender":gender,"age":age,"grade":grade2,"phone":phone,"courseName":courseName}
				console.log(teachers)
				isTeachers(teachers)
			}else{
				alert("请完成所有选项和填空。")
			}
		}
	}else{
		alert("请完成所有选项和填空。")
	}
}

function isStudent(student){
	$.ajax({
        type: 'get',
        url: "/Academic/office/getStudent",
        data:{"account":student.studentID},
        datatype: 'json',
        success: function (res) {
        	if(res.data){
        		request("/Academic/office/AddStudent",student)
        	}else{
        		alert("该账号已存在");
        	}
        }, error:function(err){
        	console.log(err)
            alert("请求异常")
        }
    }); 
}
function isTeachers(teachers){
	$.ajax({
        type: 'get',
        url: "/Academic/office/getTeacher",
        data:{"account":teachers.teacherID},
        datatype: 'json',
        success: function (res) {
        	if(res.data){
        		request("/Academic/office/AddTeachers",teachers)
        	}else{
        		alert("该账号已存在");
        	}
        }, error:function(err){
        	console.log(err)
            alert("请求异常")
        }
    }); 
}
function request(url,data){
	$.ajax({
        type: 'post',
        url: url,
        data:data,
        datatype: 'json',
        success: function (res) {
        	alert(res.data)
        	location.reload();
        }, error:function(err){
        	console.log(err)
            alert("请求异常")
        }
    }); 
}
	
</script>
</html>
