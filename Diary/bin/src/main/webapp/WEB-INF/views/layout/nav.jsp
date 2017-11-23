<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="script/nav.js"></script>
<button type="button"class="tab btn-info btn-sm"onclick="toggle();">탭</button>
<div class="navi btn-group-vertical" data-toggle="buttons">
	<div>
		<button type="button" class="up  btn-outline-primary btn-lg" onclick="location.href='#head'" >맨위로</button>
		<button type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='/diary.do'">여행일지</button>
		<button type="button" class="btn btn-outline-warning btn-lg" onclick="goWrite('${user.id}');">여행일지 쓰기</button>
		<button type="button" class="btn btn-outline-success btn-lg" onclick="location.href='/community.do'">만남의 장</button>
		<button type="button" class="btn btn-outline-info btn-lg" onclick="wow_following('${user.id}')">팔로잉</button>
		<div id="aa" style=" display: none; border:3px solid #1cbaf1; border-width: 0 2px;border-radius: 5px; " ></div>
		<button type="button" class="down btn-outline-info btn-lg"  onclick="location.href='#foot'" ><a>맨아래로</a></button>
	</div>
</div>