/*$(document).ready(function(){
	$('#sch').click(function(){
		var keyword = document.getElementById("keyword").value;
		console.log(keyword);
		if(document.getElementById("option").value=="userid"){
			document.userSearch.action = "/memberSearch.do?id="+keyword ;
			console.log("userid",keyword);
			console.log("userid",document.userSearch.action);
		}else {
			document.userSearch.action = "/memberSearch.do?nick="+keyword ;
			console.log("nick",keyword);
			console.log("nick",document.userSearch.action);
		}
		document.userSearch.submit();
	});

});*/
function change(idx){
	if(idx=='0'){
		$('#user').attr('class','tab-pane fade active show in');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
	}else if(idx=='1'){
		$('#diaryboard').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
	}else if(idx=='2'){
		$('#communityboard').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
	}else if(idx=='3'){
		$('#comment').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#diaryboard').attr('class','tab-pane fade show');
	}
	
}