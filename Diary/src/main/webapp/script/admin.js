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

//블랙리스트 버튼누르면 블랙리스트 불러오기
function blacklist(){

	var data = {
		'report': "a"  //쓰레기값넣어줌
	};
	var setting = {
		url : '/blackMember.do',
		type : 'get',
		data : data,
		dataType : 'json',
		success : function(data) {
			var blacklist = data.blacklist; //블랙리스트값을 blacklist에 넣기
			console.log(blacklist);
				$("#blacklist").html('');   //기존에 있던 테이블지우기 
				for (var i = 0; i < blacklist.length; i++) {
					$('#blacklist').append(    //블랙리스트 테이블붙여넣기
							'<tr><td>'+blacklist[i].id+'</td><td>'
							+blacklist[i].nick+'</td><td>'
							+blacklist[i].reportcount +'</td><td>'
							+'<input type="checkbox" checked disabled="disabled" >'+'</td><td>'
							+'<button type="button"	class="btt btn-success btn-md">정보보기</button></td></tr>'
						);
				}
			},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);

}

//일지계시판-신고된 게시물보기 버튼누르면 신고된글리스트 불러오기
function reportdlist(){
	var data = {
		'report':"a"
	};
	var setting ={
		url : '/reportdlist.do', 
		type : 'get',
		data : data,
		dataType : 'json',
		success : function(data){
			var reportdlist = data.reportdlist;
			$("#dlist").html('');
			for( i = 0; i<reportdlist.length; i++ ){
				$("#dlist").append(
				'<tr><td>'+reportdlist[i].dtitle+'</td><td>'
				+reportdlist[i].nick+'</td><td>'
				+'<button type="button"	class="btn-danger btn-md"> 글보기 </button></td><td>'
				+'<button type="button"	class="btn-danger btn-md"> 삭제 </button></td><td>'
				+'<button type="button" class="btn-danger btn-md"> 신고사유 </button></td></tr>'
				);
			}
			
		},error:function(){
			alert("error");
		}
		
	};
	$.ajax(setting);
	
}

////일지계시판-신고된 글 삭제 버튼 누르면 삭제 
//function deletedreport(idx){
//	var data ={
//		'idx':idx
//	};
//	var setting = {
//			url='/deletedreport.do',
//			data: data,
//			type= 'get',
//			dataType= 'json',
//			success : function(data){
//				
//			},error : function(){
//				alert("error");
//			}
//			
//		
//	};
//	$.ajax(setting);
//	
//}