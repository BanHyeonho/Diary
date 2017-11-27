<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="www.dto.DiaryVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<link href="css/simplex.css" rel="stylesheet" />
<link rel="stylesheet" href="css/layout.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body style="padding-top: 50px;">
<%
		DiaryVo vo =(DiaryVo)request.getAttribute("viewDiary");
		String[] place = vo.getPlace().split("/");
		String[] content = vo.getContents().split("/");
%>

		<div class="contents" style="position: relative;margin : auto; overflow-x:hidden; height: auto;">

		<h2 style="display: inline;">${viewDiary.dtitle }</h2>
		
		
		<span>${viewDiary.sdate } ~ ${viewDiary.edate } 조회수 : ${viewDiary.dhitcount }</span>추천수 : ${viewDiary.good }
		<button type="button" class="btn-outline-warning" style="float: right;" onclick="change();">★</button>
		<span style="float: right;" onclick="add();">글쓴이 : ${viewDiary.nick }</span>
		<ul id="add" style="position: absolute;right:0px; z-index: 10;display: none;">
			<li><a href="javascript:mag_form('${ viewDiary.nick }','${ viewDiary.id }','관리자','Admin');">쪽지보내기</a></li>
		</ul>
    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>

 
		
		<div class="writingPlace" style="position: absolute;left: 100%;top:50px;float: right;">
		<ul id="oneDiaryTab" class="nav nav-tabs" style="position: absolute;display: table-row;right: 100%;">
		<li id="<%=place[0]%>"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;background:lightgray;" ><%=place[0]%></a></li>
		<c:forTokens items="${viewDiary.place}" delims="/" var="place" begin="1">
			<li id="${place}"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;" >${place}</a></li>
		</c:forTokens>
		</ul>
		<%int i=0; %>
		<div class="<%=place[0]%> oneDiary"><img alt="사진"><textarea rows="25" cols="100" class="form-control textArea" disabled="disabled" ><%=content[i++] %></textarea></div>
		 <c:forTokens items="${viewDiary.place}" delims="/" var="place" begin="1">
			<div class="${place} oneDiary" style="display: none;"><img alt="사진"><textarea rows="25" cols="100" class="form-control textArea" disabled="disabled"  ><%=content[i++] %></textarea></div>
		</c:forTokens> 
		</div>
		
			</div><!-- contents -->

	<script type="text/javascript" src="script/mypage.js"></script>
	<script type="text/javascript" src="script/oneDiary.js"></script>	
	<script type="text/javascript">
	createMap('${viewDiary.mapposition}','${viewDiary.place}');
	</script>
</body>
</html>