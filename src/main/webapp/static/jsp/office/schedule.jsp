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
<style>
	.Addclassroom,.Addcourse,.AddMustbedone{
		position: absolute;
		left:50%;/**左边50%**/
		top:5%;/**顶部50%**/
		margin-left:-200px;/**左移-50%**/
		width: 400px;
		border: 1px #cdb6b6 double;
		border-radius: 15px;
		background-color: #FFFFFF;
		padding: 20px;
	}
</style>
<body>
	<div class="container Addcourse hidden">
		<div class="page-header">
			<h1>教师排课<small>请填写排课信息内容</small></h1>
		</div> 
		 <input type="email" name="courseName" style="margin: 30px 0px; width: 90%;" class="form-control" placeholder="课程名">
		 <input type="email" name="classroomId" disabled="disabled" style="margin: 30px 0px; width: 90%;" class="form-control">
		<br />
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="Addcourse()">提交</button>
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="$('.Addcourse').addClass('hidden')">关闭</button>
	</div>
	<div class="container Addclassroom hidden">
		<div class="page-header">
			<h1>多媒体教室添加<small><br/>请填写多媒体教室编号</small></h1>
		</div> 
		 <input type="email" name="className" style="margin-bottom:20px; width: 90%;" class="form-control" placeholder="多媒体教室编号"> 
		 <select style=" width: 90%;height:35px;margin-bottom:20px;l" class="form-control" id="types">
		  	<option>请选择教室类型</option>
		    <option value="0">普通教室</option>
		    <option value="1">多媒体教室</option>
		 </select>
		 <select style=" width: 90%;height:35px;margin-bottom:20px;" class="form-control" id="size">
		  	<option>请选择教室大小</option>
		    <option value="0">大</option>
		    <option value="1">中</option>
		    <option value="2">小</option>
		 </select>
		<br />
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="Addclassroom()">提交</button>
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="$('.AddMustbedone').addClass('hidden')">关闭</button>
	</div>
	<div class="container AddMustbedone hidden">
		<div class="page-header">
			<h1>必修课添加<small><br/>请填写以下信息</small></h1>
		</div> 
		<input type="email" name="courseNamea" style="margin-bottom:20px; width: 90%;" class="form-control" placeholder="课程名"> 
		 <input type="email" name="classTiem" style="margin-bottom:20px; width: 90%;" class="form-control" placeholder="上课时间"> 
		 <select style=" width: 90%;height:35px;margin-bottom:20px;" class="form-control" id="teachers">
		  	<option>请选择老师</option>
		 </select>
		 <select style=" width: 90%;height:35px;margin-bottom:20px;" class="form-control" id="className">
		  	<option>请选择班级</option>
		    <option value="A1">A1</option>
		    <option value="B2">B2</option>
		    <option value="C3">C3</option>
		    <option value="D4">D4</option>
		 </select>
		 <select style=" width: 90%;height:35px;margin-bottom:20px;" class="form-control" id="grades">
		  	<option>请选择年级</option>
		    <option value="1">一年级</option>
		    <option value="2">二年级</option>
		    <option value="3">三年级</option>
		    <option value="4">四年级</option>
		 </select>
		<br />
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="AddMustbedone()">提交</button>
		<button type="button" class="btn btn-primary" style="width: 100px;" onclick="$('.AddMustbedone').addClass('hidden')">关闭</button>
	</div>
	<p class="container">
		<button type="button" class="btn btn-primary" style="width: 200px;" onclick="$('.Addclassroom').removeClass('hidden')">添加多媒体教室</button>
	</p> 
	<div class="container tableData">
		
	</div>
