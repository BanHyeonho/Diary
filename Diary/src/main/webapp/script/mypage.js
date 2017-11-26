function confirmm() {
	if (document.sform.name.value == "") {
		alert("이름을 입력하세요");
		document.sform.name.focus();
		return false;
	} else if (document.sform.password.value == "") {
		alert("비밀번호를 입력하세요");
		document.sform.password.focus();
		return false;
	} else if (document.sform.pwdchk.value == "") {
		alert("비밀번호를 확인하세요");
		document.sform.pwdchk.focus();
		return false;
	} else if (document.sform.password.value != document
			.getElementById("pwdchk").value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.sform.password.value = "";
		document.sform.pwdchk.value = "";
		document.sform.password.focus();
		return false;
	} else if (document.sform.birth.value == "") {
		alert("생일을 입력하세요");
		document.sform.birth.focus();
		return false;
	} else if (document.sform.email.value == "") {
		alert("이메일을 입력하세요");
		document.sform.email.focus();
		return false;
	} else if (document.sform.answer.value == "") {
		alert("질문에 답을 써주세요!");
		document.sform.answer.focus();
		return false;
	} else {
		
		document.sform.phone.value = "010-" + document.sform.phone2.value + "-"
				+ document.sform.phone3.value;

		alert('변경되었습니다');
		return true;
	}

}
// 탈퇴 확인
function deletee(id) {

	if (confirm("정말 탈퇴하시겠습니까?") == true) {
		alert('탈퇴 되었습니다.');
		location.replace('/deleteInfoAction.do?id=' + id);
	}

}

