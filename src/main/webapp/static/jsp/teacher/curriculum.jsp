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
	.Addcurriculum{
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
		<div class="container Addcurriculum hidden">
			<div class="page-header">
				<h1>课程申请<small>请填写申请信息内容</small></h1>
			</div> 
			 <input type="email" name="classTime" style="margin: 30px 0px; width: 90%;" class="form-control" placeholder="">
			 <input type="email" name="courseName" disabled="disabled" style="margin: 30px 0px; width: 90%;" class="form-control">
			<br />
			<button type="button" class="btn btn-primary" style="width: 100px;" onclick="AddCurriculum()">提交</button>
			<button type="button" class="btn btn-primary" style="width: 100px;" onclick="$('.Addcurriculum').addClass('hidden')">关闭</button>
		</div>
		<div class="container showdata">
				
		 </div>
	</body>
	<script>
	var ListTitle=['编号','课程名','状态','上传时间','上课教室',"操作"]
	var ListMatch={'courseStatus':["可以申请","已被申请"]}
	var ListFeatures={"showAddCurriculum":"申请课程"}
	getCount("/Academic/Teacher/getCoursesCount");//请求数量
		showData(1)//请求数据
		function showData(pageNO){
			$.ajax({
		        type: 'get',
		        url: "/Academic/Teacher/getCourses",
		        data:{ "pageNO":pageNO},
		        datatype: 'json',
		        success: function (res) {
		        	console.log(res.data) 
		        	var JsonListDate=res.data 
		        	GenerateTable('.showdata',JsonListDate,ListTitle,ListFeatures,ListMatch,pageNO)
		        }, error:function(err){
		        	console.log(err);
		            alert("请求异常")
		        }
		    });
		}
	
	function showAddCurriculum(id){
		$.ajax({
	        type: 'get',
	        url: "/Academic/Teacher/getCourse",
	        data:{"id":id},
	        datatype: 'json',
	        success: function (res) {
	        	console.log(res)
	        	if(res.data.courseStatus==0){
	        		$('.Addcurriculum').removeClass('hidden');
	        		$("input[name='courseName']").val(res.data.courseName);
	        		courseId=res.data.id;
	        	}else{
	        		alert("该课程已被申请！")
	        	}
	        },error:function(err){
	            alert("请求异常")
	        }
		});
	}
		var courseId=0;
		function AddCurriculum(){
			var classTime=$("input[name='classTime']").val().trim();
			var teacherId=oneValues();
			var studentIds="[]"
			$.ajax({
			     type:'get',
			     url: "/Academic/Teacher/getName",
			     datatype: 'json', 
			     success: function (res) {
					$.ajax({
				        type: 'post',
				        url: "/Academic/Teacher/AddCurriculum",
				        data:{ "courseId":courseId,"classTime":classTime,"studentIds":studentIds,"teacherId":teacherId,"teachername":res.data},
				        datatype: 'json',
				        success: function (res) {
				        	alert(res.success)
				        	$("input[name='classTime']").val("")
				        	var pageNO=$(".pageNO").text()
				        	showData(pageNO)
				        }, error:function(err){
				        	console.log(err);
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
