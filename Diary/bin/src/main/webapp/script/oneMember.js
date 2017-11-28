/**
 * 
 */
function rcount(tag){

	if(tag.value>=3){
		
		document.getElementById("chk").checked=true;
		
	}else{
		
		document.getElementById("chk").checked=false;
	}
	
}

function updateConfirm(id) {
	alert("정보가 업데이트되었습니다.");
	opener.location.href="/confirm.do?id="+id+"&reportcount="+document.sform.reportcount.value;
	self.close();
	}

function deleteAccount(id){
	if(confirm("계정을 삭제하시겠습니까?")==true){
	alert("삭제되었습니다");
	opener.location.href="/deleteAccount.do?id="+id;
	self.close();
	}
}


 
