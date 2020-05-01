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
	<style>
	.AddAchievement{
		position: absolute;
		left:50%;/**左边50%**/
		top:15%;/**顶部50%**/
		margin-left:-200px;/**左移-50%**/
		width: 400px;
		border: 1px #cdb6b6 double;
		border-radius: 15px;
		background-color: #FFFFFF;
		padding: 20px;
	}
</style>
	<body style="height: 100%;overflow: scroll;overflow-y:hidden;"> 
	<div class="container AddAchievement hidden">
		<div class="page-header">
			<h1>学生成绩录入<small><br>请填写成绩内容</small></h1>
		</div>
		 <input type="email" name="fraction" style="margin: 30px 0px; width: 90%;" class="form-control" placeholder="分数">
		<br />
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="add()">提交</button>
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="$('.AddAchievement').addClass('hidden')">关闭</button>
	</div>
		<div class="data">
				
		 </div>
	</body>
	<script>
		var ListTitle=['编号','学生账号','密码','学生姓名','性别','年级','班级号','操作']
		var ListMatch={'gender':["女","男"],'grade':["一年级","二年级","三年级","四年级"]}
		var ListFeatures={"showAchievement":"录入成绩"}
		showData(1)//请求数据
		function showData(pageNO){
			$.ajax({
		        type: 'get',
		        url: "/Academic/Teacher/getStudents",
		        data:{ "pageNO":pageNO},
		        datatype: 'json',
		        success: function (res) {
		        	console.log(res.data) 
		        	var JsonListDate=res.data
		        	GenerateTable('.data',JsonListDate,ListTitle,ListFeatures,pageNO)
					getCount("/Academic/Teacher/getCountStudent");//请求数量
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		} 
		function showAchievement(id){   
       		$('.AddAchievement').removeClass('hidden'); 
       		 studentid=id;
		}
		var studentid=0;
		function add(){ 
			var fraction=$("input[name='fraction']").val().trim();
			$.ajax({
		        type: 'post',
		        url: "/Academic/Teacher/Addachievement",
		        data:{"fraction":fraction,"studentid":studentid},
		        datatype: 'json',
		        success: function (res) {
		        	alert(res.success)
		        	$("input[name='subject']").val("")
		        	$("input[name='fraction']").val("")
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		}
	</script>
</html>
