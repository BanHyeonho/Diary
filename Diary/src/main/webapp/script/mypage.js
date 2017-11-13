function confirm(){
	 if(document.sform.name.value==""){
			alert("이름을 입력하세요");
			document.sform.name.focus();
			return false;
		}else if(document.sform.password.value==""){
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