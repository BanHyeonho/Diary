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

function confirmm(id) {
	
	opener.location.href="/confirm.do?id="+id+"&reportcount="+document.sform.reportcount.value;
	self.close();
	}

function deleteAccount(id){
	if(confirm("계정을 삭제하시겠습니까?")==true){
	opener.location.href="/deleteAccount.do?id="+id;
	self.close();
	}
}


 
