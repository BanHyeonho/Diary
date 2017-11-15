<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
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
</script>
<button type="button"class="tab btn-info btn-sm"onclick="toggle();">탭</button>
<div class="navi btn-group-vertical" data-toggle="buttons">
<div>
		<button type="button" class="up  btn-outline-primary btn-lg" onclick="location.href='#head'" >맨위로</button>
		<button type="button" class="btn btn-outline-primary btn-lg">여행일지</button>
		<button type="button" class="btn btn-outline-warning btn-lg" onclick="location.href='/diarywrite.do'">여행일지 쓰기</button>
		<button type="button" class="btn btn-outline-success btn-lg" onclick="location.href='/community.do'">만남의 장</button>
		<button type="button" class="btn btn-outline-info btn-lg">팔로잉</button>
		<button type="button" class="down btn-outline-info btn-lg"  onclick="location.href='#foot'" ><a>맨아래로</a></button>
	</div>
</div>