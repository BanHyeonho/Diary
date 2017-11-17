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

//일지게시판-신고된 게시물보기 버튼누르면 신고된글리스트 불러오기
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

//일지게시판-신고된 글 삭제 버튼 누르면 삭제 
function deletediary(ix){
	if(confirm("삭제하시겠습니까")){
		
	var data ={	'idx':ix };
	var setting = {
			url : '/deletediary.do',
			data: data,
			type : 'get',
			dataType : 'json',
			success : function(data){
				$('#' + ix).remove();
				alert("삭제되었습니다");
			},error : function(){
				alert("error");
			}
	};
	$.ajax(setting);
	}
}

//만남게시판 -신고된 게시물보기 버튼눌렀을때 
function reportclist(){
	var data = {
		'report':"a"
	};
	var setting ={
		url : '/reportclist.do', 
		type : 'get',
		data : data,
		dataType : 'json',
		success : function(data){
			var reportclist = data.reportclist;
			$("#clist").html('');
			for( i = 0; i<reportclist.length; i++ ){
				$("#clist").append(
				'<tr><td>'+reportclist[i].ctitle+'</td><td>'
				+reportclist[i].nick+'</td><td>'
				+'<button type="button"	class="btn-info btn-md"> 글보기 </button></td><td>'
				+'<button type="button"	class="btn-info btn-md"> 삭제 </button></td><td>'
				+'<button type="button" class="btn-info btn-md"> 신고사유 </button></td></tr>'
				);
			}
			
		},error:function(){
			alert("error");
		}
		
	};
	$.ajax(setting);
	
}
//만남의장 삭제 버튼눌렀을때
function deletecommunity(ix){
	if(confirm("삭제하시겠습니까?")){
	var data ={ 'idx': ix};
	var setting = {
			url : '/deletecommunity.do',
			data: data,
			type : 'get',
			dataType : 'json',
			success : function(data){
				$('#' + ix).remove();
				alert("삭제되었습니다");
			},error : function(){
				alert("error");
			}
	};
	$.ajax(setting);
	} 
	}

//댓글탭 눌렀을때 여행일지신고된 댓글보기 
function commentList(){

	var data = {
			'clist':"a"
		};
		var setting ={
			url : '/reportcomment.do', 
			type : 'get',
			data : data,
			dataType : 'json',
			success : function(data){
				var reportDcomment = data.reportDcomment;
				if ($('#commentlist')[0].children[0] == null) {
				for( i = 0; i<reportDcomment.length; i++ ){
					$("#commentlist").append(
					'<tr id='+reportDcomment[i].idx+'><td>'+reportDcomment[i].contents+'</td><td>'
					+reportDcomment[i].nick+'</td><td>'
					+'<button type="button"	class="btn-warning btn-md"> 글보기 </button></td><td>'
					+'<button type="button"	class="btn-warning btn-md"onclick="deleteDcomment('+reportDcomment[i].idx+')";> 삭제 </button></td><td>'
					+'<button type="button" class="btn-warning btn-md"> 신고사유 </button></td></tr>'
					);
				}
				}
			},error:function(){
				alert("error");
			}
			
		};
		$.ajax(setting);
	
	
}

//만남의장 댓글보기 눌렀을때 신고된 댓글 불러오기
function Comcomment(){
	
	var data = {
			'colist':"a"
		};
		var setting ={
			url : '/reportcomment.do', 
			type : 'get',
			data : data,
			dataType : 'json',
			success : function(data){
				var reportCcomment = data.reportCcomment;
				$("#commentlist").html('');
				
				if ($('#commentlist')[0].children[0] == null) {
				for( i = 0; i<reportCcomment.length; i++ ){
					$("#commentlist").append(
					'<tr id='+reportCcomment[i].idx+'><td>'+reportCcomment[i].contents+'</td><td>'
					+reportCcomment[i].nick+'</td><td>'
					+'<button type="button"	class="btn-warning btn-md"> 글보기 </button></td><td>'
					+'<button type="button"	class="btn-warning btn-md" onclick="deletecomment('+reportCcomment[i].idx+')";> 삭제 </button></td><td>'
					+'<button type="button" class="btn-warning btn-md"> 신고사유 </button></td></tr>'
					);
				}
				}
			},error:function(){
				alert("error");
			}
			
		};
		$.ajax(setting);
	
	
}
// 여행일지 신고된 댓글 삭제하기 
function deleteDcomment(ix){
	if(confirm("삭제하시겠습니까?")){
	var data ={ 'idx': ix};
	var setting = {
			url : '/deleteDcomment.do',
			data: data,
			type : 'get',
			dataType : 'json',
			success : function(data){
				$('#' + ix).remove();
				alert("삭제되었습니다");
			},error : function(){
				alert("error");
			}
	};
	$.ajax(setting);
	} 
	}
//계정관리-정보보기버튼 눌렀을 때
function openWin(id) {
	window.open("http://localhost:8089/oneMember.do?id=" + id,
					"한명의 멤버보기",
					"width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}

function DviewopenWin(idx) {
	window.open("http://localhost:8089/viewDiary.do?idx=" + idx,
					"여행일지 글보기",
					"width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}

function CviewopenWin(idx) {
	window.open("http://localhost:8089/viewCommunity.do?idx=" + idx,
					"만남의장 글보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

function dreportReason(idx) {
	window.open("http://localhost:8089/dreportReason.do?idx=" + idx,
					"여행일지 신고사유보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//function communitysearch(){
//	var option =document.searchtool.option.value;
//	var keyword = document.searchtool.keyword.value;
//	console.log(option);
//	console.log(option);
//	var data = {
//			'opt' : option,
//			'key' : keyword
//		};
//	var setting = {
//			url : '/communitySearch.do',
//			type : 'get',
//			data : data,
//			dataType : 'json',
//			success :  function(data){
//				var communitySearch = data.communitySearch;
//				$("#clist").html('');
//				for( i = 0; i<communitySearch.length;i++){
//					$("#clist").append(
//					'<tr id='+communitySearch[i].idx+'><td>'+communitySearch[i].ctitle+'</td><td>'
//					+communitySearch[i].nick+'</td><td>'
//					+'<button type="button"	class="btn-info btn-md" onclick="">글보기</button></td><td>'
//					+'<button type="button"	class="btn-info btn-md" onclick="deletecommunity('+communitySearch[i].idx+');">삭제</button></td><td>'
//					+'<button type="button" class="btn-info btn-md"> 신고사유 </button></td></tr>'
//					);
//				}
//			},error : function() {
//				alert("error");
//			}
//	};
//	$.ajax(setting);
//	
//}