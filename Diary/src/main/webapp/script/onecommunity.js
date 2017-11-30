function ccomment(nick,idx){
	
	var contents=$('#contents').val();

	var setting ={
			"url":"/ccommentinsert.do",
			"type":"post",
			"dataType":"json",
			"data":{
				"nick":nick,
				"linkedidx":idx,
				"contents":contents
			},
				"success":function(data){
					
//					$("#ccomment")[0].children[0].append("<tr><td>"+nick+"</td></tr><tr><td>"+contents+"</td></tr>");
					
					var html = $("#ccomment").html();
					html+="<tr  vertical-align: bottom>"
					+"<td>"+nick+'<button type="button" class="btn btn-primary btn-sm" onclick=deleteccomment('+idx+');">댓글 삭제</button>'
					+"</td></tr>"
					+"<tr>"
					+"<td>"+contents +'<button type="button"  class="btn btn-primary btn-sm">신고</button></td>'
					+"</tr>";
					$("#ccomment").html(html);
						
					 
					
				},
				"error":function(e){}
		};
	
	$.ajax(setting);
	
}

function deleteccomment(idx){
	
	
	var setting ={
			url:"/deleteccomment.do",
			type:"get",
			dataType:"json",
			data:{
				"idx":idx
			},
				success:function(data){
					alert("삭제되었습니다.");
					
					
					$('.'+idx).remove();
						
					
					
				},
				error:function(e){}
		};
	
	$.ajax(setting);
	
}



function creportinsert(title,reporter,witerid,linkedidx){
	var type = $('#type').val();
	var reason = $('#reason').val();
	
	
	
	var data = {
			"linkedidx":linkedidx,
			"reporter":reporter,
			"title":title,
			"witerid":witerid,
			"type":type,
			"reason":reason
	};
	var setting = {
			"url":"/creportinsert.do",
			"data" : data,
			"type" : "post",
			"dataType":"json",
			"success":function(){
				alert('신고 되었습니다.');
				self.close();
			},
			"error":function(){}
	};
	
	
	$.ajax(setting);
	
	
}

function ccoreportinsert(reporter,witerid,linkedidx){
	var type = $('#type').val();
	var reason = $('#reason').val();
	
	
	
	var data = {
			"linkedidx":linkedidx,
			"reporter":reporter,
			"witerid":witerid,
			"type":type,
			"reason":reason
	};
	var setting = {
			"url":"/ccoreportinsert.do",
			"data" : data,
			"type" : "post",
			"dataType":"json",
			"success":function(){
				alert('신고 되었습니다.');
				self.close();
			},
			"error":function(){}
	};
	
	
	$.ajax(setting);
	
	
}