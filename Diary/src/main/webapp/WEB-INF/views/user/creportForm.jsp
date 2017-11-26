<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/onecommunity.js"></script>
</head>
<body>


<center>
	<h1><c:if test="${report.title=='댓글신고폼' }">댓글 </c:if>신고</h1>
	<table>
		<c:if test="${report.title!='댓글신고폼' }">
		<tr>
			<td>신고 글제목</td>
			<td>${report.title }</td>
		</tr>		
		</c:if>
		<tr>
			<td>신고자</td>
			<td>${report.reporter }</td>
		</tr>
		<tr>
			<td>신고 타입</td>
			<td><select id="type">
		<option>욕설</option>
		<option>음란물</option>
		<option>기타</option>
	</select></td>
		</tr>
	</table>
	
	<h2>사유</h2>
	<textarea rows="20" cols="50" id="reason"></textarea><br/>
	<button type="button" 
	<c:choose>
	<c:when test="${report.title!='댓글신고폼' }">
	onclick="creportinsert('${report.title }','${report.reporter }','${report.witerid }','${report.linkedidx }');"
	</c:when>
	<c:otherwise>
	onclick="commentReport('${report.reporter }','${report.witerid }','${report.linkedidx }');"
	</c:otherwise>
	</c:choose>
	>신고하기</button>
</center>



</body>
</html>