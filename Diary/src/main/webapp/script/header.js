function login(){
	if(document.loginform.id.value==''){
		alert('아이디를 입력하세요');
		document.loginform.id.focus();
		return false;
	}else if(document.loginform.password.value==''){
		alert('비밀번호를 입력하세요');
		document.loginform.password.focus();
		return false;
	}
	return true;
}
function msg_hham(id){
	//console.log(' 얍얍얍');
	var id = id;
	var data = {
		'id' : id
	};
	
	var setting = {
		url : '/msg_chk.do',
		type : 'get',
		data : data,
		dataType : 'json',
		success: function(data) {
			console.log(data);
	         if(data.chk.length >= 1) {
	              // Do somothing when data is not null
	        	// alert(data.chk);
//	        	 alert(data.chk[7].chk);
	        	// console.log($('#msg_chk').css('background-color'));
	        	 setInterval(function(){
	        		 if($('#msg_chk').css('background-color')=="rgb(255, 0, 0)"){
	        			 $('#msg_chk').css('background-color','#1f9bcf');
	        		 }else{
	        			 $('#msg_chk').css('background-color','red');
	        		 }
	        		 
	        	 },1000);
	         }else{
	        	 $('#msg_chk').css('background-color','#1f9bcf');
	         }
	    },
		error : function() {
			
		}
	};
	$.ajax(setting);
}

function msg_move(){
	
	location.href=('/mypage.do?msg=msg');
	
}
function toggle(){
	$('.navi').toggle(function(){
		if($('.contents').css("width")=="950px"){
			$('.contents').animate({
				"width":"730px",
				"margin-left":"250px"
			},100);
			$('.oneDiaryDiv').css("width","48%");
			$('.oneDiaryContents').css("width","730px");
		}else{
			$('.contents').animate({
				"width":"950px",
				"margin-left":"30px"
			},100);
			$('.oneDiaryDiv').css("width","60%");
			$('.oneDiaryContents').css("width","950px");
		}
	});
}
function goWrite(session){
	if(session==''){
		alert('로그인하세요.');
		document.loginform.id.focus();
	}else{
		location.href='/diarywrite.do';
	}
}

function wow_following(id){
		$("#aa").toggle();
		
		var id = id;
		var data = {
			'id' : id
		};
		var setting = {
			url : '/following.do',
			type : 'post',
			data : data,
			dataType : 'json',
			success : function(data) {
				var following_go = data.following_go;
				//consolo.log(following_go);
				$("#aa").empty();
				if ($('#aa')[0].children[0] == null) {
					for (var i = 0; i < following_go.length; i++) {
						//alert(following_go[i].following);
						$('#aa').append('<a href="#" onclick=following_write("'+following_go[i].following+'");>'+ following_go[i].following +'</a><br/>');
						
					}
				}
				
			},
			error : function() {
				alert('error');
			}

		};
		$.ajax(setting);
}

function following_write(b){
	location.href="/search.do?option=작성자&keyword="+b;
}
