function acquit(idx,d){
	if(d==''){
		if(confirm("이글을 무죄로 하시겠습니까?")){
			opener.location.href='/Cacquit.do?idx='+idx;
			self.close();
		}
	}else{
	if(confirm("이글을 무죄로 하시겠습니까?")){
		opener.location.href='/Dacquit.do?idx='+idx;
		self.close();
	}
	}
}

function guilt(idx,d){
	
	if(d==''){
		console.log('커뮤니티');
		if(confirm("이 글을 유죄로하시겠습니까?")){
		opener.location.href='/cGuilt.do?idx='+idx;
		self.close();
		}
	}else{
		console.log('일지');
	if(confirm("이글을 유죄로 하시겠습니까?")){
		opener.location.href='/dGuilt.do?idx='+idx;
		self.close();
	}
	}
}

function coacquit(idx,dco){
	if(dco==''){
		console.log('커뮤니티무죄');
		if(confirm("이글을 무죄로 하시겠습니까?")){
			opener.location.href='/Coacquit.do?idx='+idx;
			self.close();
		}
	}else{
		console.log('일지무죄');
	if(confirm("이글을 무죄로 하시겠습니까?")){
		opener.location.href='/Doacquit.do?idx='+idx;
		self.close();
	}
	}
}

function coguilt(idx,dco){
	if(dco==''){
		console.log('커뮤니티유죄');
		if(confirm("이 글을 유죄로하시겠습니까?")){
		opener.location.href='/coGuilt.do?idx='+idx;
		self.close();
		}
	}else{
		console.log('일지유죄유죄',idx);
	if(confirm("이글을 유죄로 하시겠습니까?")){
		opener.location.href='/doGuilt.do?idx='+idx;
		self.close();
	}
	}
}