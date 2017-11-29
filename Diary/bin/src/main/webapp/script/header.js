function login(){
	if(document.loginform.id.value==''){
		alert('아이디를 입력하세요');
		document.loginform.id.focus();
		return false;
	}else if(document.loginform.password.value==''){
		alert('비밀번호를 입력하세요');
		document.loginform.password.focus();
		return false;
	}
	return true;
}
function msg_hham(id){
	//console.log(' 얍얍얍');
	var id = id;
	var data = {
		'id' : id
	};
	
	var setting = {
		url : '/msg_chk.do',
		type : 'get',
		data : data,
		dataType : 'json',
		success: function(data) {
			console.log(data);
	         if(data.chk.length >= 1) {
	              // Do somothing when data is not null
	        	// alert(data.chk);
//	        	 alert(data.chk[7].chk);
	        	// console.log($('#msg_chk').css('background-color'));
	        	 setInterval(function(){
	        		 if($('#msg_chk').css('background-color')=="rgb(255, 0, 0)"){
	        			 $('#msg_chk').css('background-color','#1f9bcf');
	        		 }else{
	        			 $('#msg_chk').css('background-color','red');
	        		 }
	        		 
	        	 },1000);
	         }else{
	        	 $('#msg_chk').css('background-color','#1f9bcf');
	         }
	    },
		error : function() {
			
		}
	};
	$.ajax(setting);
}

function msg_move(){
	
	location.href=('/mypage.do?msg=msg');
	
}
function toggle(){
	$('.navi').slideToggle(300)(function(){
		
	});
}
function goWrite(session){
	if(session==''){
		alert('로그인하세요.');
		document.loginform.id.focus();
	}else{
		location.href='/diarywrite.do';
	}
}

function wow_following(id){
		$("#aa").toggle();
		
		var id = id;
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
				$("#aa").empty();
				if ($('#aa')[0].children[0] == null) {
					for (var i = 0; i < following_go.length; i++) {
						//alert(following_go[i].following);
						$('#aa').append('<a href="#" onclick=following_write("'+following_go[i].following+'");>'+ following_go[i].following +'</a><br/>');
						
					}
				}
				
			},
			error : function() {
				alert('error');
			}

		};
		$.ajax(setting);
}

function following_write(b){
	location.href="/search.do?option=작성자&keyword="+b;
}

/*function main_background(){
	 setInterval(function(){},3000);
	$(".main-visual").css({"background":"url(http://cfile8.uf.tistory.com/image/21244A3B56CACE2E05AE99)", 'background-repeat' : 'no-repeat'})
	$(".main-visual").css({"background":"url(http://img.postshare.co.kr/images/2015/08/21114523/GettyImagesBank_471296532_M.jpg)", 'background-repeat' : 'no-repeat'})
}*/

$(document).ready(function() {
	
	var current=0;
	var slide_length = $('.slide_ul>li').length;//이미지의 갯수를 변수로
	var btn_ul = '<ul class="slide_btn"></ul>';//버튼 LIST 작성할 UL
	


	$('.slide_ul>li').hide();//이미지 안보이게
	$('.slide_ul>li').first().show();//이미지 하나만 보이게
	
	
	$(btn_ul).prependTo($('.slide'))//slide 클래스위에 생성
	for (var i = 0 ; i < slide_length; i++){//동그라미 버튼 생성 이미지 li 개수 만큼
		var child = '<li><a href="#none">'+i+'</a></li>';
		$(child).appendTo($('.slide_btn'));
	}
	
	$('.slide_btn > li > a').first().addClass('active');	
	$('.slide_btn > li > a').on('click' , slide_stop);
	
//자동 슬라이드 함수
function autoplay(){
	
	if(current == slide_length-1){
	current = 0;
}else{
	current++;
}
	$('.slide_ul>li').stop().fadeOut(1000);
	$('.slide_ul>li').eq(current).stop().fadeIn(1000);
	$('.slide_btn > li > a').removeClass('active');	
	$('.slide_btn > li > a').eq(current).addClass('active');	
}
setInterval(autoplay,7000);//반복

//버튼 클릭시 호출되는 함수
function slide_stop(){
		var fade_idx = $(this).parent().index(); 
		current = $(this).parent().index();//클릭한 버튼의 Index 를 받아서 그 다음 이미지부터 슬라이드 재생.
		if($('.slide_ul > li:animated').length >= 1) return false; //버튼 반복 클릭시 딜레이 방지
		$('.slide_ul > li').fadeOut(400);
		$('.slide_ul > li').eq(fade_idx).fadeIn(400);
		$('.slide_btn > li > a').removeClass('active');	
		$(this).addClass('active');
		
	}	
});