<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
/* 좌측 네비게이션 */
.nav {position: fixed ;top:230px;}
.nav .up {width: 200px;height:30px;}
.nav .btn {width:200px;height:70px;} 
/*네비메인버튼  */
.nav .down {width:200px;}
.nav > div {width:200px;}
</style>

<div class="nav btn-group-vertical" data-toggle="buttons">
	<div>
		<button type="button" class="up  btn-outline-primary" onclick="location.href='#head'" >맨위로</button>
		<button type="button" class="btn btn-outline-primary ">여행일지</button>
		<button type="button" class="btn btn-outline-warning">여행일지 쓰기</button>
		<button type="button" class="btn btn-outline-success " onclick="location.href='/community.do'">만남의 장</button>
		<button type="button" class="btn btn-outline-info ">팔로잉</button>
		<button type="button" class="down"  onclick="location.href='#foot'" ><a>맨아래로</a></button>
	</div>
</div>