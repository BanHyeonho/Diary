function change(idx){
	if(idx=='0'){
		$('#user').attr('class','tab-pane fade active show in');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
		$('#a').attr('class','nav-link active');
		$('#b').attr('class','nav-link');
		$('#c').attr('class','nav-link');
		$('#d').attr('class','nav-link');
	}else if(idx=='1'){
		$('#diaryboard').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
		$('#a').attr('class','nav-link');
		$('#b').attr('class','nav-link active');
		$('#c').attr('class','nav-link');
		$('#d').attr('class','nav-link');
	}else if(idx=='2'){
		$('#communityboard').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#comment').attr('class','tab-pane fade show');
		$('#a').attr('class','nav-link');
		$('#b').attr('class','nav-link');
		$('#c').attr('class','nav-link active');
		$('#d').attr('class','nav-link');
	}else if(idx=='3'){
		commentList();
		$('#comment').attr('class','tab-pane fade active show in');
		$('#user').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#a').attr('class','nav-link');
		$('#b').attr('class','nav-link');
		$('#c').attr('class','nav-link');
		$('#d').attr('class','nav-link active');
		
	}else if(idx=='4'){
		Comcomment();
		$('#Comcomment').attr('class','tab-pane fade active show in');
		$('#comment').attr('class','tab-pane fade show');
		$('#user').attr('class','tab-pane fade show');
		$('#communityboard').attr('class','tab-pane fade show');
		$('#diaryboard').attr('class','tab-pane fade show');
		$('#a').attr('class','nav-link');
		$('#b').attr('class','nav-link');
		$('#c').attr('class','nav-link');
		$('#d').attr('class','nav-link active');
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
							+'<button type="button"	class="btt btn-primary btn-md" onclick="javascript:openWin('+blacklist[i].id+');">정보보기</button></td></tr>'
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
var d =null;
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
			
			if(d==null){ //신고사유버튼 한번만 뜨게
				$('#dTable').append('<th>신고사유</th>');
			}
			d=data;
			$("#dlist").html('');
		for( i = 0; i<reportdlist.length; i++ ){
				$("#dlist").append(
				'<tr><td>'+reportdlist[i].dtitle+'</td><td>'
				+reportdlist[i].nick+'</td><td>'
				+'<button type="button"	class="btn-primary btn-md" onclick="javascript:DviewopenWin('+reportdlist[i].idx+');"> 글보기 </button></td><td>'
				+'<button type="button"	class="btn-danger btn-md" onclick="deletediary('+reportdlist[i].idx+');"> 삭제 </button></td><td>'
				+'<button type="button" class="btn-primary btn-md" onclick="javascript:dreportReason('+reportdlist[i].idx+');"> 신고사유 </button></td></tr>'
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
var c=null;
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
			if(c==null){
				$('#cTable').append('<th>신고사유</th>')
			}
			c=data;
			for( i = 0; i<reportclist.length; i++ ){
				$("#clist").append(
				'<tr><td>'+reportclist[i].ctitle+'</td><td>'
				+reportclist[i].nick+'</td><td>'
				+'<button type="button"	class="btn-primary btn-md" onclick="javascript:CviewopenWin('+reportclist[i].idx+');"> 글보기 </button></td><td>'
				+'<button type="button"	class="btn-danger btn-md" onclick="deletecommunity('+reportclist[i].idx+');"> 삭제 </button></td><td>'
				+'<button type="button" class="btn-primary btn-md" onclick="javascript:creportReason('+reportclist[i].idx+');"> 신고사유 </button></td></tr>'
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
				$('.nav-link').attr('class','nav-link');
				$('#d').attr('class','nav-link active');
				
				
				if($('#comment').attr('class')!='tab-pane fade active show in'){
					$('#user').empty();
					$('#diaryboard').empty();
					$('#communityboard').empty();
					$('.in').css('display','none');	//만남댓글을 가려준다
					$('#Comcomment').attr('class','tab-pane fade active');
					$('#comment').attr('class','tab-pane fade active show in');
					$('.in').css('display','');
				}
				
				$("#dcommentlist").html('');
			
				for( i = 0; i<reportDcomment.length; i++ ){
					
					var con =reportDcomment[i].contents;
					
					if(con.length>=40){
						
						con=con.substring(0,40)+"...";
						}
					
					$("#dcommentlist").append(
					'<tr id='+reportDcomment[i].idx+'><td>'+con+'</td><td>'
					+reportDcomment[i].nick+'</td><td>'
					+'<button type="button"	class="btn-primary btn-md" onclick="javascript:dcoview('+reportDcomment[i].linkedidx+');"> 글보기 </button></td><td>'
					+'<button type="button"	class="btn-danger btn-md" onclick="deleteDcomment('+reportDcomment[i].idx+')";> 삭제 </button></td><td>'
					+'<button type="button" class="btn-primary btn-md" onclick="javascript:dcoreportReason('+reportDcomment[i].idx+');"> 신고사유 </button></td></tr>'
					);
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
				
				if($('#Comcomment').attr('class')!='tab-pane fade active show in'){
					$('#user').empty();
					$('#diaryboard').empty();
					$('#communityboard').empty();
					$('.in').css('display','none');	//일지댓글을 가려준다
					$('#comment').attr('class','tab-pane fade active');
					$('#Comcomment').attr('class','tab-pane fade active show in');
					$('.in').css('display','');
				}
								
				$("#ccommentlist").html('');
			
				for( i = 0; i<reportCcomment.length; i++ ){

					var con = reportCcomment[i].contents;
					if(con.length>=40){
						con= con.substring(0,40)+"...";
					}	

					$("#ccommentlist").append(
					'<tr id='+reportCcomment[i].idx+'><td>'+con+'</td><td>'
					+reportCcomment[i].nick+'</td><td>'
					+'<button type="button"	class="btn-primary btn-md" onclick="javascript:ccoview('+reportCcomment[i].linkedidx+');"> 글보기 </button></td><td>'
					+'<button type="button"	class="btn-danger btn-md" onclick="deleteCcomment('+reportCcomment[i].idx+')";> 삭제 </button></td><td>'
					+'<button type="button" class="btn-primary btn-md" onclick="javascript:ccoreportReason('+reportCcomment[i].idx+');"> 신고사유 </button></td></tr>'
					);
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

//커뮤니티 신고된 댓글 삭제하기 
function deleteCcomment(ix){
	if(confirm("삭제하시겠습니까?")){
	var data ={ 'idx': ix};
	var setting = {
			url : '/deleteCcomment.do',
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
	window.open("/oneMember.do?id=" + id,
					"한명의 멤버보기",
					"width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}
//여행일지-글보기버튼 눌렀을때
function DviewopenWin(idx) {
	window.open("/viewDiary.do?idx=" + idx,
					"여행일지 글보기",
					"width=1000, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}
//만남의장 -글보기 버튼 눌렀을때
function CviewopenWin(idx) {
	window.open("/viewCommunity.do?idx=" + idx,
					"만남의장 글보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}
//여행일지 -신고사유 버튼눌렀을때
function dreportReason(idx) {
	window.open("/dreportReason.do?d=d&idx=" + idx,
					"여행일지 신고사유보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}
//만남의장 -신고사유 버튼 눌렀을때
function creportReason(idx) {
	window.open("/creportReason.do?idx=" + idx,
					"여행일지 신고사유보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//(여행일지)댓글-글보기 버튼 눌렀을때
function dcoview(idx) {
	window.open("/viewDiary.do?idx=" + idx,
					"여행일지 신고된 댓글의 글보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//(만남의장)댓글-글보기 버튼 눌렀을때
function ccoview(idx) {
	window.open("/viewCommunity.do?idx=" + idx,
					"만남의장 신고된댓글의 글보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//여행일지댓글 -신고사유 버튼 눌렀을때
function dcoreportReason(idx) {
	window.open("/dcoreportReason.do?dco=dco&idx=" + idx,
					"여행일지댓글 신고사유보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//만남의장 -신고사유 버튼 눌렀을때
function ccoreportReason(idx) {
	window.open("/ccoreportReason.do?idx=" + idx,
					"여행일지댓글 신고사유보기",
					"width=1000, height=800, toolbar=yes, menubar=no, scrollbars=no, resizable=yes");
}

//여행일지댓글 검색할때
function dcosearch(){
	var option =document.dcosearchtool.option.value;
	var keyword = document.dcosearchtool.keyword.value;
	
	var data = {
			'nick' : option,
			'contents' : keyword
		};
	var setting = {
			url : '/dcosearch.do',
			type : 'get',
			data : data,
			dataType : 'json',
			success :  function(data){
				var dcosearch = data.dcosearch;
				$("#dcommentlist").html('');
				console.log('하하하');
				for( i = 0; i<dcosearch.length;i++){
					$("#dcommentlist").append(
					'<tr id='+dcosearch[i].idx+'><td>'+dcosearch[i].contents+'</td><td>'
					+dcosearch[i].nick+'</td><td>'
					+'<button type="button"	class="btn-primary btn-md" onclick="javascript:dcoview('+dcosearch[i].linkedidx+');">글보기</button></td><td>'
					+'<button type="button"	class="btn-danger btn-md" onclick="deleteDcomment('+dcosearch[i].idx+');">삭제</button></td><td>'
					+'<button type="button" class="btn-primary btn-md" onclick="javascript:dcoreportReason('+dcosearch[i].idx+');"> 신고사유 </button></td></tr>'
					);
				}
			},error : function() {
				alert("error");
			}
	};
	$.ajax(setting);
	
}

//커뮤니댓글 검색할때
function ccosearch(){
	var option =document.ccosearchtool.option.value;
	var keyword = document.ccosearchtool.keyword.value;
	
	var data = {
			'nick' : option,
			'contents' : keyword
		};
	var setting = {
			url : '/ccosearch.do',
			type : 'get',
			data : data,
			dataType : 'json',
			success :  function(data){
				var ccosearch = data.ccosearch;
				$("#ccommentlist").html('');
				for( i = 0; i<ccosearch.length;i++){
					$("#ccommentlist").append(
					'<tr id='+ccosearch[i].idx+'><td>'+ccosearch[i].contents+'</td><td>'
					+ccosearch[i].nick+'</td><td>'
					+'<button type="button"	class="btn-primary btn-md" onclick="javascript:ccoview('+ccosearch[i].linkedidx+');">글보기</button></td><td>'
					+'<button type="button"	class="btn-danger btn-md" onclick="deleteCcomment('+ccosearch[i].idx+');">삭제</button></td><td>'
					+'<button type="button" class="btn-primary btn-md" onclick="javascript:ccoreportReason('+ccosearch[i].idx+');"> 신고사유 </button></td></tr>'
					);
				}
			},error : function() {
				alert("error");
			}
	};
	$.ajax(setting);
	
}