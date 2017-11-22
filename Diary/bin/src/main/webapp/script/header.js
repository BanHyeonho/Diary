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
	        			 $('#msg_chk').css('background-color','white');
	        		 }else{
	        			 $('#msg_chk').css('background-color','red');
	        		 }
	        		 
	        	 },1000);
	         }else{
	        	 $('#msg_chk').css('background-color','white');
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

