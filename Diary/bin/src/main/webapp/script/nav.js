function toggle(){
	$('.navi').toggle(function(){
		if($('.contents').css("width")=="950px"){
			$('.contents').animate({
				"width":"730px",
				"margin-left":"250px"
			},100);
			$('.oneDiaryDiv').css("width","48%");
			$('.oneDiaryContents').css("width","730px");
		}else{
			$('.contents').animate({
				"width":"950px",
				"margin-left":"30px"
			},100);
			$('.oneDiaryDiv').css("width","60%");
			$('.oneDiaryContents').css("width","950px");
		}
	});
}
function goWrite(session){
	if(session==''){
		alert('로그인하세요.');
	}else{
		location.href='/diarywrite.do';
	}
}