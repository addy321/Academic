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
		var ListTitle=['编号','学科','分数','录入时间']
		var ListFeatures=null
		var ListMatch=null
		var id=oneValues() 
		getCount("/Academic/Student/getAchievementCount",{id:id});//请求数量
		showData(1) 
		function showData(pageNO){
			$.ajax({
		        type: 'get',
		        url: "/Academic/Student/getAchievements",
		        data:{"pageNO":pageNO,"id":id},
		        datatype: 'json',
		        success: function (res) {
		        	var data=res.data
		        	GenerateTable('.container',data,ListTitle,ListFeatures,ListMatch,pageNO)
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		}
		
	</script>
</html>
