<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/Academic/static/bootstrap/css/bootstrap.css" />
		<script type="text/javascript" src="/Academic/static/js/jQuery.js" ></script>
		<script type="text/javascript" src="/Academic/static/bootstrap/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/Academic/static/js/tool.js" ></script> 
</head>
<body>
<div class="container showdata">
				
</div>
</body>
<script>
var ListTitle=['编号','课程名','上课教室','上课时间','所属年级','班级']
var ListMatch={"grade":["","一年级","二年级","三年级","四年级"]}
var ListFeatures=null

	showData(1)//请求数据
	function showData(pageNO){
		$.ajax({
	        type: 'get',
	        url: "/Academic/Teacher/getMustbedones",
	        data:{ "pageNO":pageNO},
	        datatype: 'json',
	        success: function (res) {
	        	console.log(res.data) 
	        	var JsonListDate=res.data 
	        	getCount("/Academic/Teacher/getMustbedonesCount");//请求数量
	        	GenerateTable('.showdata',JsonListDate,ListTitle,ListFeatures,ListMatch,pageNO)
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常")
	        }
	    });
	}
</script>
</html>