<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="script/nav.js"></script>
<button type="button"class="tab btn-outline-primary btn-sm"onclick="toggle();">탭</button>
<div class="navi btn-group-vertical" data-toggle="buttons">
	<div>
		<button type="button" class="up btn-outline-danger btn-sm" onclick="location.href='#head'" >맨위로</button>
		
		
		<button type="button" class="btn btn-outline-info btn-sm" onclick="wow_following('${user.id}')">팔로잉</button>
		<div id="aa" style=" display: none; border:3px solid #1cbaf1; border-width: 2px 2px; " ></div>
		
	</div>
</div>