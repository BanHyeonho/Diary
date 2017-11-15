<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">

#map{width:300px;height:300px;display: inline-block;}
.oneDiaryDiv{width:48%;float: right; border: 1px solid black;}
.oneDiaryDiv ul{list-style: none;float: left; margin-left: -110px;}
.oneDiary{width:100%;height:600px;border: 1px solid black;float: right;}
.oneDiaryContents{width: 730px;}
</style>
</head>
<body>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents">
		<div class="btn-group" role="group" aria-label="Basic example">
		<input type="text" class="form-control" placeholder="글 제목"/><button class="btn-info btn-sm">스크랩 가져오기</button>
		</div>
		<div class="oneDiaryContents"><!-- 한줄내리기 위한 div  -->
		<div class="btn-group" role="group" aria-label="Basic example">
		<input type="text" id="search" class="form-control"/><input type="button" onclick="searchAction();" id="seachBtn" value="검색" class="btn-primary btn-sm" />
		</div>
		<br/> 
	 	<div id="map">
		</div>
		
		<div class="oneDiaryDiv">
		<ul id="oneDiaryTab">
			<!-- <li id="diaryList"><a class="click" href="#" id="oneDiary1">oneDiary1</a></li>
			<li id="plusDiary"><a href="javascript:plusDiary();">+</a></li> -->
		</ul>
		
		<div  class="oneDiary1 oneDiary">
			<input type='file' /><br/>
			<textarea rows="30" cols="50" class="form-control" ></textarea>
		</div>
		
		
		</div><!--oneDiaryDiv  -->
		
		</div><!-- 한줄내리기 위한 div  -->
		
		
		</div><!-- contents -->
			
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript" src="script/diarywrite.js"></script>	
</body>
</html>