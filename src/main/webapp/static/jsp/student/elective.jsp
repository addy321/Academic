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
	<body>
	<div class="container">
		<h2>参加课程</h2>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>课程编号</th>
					<th>上课时间</th>
					<th>学生参加人数</th>
					<th>多媒体教室</th> 
					<th>课程名</th>
					<th>上课教师</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="list">
				 
			</tbody>
		</table>
	</div>
	<div class="container">   
		 <button type="button" class="btn btn-default active" onclick="upPage()">上一页</button> 
		  <span class="pageNO">1</span>/<span class="pageSize">2</span> 
		 <button type="button" class="btn btn-default active" onclick="nextPage()">下一页</button>
		 <span>跳转到</span>
		  <input type="text" name="page" style="width: 30px;">
		  <span>页</span>
		  <button type="button" class="btn btn-default active" onclick="PageGO()">GO</button>
	</div>
</body>
	<script> 
	getCount("/Academic/Student/getCurriculumsCount");//请求数量
	showData(1)
	function showData(pageNO){
		$.ajax({
	        type: 'get',
	        url: "/Academic/Student/getCurriculums",
	        data:{"pageNO":pageNO},
	        datatype: 'json',
	        success: function (res) {
	        	var data=res.data
	        	$(".list").html("") 
	        	for(var i=0;i<data.length;i++){
	        		var sutdents=JSON.parse(data[i].studentIds)
	    			var html='<tr><td>'+data[i].id+'</td><td>'+data[i].classTime+'</td><td>'+sutdents.length+'</td>'
	    			html+='<td>'+data[i].course.classroomId+'</td><td>'+data[i].course.courseName+'</td><td>'+data[i].teachername+'</td>'
	    			html+='<td><button type="button" class="btn btn-primary" style="width: 100px;" onclick="Add('+data[i].id+','+data[i].studentIds+')">参加课程</button></td></tr>'
	    			$(".list").append(html)
	    		}
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常")
	        }
	    });
	}
	function Add(id,Students){ 
		console.log(id)
		console.log(Students)
		var studentid=oneValues()
		console.log(studentid)
		for(var i=0;i<Students.length;i++){
			if(Students[i]==studentid){
				alert("你已申请参加了")
				return
			}
		}
		Students.push(studentid);
		var tesxstudentIds="["+Students.join(",")+"]"
		console.log(tesxstudentIds);
		$.ajax({
	        type: 'POST',
	        url: "/Academic/Student/UpdateCurriculum",
	        data:{ "studentIds":tesxstudentIds,"id":id},
	        datatype: 'json',
	        success: function (res) {
	        	alert(res.data)
	        	var Page= $(".pageNO").text();
	        	showData(Page)
	        }, error:function(err){
	        	console.log(err)
	            alert("请求异常")
	        }
	    }); 
	}
	</script>
</html>
