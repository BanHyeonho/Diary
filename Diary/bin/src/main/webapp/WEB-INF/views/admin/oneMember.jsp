<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="css/diary.css">
<link href="css/simplex.css" rel="stylesheet" />
<script type="text/javascript" src="script/oneMember.js"></script>
</head>
<body>
	<div class="infotable">
	<form action="/oneMember.do" method="get" name="sform">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="2"><h3 style="text-align:center">회원정보보기</h3></th>
				</tr>
			</thead>
			<tr>
				<th class="join">아이디</th>
				<td>
					<div class="btn-group" role="group" aria-label="Basic example">
						<input type="text" class="form-control" value="${userinfo.id}"
							name="id" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th class="join">닉네임</th>
				<td><input type="text" class="form-control" name="nickname"
					value="${userinfo.nick}" readonly="readonly" /></td>
			</tr>
			<tr>
				<th class="join">이름</th>
				<td><input type="text" class="form-control"
					value="${userinfo.name}" name="name" readonly="readonly" /></td>
			</tr>
		</table>
		</div>
			<div class="li">
				<input type="checkbox" id="chk" disabled="disabled"
					<c:if test="${userinfo.reportcount>=3}">checked</c:if> /><span>블랙리스트</span>  <br/>
			
				<span>신고횟수</span><input class="lii" type="number" name="reportcount" onchange="rcount(this);"  value="${userinfo.reportcount}">
			</div>
			
		
		<center class="ct">
			<button type="submit" class="btn-success btn-sm" onclick="confirmm('${userinfo.id}');"><span>확인</span></button>
			<button type="button" class="btn-danger btn-sm" onclick="deleteAccount('${userinfo.id}')"><span>계정삭제</span></button>
			<button type="button" class="btn-info btn-sm" onclick=""><span>쪽지보내기</span></button>
		</center>
	</form>
</body>
</html>