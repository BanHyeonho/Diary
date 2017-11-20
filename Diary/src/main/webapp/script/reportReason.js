function acquit(idx){
	if(confirm("이글을 무죄로 하시겠습니까?")){
		opener.location.href='/acquit.do?idx='+idx;
		self.close();
	}
}

function guilt(idx){
	if(confirm("이글을 유죄로 하시겠습니까?")){
		opener.location.href='/guilt.do?idx='+idx;
		self.close();
	}
}