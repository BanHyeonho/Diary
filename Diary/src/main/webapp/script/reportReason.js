function acquit(idx,d){
	if(d==null){
		
	}else{
	if(confirm("이글을 무죄로 하시겠습니까?")){
		opener.location.href='/acquit.do?idx='+idx;
		self.close();
	}
	}
}

function guilt(idx,d){
	if(d==null){
		console.log('커뮤');
	}else{
		console.log('일지');
	if(confirm("이글을 유죄로 하시겠습니까?")){
		opener.location.href='/guilt.do?idx='+idx;
	//	self.close();
	}
	}
}