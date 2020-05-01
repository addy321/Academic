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
		
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1>教师解答<small>为学生解决疑难杂惑</small></h1>
			</div> 
			<div class="list">
			<div class="list-group">
			  <a href="#" class="list-group-item active">
			    <p class="list-group-item-text">
				    <span>四年级</span>
				    <span>C3qdq班</span>
				    <span>张三问:</span> 
				    <span style="float: right;">2020/2/2</span>
			    </p>
			    <h3 class="list-group-item-heading" style="margin-top: 10px;">
			   	 1+1到底等于几？
			    </h3> 
			    <div>
			    	<h5 class="list-group-item-heading">
					   	<span>老师说：</span><span>等于三</span><span style="float: right;">2020/2/2</span>
					</h5> 
			    </div>
			    
			    <div class="input-group">
				  <input type="text" class="form-control" placeholder="评论" aria-describedby="basic-addon2">
				  <span class="input-group-addon" id="basic-addon2">提交</span>
				</div>
			  </a>
			</div>
			</div>
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
	var Studentid="";
	$.ajax({
	     type:'get',
	     url: "/Academic/Student/getName",
	     datatype: 'json', 
	     success: function (res) { 
	    	 Studentid=res.data;
	    	 $.ajax({
	    	     type:'get',
	    	     url: "/Academic/Teacher/getQuestionsCount",
	    	     datatype: 'json',
	    	     data:{"studentId":res.data},
	    	     success: function (res) {
	    	    	if(res.data>3){
	        			$(".pageSize").text(Math.ceil(res.data/3));
	        		}else{
	        			$(".pageSize").text(1);
	        		}
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
	
	showData(1)
	function showData(pageNO){
		$.ajax({
	        type: 'get',
	        url: "/Academic/Teacher/getQuestions",
	        data:{"pageNo":pageNO,"studentId":Studentid},
	        datatype: 'json',
	        success: function (res) {
	        	var data=res.data
	        	$(".list").html("")
	        	for(var i=0;i<data.length;i++){
	        		var html='<div class="list-group"> <a href="#" class="list-group-item active"> <p class="list-group-item-text">'
	    	        	html+='<span>'+data[i].student.grade+'年级</span> <span>'+data[i].student.classname+'班</span> <span>'+data[i].student.name+'问:</span> <span style="float: right;">'+data[i].time+'</span> </p>'
	    				html+='<h3 class="list-group-item-heading" style="margin-top: 10px;">'+data[i].problem+'</h3>'
	    				html+='<div class="'+data[i].id+'"></div>'
	    				$(".list").append(html);
	    				showComment(data[i].id)
	        	}
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常")
	        }
	    });
	}
	function  showComment(questionid){
		$.ajax({
	        type: 'get',
	        url: "/Academic/Teacher/getAnswers",
	        data:{ "questionid":questionid},
	        datatype: 'json',
	        success: function (res) {
	        	var data=res.data
	        	console.log(data) 
	        	$("."+questionid).html("");
	        	for(var i=0;i<data.length;i++){
	        		var CommentHtml="";
	        		CommentHtml+='<h5 class="list-group-item-heading"><span>'+data[i].teacherName+'老师说:</span><span>'+data[i].content+'</span><span style="float: right;">'+data[i].answertime+'</span></h5>'
	        		$("."+questionid).append(CommentHtml);
	        	}
	        }, error:function(err){
	        	console.log(err);
	            alert("请求异常");
	        }
	    });
	} 
	
	function nextPage(){
		var Page= $(".pageNO").text();
		var totalPage= $(".pageSize").text();
		if(Page<totalPage){
			showData(Page*1+1)
			$(".pageNO").text(Page*1+1)
		}
	 }
	
	 function upPage(){
			var Page= $(".pageNO").text();
			if(Page>1){
				showData(Page*1-1)
				$(".pageNO").text(Page*1-1)
			}
	 }
	 function PageGO(){ 
		 var totalPage= $(".pageSize").text();
		 var page= $("input[name='page']").val().trim();
		 if(page<=totalPage && page>=1){
			showData(page)
			$(".pageNO").text(Page)
		 }
	 }
	</script>
</html>
