function acquit(){
	if(confirm("진짜 무죄입니까?")){
		opener.location.href='';
		self.close();
	}
}