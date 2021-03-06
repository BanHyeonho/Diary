<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		String[] picture = vo.getDpicture().split("/");
%>

<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents" style="position: relative; overflow-x:hidden; height: auto;">

		<h2 style="display: inline;">${data.Diary.dtitle }</h2>
		<c:if test="${user.nick!=data.Diary.nick && user!=null }">
		<button class="btn-info btn-sm" id="scrap" onclick="scrap('${data.Diary.idx }','${user.id }');">
		<c:choose>
		<c:when test="${data.Scrap==null }">
		스크랩하기
		</c:when>
		<c:otherwise>
		스크랩취소
		</c:otherwise>
		</c:choose>
		</button>
		</c:if>
		
		
		<span>${data.Diary.sdate } ~ ${data.Diary.edate } 조회수 : ${data.Diary.dhitcount }</span>
		
		<c:choose>
		<c:when test="${user!=null }">
		<button type="button" id="good" onclick="
		<c:if test="${data.Good==null }">
		good('${user.id}','${data.Diary.idx }','${data.Diary.good }');
		</c:if>
		<c:if test="${data.Good!=null }">
		alert('이미 추천하셨습니다.');
		</c:if>
		">추천수 : ${data.Diary.good }</button>
		</c:when>
		<c:otherwise>
		추천수 : ${data.Diary.good }
		</c:otherwise>
		</c:choose>
		<c:if test="${user.nick== data.Diary.nick}">
		<a href="javascript:updateForm('${ data.Diary.idx }','${data.Diary.dtitle }','${data.Diary.place }','${data.Diary.contents }','${data.Diary.mapposition }','${data.Diary.dpicture }','${data.Diary.sdate }','${data.Diary.edate }','${data.Diary.dpublic }');">글수정</a>&nbsp;<a href="javascript:deleteDiary('${data.Diary.idx }');">글삭제</a>
		</c:if>
		<c:if test="${user.nick!=data.Diary.nick && user!=null }">
		<button type="button" onclick="openForm('${data.Diary.id }','${user.nick }','${data.Diary.dtitle }','${data.Diary.idx}');">신고</button>
		</c:if>
		<button type="button" class="btn-outline-warning" style="float: right;" onclick="change();">★</button>
		<span style="float: right;" onclick="add();">글쓴이 : ${data.Diary.nick }</span>
		<c:if test="${user.nick!=data.Diary.nick && user!=null }">
		<ul id="add" style="position: absolute;right:0px; z-index: 10;display: none;">
			<li><a id="follow" href="javascript:follow('${data.Diary.id }','${data.Diary.nick }','${ user.id}','${user.nick }');">
			<c:choose>
			<c:when test="${data.Follow==null }">
			팔로우하기
			</c:when>
			<c:otherwise>
			팔로우 취소하기
			</c:otherwise>
			</c:choose>
			</a></li>
			<li><a href="javascript:mag_form('${ data.Diary.nick }','${ data.Diary.id }','${user.nick }','${user.id }');">쪽지보내기</a></li>
		</ul>
		<%@ include file="./msgSend.jsp"%>
		</c:if>
    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>

 
		
		<div class="writingPlace" style="position: absolute;left: 100%;top:50px;float: right;">
		<ul id="oneDiaryTab" class="nav nav-tabs" style="position: absolute;display: table-row;right: 100%;">
		<li id="<%=place[0]%>"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;background:lightgray;" ><%=place[0]%></a></li>
		<c:forTokens items="${data.Diary.place}" delims="/" var="place" begin="1">
			<li id="${place}"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;" >${place}</a></li>
		</c:forTokens>
		</ul>
		<%int i=0; %>
		<%int k=0; %>
		<div class="<%=place[0]%> oneDiary">
		<table>
		<%for(int j = 0;j<content[k].split("&").length;j++){%>
		<tr>
		<td><img src="/upload/<%=picture[i++] %>" alt="사진" style="width: 300px;height:300px;"></td>
		<td><textarea rows="10" cols="60" class="form-control textArea" disabled="disabled" ><%=content[k].split("&")[j] %></textarea></td>
		</tr>
		<%} %>
		</table>
		</div>
		 <%k++; %>
		 <c:forTokens items="${data.Diary.place}" delims="/" var="place" begin="1">
			<div class="${place} oneDiary" style="display: none;">
			<table>
			<%for(int j = 0;j<content[k].split("&").length;j++){ %>
			<tr>
				<td><img src="/upload/<%=picture[i++] %>" alt="사진" style="width: 300px;height:300px;" ></td>
				<td><textarea rows="10" cols="60" class="form-control textArea" disabled="disabled"  ><%=content[k].split("&")[j] %></textarea></td>
			</tr>
			<%}
			k++; %>
			</table>
			</div>
		</c:forTokens> 
		</div>
		
		
		
		
		</div><!-- contents -->
			<div><!--댓글  -->
		<hr>
		<c:if test="${user!=null }">
		<span style="color: black; font-weight: bold;">${user.nick }</span> : <input type="text" id="comment" size="140"/><button type="button" onclick="comment('${user.nick }','${data.Diary.idx}');">댓글쓰기</button>
		<hr>
		</c:if>
		<div id="commentArea">
		<c:forEach items="${data.comment }" var="data">
		<div id='${data.idx}'>
		<span style="color: black;font-weight: bold;">${data.nick }</span>&nbsp;<c:if test="${data.nick==user.nick }"><a href="javascript:deletecomment('${data.idx}');" style="color: tomato; text-decoration: none;">삭제</a></c:if>
		<br/>		
		<span style="color: black;">${data.contents }</span><br/>
		<span style="color: gray;"><fmt:formatDate value="${data.cdate }" pattern="yyyy-MM-dd HH:MM"/></span><c:if test="${user.nick!=null && data.nick!=user.nick }">&nbsp;<a href="javascript:openReport('${data.nick }','${user.nick }','${data.idx}');" style="color: tomato; text-decoration: none;">신고</a></c:if>
		<hr>		
		</div>
		</c:forEach>		
		</div>
			
		</div>
	</div>
			<%@ include file="../layout/footer.jsp"%>
	</div>
	<script type="text/javascript" src="script/mypage.js"></script>
	<script type="text/javascript" src="script/oneDiary.js"></script>	
	<script type="text/javascript">
	createMap('${data.Diary.mapposition}','${data.Diary.place}');
	</script>
</body>
</html>