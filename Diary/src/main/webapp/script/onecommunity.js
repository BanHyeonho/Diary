function ccomment(nick,idx){
	
	var contents=$('#contents').val();
	console.log(idx);
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
					
					$("#ccomment")[0].children[0].append("<tr><td>"+nick+"</td></tr><tr><td>"+contents+"</td></tr>");
					
//					var html = $("#ccomment").html();
//					html+="<tr>"
//					+"<td>"+nick +"</td></tr>"
//					+"<hr>"
//					+"<tr>"
//					+"<td>"+contents +"</td>"
//					+"</tr>";
//					$("#ccomment").html(html);
//						
//					
					
				},
				error:function(e){}
		};
	
	$.ajax(setting);
	
}