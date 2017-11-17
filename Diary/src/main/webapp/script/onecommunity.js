function ccomment(nick,idx){
	
	var contents=$('#contents').val();
	console.log(idx);
	var setting ={
			'url':"/ccommentinsert.do",
			'type':"post",
			'dataType':"json",
			'data':{
				"nick":nick,
				"linkedidx":idx,
				"contents":contents
			},
				'success':function(data){
					alert('성공');
				},
				'error':function(e){}
		};
	
	$.ajax(setting);
	
}