<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="www.dto.ReportVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="script/reportReason.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="css/simplex.css" rel="stylesheet" />
<link rel="stylesheet" href="css/diary.css">
</head>

<body>

	<%
		List<ReportVo> list = (List)request.getAttribute("reportReason");	
		int idx =list.get(0).getLinkedidx();
	%>
	<div class="wrap">
	<div class="container">
	<div class="contents" >

	<h1>신고사유</h1>

		<table class="table table-striped table-hover table-bordered">
  		<thead class="thead-dark">
    	<tr>
      		<th>신고자</th>
      		<th>신고유형</th>
      		<th>기타</th>
    	</tr>
  		</thead>
  		<tbody>
  		
  		 <c:forEach var="d" items="${reportReason}"  > 
    		<tr>
      			<td>${d.reporter}</td>
      			<td>${d.type}</td>
      			<td>${d.reason}</td>
    		</tr>
    	 </c:forEach>
    	
 		</tbody>
 	</table>
 		
	<center class="ct">
			<button type="button" class="btn-primary btn-sm" onclick="guilt('<%=idx %>','${d }');"><span>유죄</span></button>
			<button type="button" class="btn-red btn-sm" onclick="acquit('<%=idx %>','${d }');"><span>무죄</span></button>	
	</center>
	</div>
	</div>
	</div>
</body>
</html>