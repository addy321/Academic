<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/verification.js" ></script>
	</head>
	<style>
		.centre{
			width: 30%;
			position: absolute;
		    top: 25%;
		    left: 35%;
		}
		
		#lock{height:40px;background: beige;border-radius: 20px;width: 300px;position: relative;left: 0px;}
		#lock span{position:absolute;width:60px;height:40px;cursor:pointer;background-color: black;border-radius: 20px;text-align: center;line-height: 40px;margin-right: 0px;}
	</style>
	<body>
		<div class="container">  
			<div class="page-header">
				   <h1>大学生学业管理系统&nbsp;&nbsp;&nbsp;<small>2020/06/1</small></h1>
			</div>
			<div class="centre">
				<h1>用户登录&nbsp;&nbsp;&nbsp;<small>请输入以下信息</small></h1>
				<form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Account</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				    </div>
				  </div>
				 <div class="form-group">
				 	 <label for="inputPassword3" class="col-sm-2 control-label">Verification</label>
				 	<div class="col-sm-10"> 
				 		<div id="lock"><span></span></div>
				    </div>
				 </div>
				  <div class="form-group">
				  	
				    <div class="col-sm-offset-2 col-sm-10">
				    	 
					   <select id="Identity" style="height: 30px;">
					   	 <option value="0">请选择身份</option>
					   	 <option value="1">教务</option>
					   	 <option value="2">教师</option>
					   	 <option value="3">学生</option>
					   	 <option value="4">访客</option>
					   </select><br />
				      <button type="button" class="btn btn-primary" style="margin-top: 20px;width: 100px;" onclick="login()">登录</button>
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
	function login(){
		var account=$("#inputEmail3").val().trim()
		var pass=$("#inputPassword3").val().trim()
		var isok=$("#lock>span").css("background-color");
		var Identity=$("#Identity").val(); 
		if(account!="" && pass!="" && isok=="rgb(0, 0, 0)" && Identity!="0"){
			 var url="/Academic";
			 if(Identity=="1"){
				 url+="/office/login"
			 }else if(Identity=="2"){
				 url+="/Teacher/login"
			 }else if(Identity=="3"){
				 url+="/Student/login"
			 }
			 $.ajax({
		        type: 'post',
		        url: url,
		        data:{ "account": account, "password": pass },
		        datatype: 'json',
		        success: function (res) {
		        	console.log(res)
		        	if(res.account==account){
 				    	if(Identity=="2"){
 				    		window.location.href='/Academic/Teacher/showMain'
 						}else if(Identity=="3"){
 							window.location.href='/Academic/Student/showMain'
 						}else if(Identity=="1"){
 							window.location.href='/Academic/office/showMain'
 						}
 				    }else{
 				    	alert("登录失败，请输入正确的账号密码")
 				    }
		        }, error:function(err){
		        	console.log(err)
                    alert("请求异常")
                }
		    }); 
		}
		if(Identity==4){
			window.location.href="fk_main.jsp"
		}
	}
</script>
</html>