</body>
<script>
var ListTitle=['编号','多媒体教室编号','状态','教室类型','教室大小','操作']
var ListFeatures={"del":"删除","showAddcourse":"添加选修课程","showAddMustbedone":"添加必修课程"}
var ListMatch={"types":["普通教室","多媒体教室"],"size":["大","中","小"],"status":["空教室","已安排课程"]}
showData(1)//请求数据
function showData(pageNO){
	$.ajax({
        type: 'get',
        url: "/Academic/office/getClassrooms",
        data:{ "pageNO":pageNO},
        datatype: 'json',
        success: function (res) {
        	var JsonListDate=res.data
        	GenerateTable('.tableData',JsonListDate,ListTitle,ListFeatures,ListMatch,pageNO)
        	getCount("/Academic/office/getClassroomsCount");//请求数量
        }, error:function(err){
        	console.log(err);
            alert("请求异常")
        }
    });
}
function del(id){ 
	$.ajax({
        type: 'post',
        url: "/Academic/office/deleteClassrooms",
        data:{"id":id},
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

function AddMustbedone(){
	var courseName=$("input[name='courseNamea']").val().trim()
	var classroomId=$("input[name='classroomId']").val();
	var classTime=$("input[name='classTiem']").val().trim()
	var className=$("#className").val()
	var teacherid= $("#teachers").val()
	var teacherName=$("#teachers").find('option:selected').text();
	var grade= $("#grades").val() 
	$.ajax({
        type: 'post',
        url: "/Academic/office/AddMustbedone",
        data:{ "courseName":courseName,"classroomId":classroomId,"classTime":classTime,"teacherId":teacherid,"grade":grade,"className":className,"teacherName":teacherName},
        datatype: 'json',
        success: function (res) {
        	alert(res.data)
        	var pageNO=$(".pageNO").text()
        	showData(pageNO)
       		$("input[name='courseNamea']").val("")
			$("input[name='classroomId']").val("");
			$("input[name='classTiem']").val("")
			$("input[name='className']").val("")
        	var type= $("#teachers").val("请选择老师")
			var size= $("#className").val("请选择年级")
			var size= $("#grades").val("请选择年级")
        }, error:function(err){
        	console.log(err);
            alert("请求异常")
        }
    });
}

function Addclassroom(){
	var className=$("input[name='className']").val().trim()
	if(className!=""){ 
		$.ajax({
	        type: 'get',
	        url: "/Academic/office/getClassroom",
	        data:{"id":0,"className":className},
	        datatype: 'json',
	        success: function (res) {
	        	if(res.data!=null){
	        		alert("该编号已存在")
	        	}else{
	        		var type= $("#types").val()
	        		var size= $("#size").val()
	        		$.ajax({
	    		        type: 'post',
	    		        url: "/Academic/office/AddClassrooms",
	    		        data:{ "className":className,"status":0,"type":type,"size":size},
	    		        datatype: 'json',
	    		        success: function (res) {
	    		        	alert(res.data)
	    		        	var pageNO=$(".pageNO").text()
	    		        	showData(pageNO)
	    		        	$("input[name='className']").val("")
	    		        	var type= $("#types").val("请选择教室类型")
	        				var size= $("#size").val("请选择教室大小")
	    		        }, error:function(err){
	    		        	console.log(err);
	    		            alert("请求异常")
	    		        }
	    		    });
	        	}
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常")
	        }
	    });
	}
}
function showAddcourse(id){
	$.ajax({
        type: 'get',
        url: "/Academic/office/getClassroom",
        data:{"id":id,"className":""},
        datatype: 'json',
        success: function (res) {
        	if(res.data.status==0){
        		$("input[name='classroomId']").val(res.data.className);
        		$('.Addcourse').removeClass('hidden');
        	}else{
        		alert("该教室不是空教室！")
        	}
        },error:function(err){
            alert("请求异常")
        }
	});
}
function showAddMustbedone(id){
	$.ajax({
        type: 'get',
        url: "/Academic/office/getClassroom",
        data:{"id":id,"className":""},
        datatype: 'json',
        success: function (res) {
        	if(res.data.status==0){
        		$.get("/Academic/office/geTeachersOptions", function(data){
        			$("#teachers").html("")
        			var option=" <option>请选择老师</option>" 
       		    	for(var i=0;i<data.data.length;i++){
       		    		option+="<option value="+data.data[i].teacherID+">"+data.data[i].name+"</option>"
       		    	}
        			$("#teachers").html(option)
       		  	});
        		$("input[name='classroomId']").val(res.data.className);
        		$('.AddMustbedone').removeClass('hidden');
        	}else{
        		alert("该教室不是空教室！")
        	}
        },error:function(err){
            alert("请求异常")
        }
	});
}

function Addcourse(){
	var classroomId=$("input[name='classroomId']").val();
	var courseName=$("input[name='courseName']").val().trim();
	if(courseName!="" && classroomId!=""){
		$.ajax({
	        type: 'post',
	        url: "/Academic/office/Addcourse",
	        data:{"classroomId":classroomId,"courseName":courseName},
	        datatype: 'json',
	        success: function (res) {
	        	alert(res.data)
	        	$("input[name='courseName']").val("")
	        	$("input[name='classroomId']").val("")
	        	var pageNO=$(".pageNO").text()
        		showData(pageNO)
	        }, error:function(err){
	            alert("请求异常")
	        }
	    });
	}
}

function getTecher(){
	 $.get("/Academic/office/geTeachers", function(data, status){
	    alert("Data: " + data + "\nStatus: " + status);
	  });
}
</script>
</html>