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

// 내가 쓴글 확인
function mywrite(id) {
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
			if ($('#my_diary')[0].children[0] == null) {
				for (var i = 0; i < mydiary.length; i++) {
					// console.log(mydiary[i].dtitle);
					// console.log(mydiary[i].ddate);
					// console.log(mydiary[i].dhitcount);
					// console.log(mydiary[i].good);
					console.log($('#my_diary'));

					$('#my_diary').append(
							'<tr><td><a href="/oneDiary.do?idx='
									+ mydiary[i].idx + '">' + mydiary[i].dtitle
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

function myCommunity(id){
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

function msg_1(id){
	var id = id;
	var data = {
		'id' : id
	};
	var setting = {
		url : '/msg.do',
		type : 'post',
		data : data,
		dataType : 'json',
		success : function(data) {
			var mymsg = data.msg;
			// console.log(mydiary[0]);
			if ($('#msg_ham')[0].children[0] == null) {
				for (var i = 0; i < mymsg.length; i++) {
					// console.log(mydiary[i].dtitle);
					// console.log(mydiary[i].ddate);
					// console.log(mydiary[i].dhitcount);
					// console.log(mydiary[i].go od);
					
					
					$('#msg_ham').append(
							'<tr id='+mymsg[i].idx+'><td><a href="/oneDiary.do?idx='
									+ mymsg[i].idx + '">' + mymsg[i].sender
									+ '</a>&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger">차단 </button></td><td>' + mymsg[i].content +'</td>'
									+'<td><button type="button" class="btn btn-outline-danger"  onclick="mag_form(\''+mymsg[i].sender+'\',\''+mymsg[i].senderid+'\',\''+mymsg[i].receiver+'\',\''+mymsg[i].receiverid+'\');">답장</button></td>'
									+'<td><button type="button" class="btn btn-outline-danger" onclick="msg_delete('+mymsg[i].idx+');">삭제</button></td>'
									+ '</tr>');

				}
			}
			
		},
		error : function() {
			alert('error');
		}

	};
	$.ajax(setting);
	
	
}
function msg_delete(d){
	
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
function mag_form(sender,senderid,receiver,receiverid){
	
	var form = document.createElement("form");      // form 엘리멘트 생성
	 form.setAttribute("method","post");             // method 속성 설정
	 form.setAttribute("action","/sendMsgForm.do");       // action 속성 설정
	 form.setAttribute("target","popup_window");
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
	
	
	var Settings = 'width=500,height=600,top=100,left=100';
	
	window.open("","popup_window",Settings);
	form.submit();


	
	
}