function privacyy(){
	
	$('.color a').css('color','#626261');
	$('#privacyy a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#privacyy a').css('background','#f2f2f2');
	
	
	
	$('#privacy').attr('class','privacy tab-pane fade in active show');
	$('#privacy').siblings().attr('class','tab-pane fade');
}
// 내가 쓴글 확인
function mywrite(id) {
	$('.color a').css('color','#626261');
	$('#mywrite a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#mywrite a').css('background','#f2f2f2');
	
	$('#my_write').attr('class','privacy tab-pane fade in active show');
	$('#my_write').siblings().attr('class','tab-pane fade');
	var id = id;
	
	
	var data = {
		'id' : id
	};
	var setting = {
		url : '/myDiary.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var mydiary = data.mydiary;
			// console.log(mydiary[0]);
			$("#my_diary").empty();
			
			if ($('#my_diary')[0].children[0] == null) {
				for (var i = 0; i < mydiary.length; i++) {
					// console.log(mydiary[i].dtitle);
					// console.log(mydiary[i].ddate);
					// console.log(mydiary[i].dhitcount);
					// console.log(mydiary[i].good);
					//console.log($('#my_diary'));

					$('#my_diary').append(
							'<tr><td><a href="/oneDiary.do?linkedidx='
									+ mydiary[i].idx + '&id='+id+'">' + mydiary[i].dtitle
									+ '</a></td><td>' + mydiary[i].ddate
									+ '</td><td>' + mydiary[i].dhitcount
									+ '</td><td>' + mydiary[i].good
									+ '</td></tr>');

				}
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
}

//내가쓴 만남의장 글보기
function myCommunity(id){
	
	
	
	$('#myCommunity').attr('class','privacy tab-pane fade in active show');
	$('#myCommunity').siblings().attr('class','tab-pane fade');
	
	var id = id;
	var data = {
		'id' : id
	};
	var setting = {
		url : '/myCommunity.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var mycommu = data.mycommu;
			// console.log(mydiary[0]);
			if ($('#my_commu')[0].children[0] == null) {
				for (var i = 0; i < mycommu.length; i++) {
					// console.log(mydiary[i].dtitle);
					// console.log(mydiary[i].ddate);
					// console.log(mydiary[i].dhitcount);
					// console.log(mydiary[i].good);
					

					$('#my_commu').append(
							'<tr><td><a href="/oneDiary.do?idx='
									+ mycommu[i].idx + '">' + mycommu[i].ctitle
									+ '</a></td><td>' + mycommu[i].cdate
									+ '</td><td>' + mycommu[i].chitcount
									
									+ '</td></tr>');

				}
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
}
function write_write(){ //내가쓴글 탭 색깔 변경
	
	$('#my_write').attr('class','privacy tab-pane fade in active show');
	$('#my_write').siblings().attr('class','tab-pane fade');
}
//쪽지함 가기
function msg_1(id){
	$('.color a').css('color','#626261');
	$('#msg_1 a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#msg_1 a').css('background','#f2f2f2');
	$('#msg').attr('class','privacy tab-pane fade in active show');
	$('#msg').siblings().attr('class','tab-pane fade');
	
	setInterval(function(){$('#msg_chk').css('background-color','#1f9bcf');});
	
	var id = id;
	var data = {
		'id' : id
	};
	$("#msg_ham").empty();
	var setting = {
		url : '/msg.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var mymsg = data.msg;
			var myblock = data.block;
			// console.log(mydiary[0]);
			//console.log(myblock[0].blockNick);
			//alert(myblock[0]);
			var arr = [];
			if ($('#msg_ham')[0].children[0] == null) {
				for (var i = 0; i < mymsg.length; i++) {
					// console.log(mydiary[i].dtitle);
					// console.log(mydiary[i].ddate);
					// console.log(mydiary[i].dhitcount);
					// console.log(mydiary[i].go od);
					
					
					$('#msg_ham').append(
							'<tr id='+mymsg[i].idx+'><td><a href="/oneDiary.do?idx='
							+ mymsg[i].idx + '">'
									  + mymsg[i].sender
									+ '</a>&nbsp;&nbsp;<button type="button" class="block_button btn btn-primary btn-sm" onclick="block(\''+mymsg[i].sender+'\',\''+mymsg[i].receiverid+'\');">차단 </button></td><td>' + mymsg[i].content +'</td>'
									+'<td><button type="button" class="btn btn-success btn-sm"  onclick="mag_form(\''+mymsg[i].sender+'\',\''+mymsg[i].senderid+'\',\''+mymsg[i].receiver+'\',\''+mymsg[i].receiverid+'\');">답장</button></td>'
									+'<td><button type="button" class="btn btn-danger btn-sm" onclick="msg_delete('+mymsg[i].idx+');">삭제</button></td>'
									+ '</tr>');

				}
				
				for (var i = 0; i < myblock.length; i++){
					
					for (var j = 0; j < mymsg.length; j++){
						if(myblock[i].blockNick == $('#msg_ham')[0].children[j].children[0].children[0].text){
							arr.push($('#msg_ham')[0].children[j].id);
							
						}
					}
						
				}
				for (var i = 0; i < arr.length; i++) {
					$('#'+arr[i]).remove();
				}
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
	
	
}

// 메세지 삭제
function msg_delete(d){
	
	if (confirm("정말 삭제하시겠습니까?") == true) {
	var idx = {'idx':d};
	
	var setting = {
			url : '/deleteMsg.do',
			type : 'get',
			data : idx,
			dataType : 'json',
			success : function(data){
				alert(data.result);
				$('#'+d).remove();
			},
			error : function() {
				alert('해당 메세지 삭제에 실패하였습니다');
			}
	};
	$.ajax(setting);
	}
	
}
//메세지 보내기 새창 ,답장
function mag_form(sender,senderid,receiver,receiverid){
	
	$("#receiverr").html(sender);
	
    $("#receiver").val(sender);
    $("#receiverid").val(senderid);
    $("#sender").val(receiver);
    $("#senderid").val(receiverid);

	 $("#myModal").modal('show');
	
	/*var form = document.createElement("form");      // form 엘리멘트 생성
	 form.setAttribute("method","post");             // method 속성 설정
	 form.setAttribute("action","/sendMsgForm.do");       // action 속성 설정
	 form.setAttribute("target","popup_window");	//window 새창 오픈 할떄 이름 타겟
	 document.body.appendChild(form);       
	
	var senderNick = document.createElement("input");
	senderNick.setAttribute("type","hidden");
	senderNick.setAttribute("name","sender");
	senderNick.setAttribute("value",sender);
	form.appendChild(senderNick);
	var senderId = document.createElement("input");
	senderId.setAttribute("type","hidden");
	senderId.setAttribute("name","senderid");
	senderId.setAttribute("value",senderid);
	form.appendChild(senderId);
	var receiverNick = document.createElement("input");
	receiverNick.setAttribute("type","hidden");
	receiverNick.setAttribute("name","receiver");
	receiverNick.setAttribute("value",receiver);
	form.appendChild(receiverNick);
	var receiverId = document.createElement("input");
	receiverId.setAttribute("type","hidden");
	receiverId.setAttribute("name","receiverid");
	receiverId.setAttribute("value",receiverid);
	form.appendChild(receiverId);
	console.log(form);
	
	
	var Settings = 'width=400,height=350,top=100,left=100,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no,location=no';
	
	window.open("","popup_window",Settings);
	form.submit();*/


	
	
}

//회원 차단하기
function block(blockNick,id){
	
	if (confirm(blockNick+"을(를) 정말 차단 하시겠습니까?") == true) {
		
		var datas ={
				'blockNick' : blockNick,
				'id':id
		};
		
		var setting ={
			url : '/blockMember.do',
			type : 'get',
			data : datas,
			dataType : 'json',
			success:function(data) {
				alert(data.result);
				
				var arr = [];
				for (var i = 0; i < $('#msg_ham')[0].children.length; i++) {
					
					if($('#msg_ham')[0].children[i].children[0].children[0].text==blockNick){
						arr.push($('#msg_ham')[0].children[i].id);
						
						
					}
				}
				
				for (var i = 0; i < arr.length; i++) {
					$('#'+arr[i]).remove();
					
				}
			},
			error : function(){
				alert('에러 발생');
				
			}
			
			
		};
		$.ajax(setting);
		
	}
}

//회원 차단 목록
function block_list(id){
	$('.color a').css('color','#626261');
	$('#block_listt a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#block_listt a').css('background','#f2f2f2');
	$('#block_list').attr('class','privacy tab-pane fade in active show');
	$('#block_list').siblings().attr('class','tab-pane fade');
	
	
	$("#my_black").empty();
	var data = {
			'id' : id
		};
	var setting = {
			url : '/blockList.do',
			type : 'post',
			data : data,
			dataType : 'json',
			success : function(data) {
				var myblock = data.blocknick;
				
				if ($('#my_black')[0].children[0] == null) {
					for (var i = 0; i < myblock.length; i++) {
				
						if(i+3 <= myblock.length){
							$('#my_black').append(
									'<tr><td id='+myblock[i].idx+'>'
											 + myblock[i].blockNick+ ''
											+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i].idx+');">차단 해제</button></td>' 
											
											+'<td id='+myblock[i+1].idx+'>'
											 + myblock[i+1].blockNick+ ''
											+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i+1].idx+');">차단 해제</button></td>'
											
											+'<td id='+myblock[i+2].idx+'>'
											 + myblock[i+2].blockNick+ ''
											+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i+2].idx+');">차단 해제</button></td>'
											
											+ '</tr>');
							
						}else if(i+2 <=myblock.length ){
							
							$('#my_black').append(
									'<tr><td id='+myblock[i].idx+'>'
											 + myblock[i].blockNick+ ''
											+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i].idx+');">차단 해제</button></td>' 
											
											+'<td id='+myblock[i+1].idx+'>'
											 + myblock[i+1].blockNick+ ''
											+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i+1].idx+');">차단 해제</button></td>' 
											
											+ '</tr>');
							
						}else{
							
						
						
						$('#my_black').append(
								'<tr><td id='+myblock[i].idx+'>'
										 + myblock[i].blockNick+ ''
										+ '<button type="button" class="block_button btn btn-primary btn-sm" onclick="unBlock('+myblock[i].idx+');">차단 해제</button>' 
										
										+ '</td></tr>');
						}
						i+=2;

					}
				}
				
			},
			error : function() {
				alert('error');
			}

		};
		$.ajax(setting);
}
//차단 회원 해제
function unBlock(ub){
	
	if (confirm("정말 해제하시겠습니까?") == true) {
		var idx = {'idx':ub};
		
		var setting = {
				url : '/unBlock.do',
				type : 'get',
				data : idx,
				dataType : 'json',
				success : function(data){
					alert(data.result);
					$('#'+ub).remove();
					
				},
				error : function() {
					alert('차단해제를 실패하였습니다');
				}
		};
		$.ajax(setting);
		}
}
// 내가 스크랩한 회원 리스트
function scrap_list(id){

	$('.color a').css('color','#626261');
	$('#scrap_list a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#scrap_list a').css('background','#f2f2f2');
	
	$('#scrap').attr('class','privacy tab-pane fade in active show');
	$('#scrap').siblings().attr('class','tab-pane fade');
	
	var id = id;
	var data = {
		'id' : id
	};
	var setting = {
		url : '/myScrap.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var myScrap = data.myScrap;
		

			if ($('#scrap_body')[0].children[0] == null) {
				
				
		
				for (var i = 0; i < myScrap.length; i++) {
						$('#scrap_body').append(
								'<tr><td><a href="/oneDiary.do?linkedidx='
								+ myScrap[i].idx + '&id='+id+'">' + myScrap[i].dtitle
								+ '</a></td><td>' + myScrap[i].ddate
								+ '</td><td>' + myScrap[i].dhitcount
								+ '</td><td>' + myScrap[i].good
								+ '</td></tr>');
						
				}
		
			
		
			
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
}
// 팔로워 리스트 보기
function followers(id){
	var id = id;
	$('.color a').css('color','#626261');
	$('#followerss a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#followerss a').css('background','#f2f2f2');
	
	$('#followers').attr('class','privacy tab-pane fade in active show');
	$('#followers').siblings().attr('class','tab-pane fade');
	var data = {
		'id' : id
	};
	var setting = {
		url : '/followers.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var followers_go = data.followers_go;
			
			$("#followers_list").empty();
			
			var cnt = 0 ;  //팔로우 수 체크
			if ($('#followers_list')[0].children[0] == null) {
				for ( var i = 0 ; i < followers_go.length; i++) {
				
				
					if(i+3 <= followers_go.length){
					$('#followers_list').append(
							'<tr><td>' + followers_go[i].followers+ '</td>'
						
							+'<td>' + followers_go[i+1].followers+ '</td>'
							
							+'<td>' + followers_go[i+2].followers+ '</td>'
							
							+'</tr>')
					cnt+=3;
					}else if(i+2 <= followers_go.length){
						
					$('#followers_list').append(
							'<tr><td>' + followers_go[i].followers+ '</td>'
						
							+'<td>' + followers_go[i+1].followers+ '</td>'
							+'</tr>')
					cnt+=2;
					}else{
					$('#followers_list').append(
								'<tr><td>' + followers_go[i].followers+ '</td></tr>')
					cnt+=1;
					}
					
					
					i+=2;
				}
				$("#follow_cnt").empty();
				$('#follow_cnt').append('(' +cnt+'명)')
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
}
// 내가 팔로잉한 회원 리스트
function following(id){
	var id = id;
	$('.color a').css('color','#626261');
	$('#followingg a').css('color','#d9534f');
	$('.color a').css('background','#ffffff');
	$('#followingg a').css('background','#f2f2f2');
	
	$('#follwoing').attr('class','privacy tab-pane fade in active show');
	$('#follwoing').siblings().attr('class','tab-pane fade');
	var data = {
		'id' : id
	};
	var setting = {
		url : '/following.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var following_go = data.following_go;
			//consolo.log(following_go);
			$("#following_list").empty();
			var cnt = 0 ;  //팔로잉한 사람수 체크
			if ($('#following_list')[0].children[0] == null) {
				for (var i = 0; i < following_go.length; i++) {
					
				if(i+3 <= following_go.length){
					$('#following_list').append(
							'<tr >	<td id="'+following_go[i].idx+'">'
									 + following_go[i].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i].idx+')>팔로우 취소</button></td>'
									 
									 
									 +'<td id="'+following_go[i+1].idx+'">'
									 + following_go[i+1].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i+1].idx+')>팔로우 취소</button></td>'
									 
									 +'<td id="'+following_go[i+2].idx+'">'
									 + following_go[i+2].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i+2].idx+')>팔로우 취소</button></td>'
									+ '</tr>');
					cnt+=3;
				}else if(i+2 <= following_go.length){
					$('#following_list').append(
							'<tr >	<td id="'+following_go[i].idx+'">'
									 + following_go[i].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i].idx+')>팔로우 취소</button></td>'
									 
									 
									 +'<td id="'+following_go[i+1].idx+'">'
									 + following_go[i+1].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i+1].idx+')>팔로우 취소</button></td>'
									+ '</tr>');	
					cnt+=2;
				}else{
					$('#following_list').append(
							'<tr ><td id="'+following_go[i].idx+'">'
									 + following_go[i].following +
									 '<button class="follow_delete-btn btn btn-danger btn-sm" onclick=follow_delete('+following_go[i].idx+')>팔로우 취소</button>'
									+ '</td></tr>');
					cnt+=1;
				}
					i+=2;
				}
				$("#folloing_cnt").empty();
				$('#folloing_cnt').append('(' +cnt+'명)')
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
}
function follow_delete(fb){
	
	if (confirm("정말 해제하시겠습니까?") == true) {
		var idx = {'idx':fb};
		
		var setting = {
				url : '/deleteFollow.do',
				type : 'get',
				data : idx,
				dataType : 'json',
				success : function(data){
					alert(data.followdelte);
					$('#'+fb).remove();
					
				},
				error : function() {
					alert('차단해제를 실패하였습니다');
				}
		};
		$.ajax(setting);
		}
}


