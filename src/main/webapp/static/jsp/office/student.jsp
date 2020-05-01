<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<body style="height: 100%;overflow: scroll;overflow-y:hidden;"> 
		<div class="container">
				
		 </div>
	</body>
	<script>
		var ListTitle=['编号','学生账号','密码','学生姓名','性别','年级','班级号','操作']
		var ListFeatures={"del":"删除"}
		var ListMatch={"gender":["女","男"],"grade":["","一年级","二年级","三年级","四年级"]}
		showData(1)//请求数据
		function showData(pageNO){
			$.ajax({
		        type: 'get',
		        url: "/Academic/office/getStudents",
		        data:{ "pageNO":pageNO},
		        datatype: 'json',
		        success: function (res) {
		        	console.log(res.data) 
		        	var JsonListDate=res.data
		        	GenerateTable('.container',JsonListDate,ListTitle,ListFeatures,ListMatch,pageNO)
					getCount("/Academic/office/getCountStudent");//请求数量
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		}
		function del(id){
			$.ajax({
		        type: 'post',
		        url: "/Academic/office/deleteStudent",
		        data:{ "id":id},
		        datatype: 'json',
		        success: function (res) {
		        	alert(res.data)
		        	var pageNO=$(".pageNO").text()
		        	showData(pageNO)
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		}
	</script>
</html>
