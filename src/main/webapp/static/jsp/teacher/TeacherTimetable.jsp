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
	<div class="container">
		<h2>已申请课程</h2>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>课程编号</th>
					<th>上课时间</th>
					<th>学生参加人数</th>
					<th>多媒体教室</th> 
					<th>课程名</th>
					
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
<script type="text/javascript">
getCount("/Academic/Teacher/getCurriculumsCount",{"teacherId":oneValues()});//请求数量
showData(1)
function showData(pageNO){
	$.ajax({
        type: 'get',
        url: "/Academic/Teacher/getCurriculums",
        data:{"teacherId":oneValues(),"pageNo":pageNO},
        datatype: 'json',
        success: function (res) {
        	var data=res.data
        	$(".list").html("") 
        	for(var i=0;i<data.length;i++){
        		var Students=JSON.parse(data[i].studentIds).length
    			var html='<tr><td>'+data[i].id+'</td><td>'+data[i].classTime+'</td><td>'+Students+'</td><td>'+data[i].course.classroomId+'</td><td>'+data[i].course.courseName+'</td></tr>'		
    			$(".list").append(html)
    		}
        }, error:function(err){
        	console.log(err);
            alert("请求异常")
        }
    });
}
</script>
</html>