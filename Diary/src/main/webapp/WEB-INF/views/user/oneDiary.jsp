<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/oneDiary.js"></script>	
</head>
<body>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents">
		<div id="map" style="width:300px;height:300px;float: left;">
		</div>
		<div style="width:300px;float: right; border: 1px solid black;">
		<ul style="list-style: none;float: left; margin-left: -110px;">
			<li><a class="click" href="#" id="oneDiary1">oneDiary1</a></li>
			<li><a class="click" href="#" id="oneDiary2">oneDiary2</a></li>
			<li><a class="click" href="#" id="oneDiary3">oneDiary3</a></li>
		</ul>
		<div class="oneDiary1 oneDiary" style="width:300px;height:300px;border: 1px solid black;float: right;">
			a입니다
		</div>
		<div class="oneDiary2 oneDiary" style="width:300px;height:300px;border: 1px solid black;float: right; display: none;">
			b입니다
		</div>
		<div class="oneDiary3 oneDiary" style="width:300px;height:300px;border: 1px solid black;float: right; display: none;">
			c입니다
		</div>
		</div>
		
		<hr>
		
		<div class="comment">
		
		</div><!-- comment -->
		</div><!-- contents -->
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
</body>
</html>