<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팔로워 목록</title>
<link href="css/simplex.css" rel="stylesheet" />
<script type="text/javascript" src="script/diarywrite.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	<h1>내 스크랩 목록</h1>
	<div>
		<table class="table table-striped table-hover table-bordered">
			<thead class="table-danger">
				<tr>
					<th>제목</th><th>닉네임</th>
				</tr>
			</thead>
			<tbody id="scarp_listwow">
		 	<c:forEach items="${scrap_listwow}" var="scarp" >
				<tr>
					<td><a  onclick="scrap_show('${scarp.place}','${scarp.contents}','${scarp.mapposition}')">${scarp.dtitle }<a></a></td> <td>${scarp.nick}</td>
				</tr>
			</c:forEach> 
			</tbody>
		</table>


	</div>
</body>
</html>