$(document).ready(function(){
	$('#idchk').click(function(){
		if(document.sform.userid.value==""){
			alert("아이디를 입력하세요");
			document.sform.userid.focus();
			return false;
		}else{
			var userid= document.sform.userid.value;
			var data = {
					'id':userid
			};
			var setting={
					url:'/idchk.do',
					data: data,
					dataType:'json',
					success:function(data){
						$('#idresult').html("<font color='red'>"+data.result+"</font>");
						if(data.result=="아이디가 이미 존재합니다."){
							document.value.userid.value.focus();
						}else{
							document.sform.id.value=userid;
						}
					},
					error: function(){
						alert("error");
					}
					};
			$.ajax(setting);
			}
		});
	
	$('#nickchk').click(function(){
		if(document.sform.nickname.value==""){
			alert("닉네임을 입력하세요");
			document.sform.nickname.focus();
			return false;
		}else{
			var nickname= document.sform.nickname.value;
			var data = {
					'nick':nickname
			};
			var setting={
					url:'/nickchk.do',
					data: data,
					dataType:'json',
					success:function(data){
						$('#nresult').html("<font color='red'>"+data.result+"</font>");
						if(data.result=="닉네임이 이미 존재합니다."){
							document.value.nickname.value.focus();
						}else{
							document.sform.nick.value=nickname;
						}
					},
					error: function(){
						alert("error");
					}
					};
			$.ajax(setting);
			}
		});
			
	});

function confirm(){
	if(document.sform.userid.value==""){
		alert("아이디를 입력하세요");
		document.sform.id.focus();
		return false;
	}else if(document.sform.id.value==""){
		alert("아이디 중복체크하세요");
		document.getElementById("idchk").focus();
		return false;
	}
	else if(document.sform.name.value==""){
		alert("이름을 입력하세요");
		document.sform.name.focus();
		return false;
	}
	/*if(document.sform.id.value.length<6||document.sform.password.value.length>12){
		alert("아이디는 6~12자리까지 입력해주세요");
		document.sform.password.focus();
		return false;
	}*/
	else if(document.sform.password.value==""){
		alert("비밀번호를 입력하세요");
		document.sform.password.focus();
		return false;
	}else if(document.sform.pwdchk.value==""){
		alert("비밀번호를 확인하세요");
		document.sform.pwdchk.focus();
		return false;
	}else if(document.sform.password.value!=document.getElementById("pwdchk").value){
		alert("비밀번호가 일치하지 않습니다.");
		document.sform.password.value="";
		document.sform.pwdchk.value="";
		document.sform.password.focus();
		return false;
	}
	/*if(document.sform.password.value.length<4||document.sform.password.value.length>8){
		alert("비밀번호는 4~8자리까지 입력해주세요");
		document.sform.password.focus();
		return false;
	}*/
	else if(document.sform.name.value==""){
		alert("이름을 입력하세요");
		document.sform.name.focus();
		return false;
	}else if(document.sform.nickname.value==""){
		alert("닉네임을 확인하세요");
		document.sform.nick.focus();
		return false;
	}else if(document.sform.nick.value==""){
		alert("닉네임을 중복체크하세요");
		document.getElementById("nickchk").focus();
		return false;
	}else if(document.sform.birth.value==""){
		alert("생일을 입력하세요");
		document.sform.birth.focus();
		return false;
	}else if(document.sform.email1.value==""){
		alert("이메일을 입력하세요");
		document.sform.email1.focus();
		return false;	
	}else if(document.sform.answer.value==""){
		alert("질문에 답을 써주세요");
		document.sform.answer.focus();
		return false;
	}else{
		document.sform.email.value = document.sform.email1.value+"@" + document.sform.email2.value;
		document.sform.phone.value = "010-"+document.sform.phone2.value+"-"+document.sform.phone3.value;
		return true;
	}
		
}