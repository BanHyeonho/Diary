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
						$('#aa').append('<a href="/search.do?option=작성자&keyword='+ following_go[i].following +'">'+ following_go[i].following +'</a><br/>');

					}
				}
				
			},
			error : function() {
				alert('error');
			}

		};
		$.ajax(setting);
}