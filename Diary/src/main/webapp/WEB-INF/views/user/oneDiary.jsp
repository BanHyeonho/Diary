<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="www.dto.DiaryVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<%
	Map<String,Object> map =(Map)request.getAttribute("data");
		DiaryVo vo = (DiaryVo)map.get("Diary");
		String[] place = vo.getPlace().split("/");
		String[] content = vo.getContents().split("/");
%>
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
		<li id="<%=place[0]%>"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;background:lightgray;" ><%=place[0]%></a></li>
		<c:forTokens items="${data.Diary.place}" delims="/" var="place" begin="1">
			<li id="${place}"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;" >${place}</a></li>
		</c:forTokens>
		</ul>
		<%int i=0; %>
		<div class="<%=place[0]%> oneDiary"><img alt="사진"><textarea rows="25" cols="100" class="form-control textArea" disabled="disabled" ><%=content[i++] %></textarea></div>
		 <c:forTokens items="${data.Diary.place}" delims="/" var="place" begin="1">
			<div class="${place} oneDiary" style="display: none;"><img alt="사진"><textarea rows="25" cols="100" class="form-control textArea" disabled="disabled"  ><%=content[i++] %></textarea></div>
		</c:forTokens> 
		</div>
		
		
		<hr>
		<div><!--댓글  -->
		
		</div>
		
		</div><!-- contents -->
			
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
	
	<script type="text/javascript" src="script/oneDiary.js"></script>	
	<script type="text/javascript">
	createMap('${data.Diary.mapposition}');
	</script>
</body>
</html>