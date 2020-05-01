//生成table
function GenerateTable(DOM,JsonListDate,ListTitle,ListFeatures,ListMatch,pageNO){
	$(DOM).html("");
	var tableHtml='<table class="table table-striped table-bordered table-hover table-condensed"><thead><tr>'
	for (index in ListTitle) {
		tableHtml+='<th>'+ListTitle[index]+'</th>'
	}
	tableHtml+='</tr></thead><tbody>'
	if(JsonListDate!=null && JsonListDate.length>0){
		JsonListDate.forEach((data)=>{
			var id="";
			tableHtml+='<tr>'
			for(var obj in data)
			{
				var ismatch=true;
				for(var match in ListMatch){
					if(obj==match){
						tableHtml+='<td>'+ListMatch[match][data[obj]]+'</td>'
						ismatch=false;
					}
				}
				if(obj=="id"){
					id=data[obj]
				}
				if(ismatch)
				tableHtml+='<td>'+data[obj]+'</td>'
			}
			tableHtml+='<td><div class="dropdown"> <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">请选择'
			tableHtml+='<span class="caret"></span></button><ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">'
			for(var features in ListFeatures){
				tableHtml+='<li role="presentation"> <a role="menuitem" tabindex="-1" href="#" onclick='+features+'('+id+')>'+ListFeatures[features]+'</a></li>'
			}
			tableHtml+='</ul></div></td></tr>'
		})
	}else{
		tableHtml+="<tr><td style='text-align: center;' colspan='"+ListTitle.length+"'>暂无数据</td></tr>"
	}
	tableHtml+='</tbody></table>'
	tableHtml+='<div class="container">'
	tableHtml+='<button type="button" class="btn btn-default active" onclick="upPage()">上一页</button> '
	tableHtml+='<span class="pageNO">'+pageNO+'</span>/<span class="pageSize">1</span>'
	tableHtml+='<button type="button" class="btn btn-default active" onclick="nextPage()">下一页</button>'
	tableHtml+='<span>跳转到</span>'
	tableHtml+='<input type="text" name="page" style="width: 30px;">'
	tableHtml+='<span>页</span>'
	tableHtml+='<button type="button" class="btn btn-default active" onclick="PageGO()">GO</button> '
	tableHtml+='</div>'
	$(DOM).append(tableHtml);
}

function nextPage(){
	var Page= $(".pageNO").text();
	var totalPage= $(".pageSize").text();
	if(Page<totalPage){
		showData(Page*1+1)
	}
 }
 function upPage(){
		var Page= $(".pageNO").text();
		if(Page>1){
			showData(Page*1-1)
		}
 }
 function PageGO(){ 
	 var totalPage= $(".pageSize").text();
	 var page= $("input[name='page']").val().trim();
	 if(page<=totalPage && page>=1){
		showData(page)
	 }
 }
 
 function getCount(url,data){
	 $.ajax({
	     type:'get',
	     url: url,
	     data:data,
	     datatype: 'json',
	     success: function (res) {
	    	if(res.data>8){
     			$(".pageSize").text(Math.ceil(res.data/8));
     		}else{
     			$(".pageSize").text(1);
     		}
	     }, error:function(err){
	     	console.log(err);
	        alert("请求异常")
	     }
	});
 }
 
//接收一个值
	function oneValues(){
		var result;
		var url=window.location.search; //获取url中"?"符后的字串 
		if(url.indexOf("?")!=-1){
		result = url.substr(url.indexOf("=")+1);
		}
		return result;
	}

