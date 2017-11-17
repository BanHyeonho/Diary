function ccomment(nick,idx){
	
	var contents=$('#contents').val();

	var setting ={
			url:"/ccommentinsert.do",
			type:"post",
			dataType:"json",
			data:{
				"nick":nick,
				"linkedidx":idx,
				"contents":contents
			},
				success:function(data){
					
//					$("#ccomment")[0].children[0].append("<tr><td>"+nick+"</td></tr><tr><td>"+contents+"</td></tr>");
					
					var html = $("#ccomment").html();
					html+="<tr  vertical-align: bottom>"
					+"<td>"+nick +"</td></tr>"
					+"<tr>"
					+"<td>"+contents +"</td>"
					+"</tr>";
					$("#ccomment").html(html);
						
					
					
				},
				error:function(e){}
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