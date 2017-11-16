<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents" style="position: relative; overflow:hidden; height: 700px;">
	
		<h2 style="display: inline;">${data.Diary.dtitle }</h2><button class="btn-info btn-sm">스크랩하기</button>
		
		
		<span>${data.Diary.sdate } ~ ${data.Diary.edate } 조회수 : ${data.Diary.dhitcount } 추천수 : ${data.Diary.good }</span>
		
		<button type="button" class="btn-outline-warning" style="float: right;" onclick="change();">★</button>
		<span style="float: right;">글쓴이 : ${data.Diary.nick }</span>
		
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

 
		
		<div class="writingPlace" style="position: absolute;left: 100%;top:50px;float: right;">
		<ul id="oneDiaryTab" class="nav nav-tabs" style="position: absolute;display: table-row;right: 100%;">
			
		</ul>
			
		</div>
		
		
		
		
		
		</div><!-- contents -->
			
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript" src="script/oneDiary.js"></script>	
</body>
</html>