<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<link rel="stylesheet" href="css/pwSearch.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/pwSearch.js"></script>
</head>
<body>
<div class="wrap">
<%@ include file="../layout/header.jsp"%>
<div class="container">
<div class="contents">
<h1>비밀번호 찾기</h1>
	<table class="table table-bordered">
		<tr>
			<th class="pwsearch">아이디</th>
			<td><input type="text" class="form-control" id="id"/></td>
		</tr>
		<tr>
			<th class="pwsearch">비밀번호 질문</th>
			<td><select class="form-control" id="pwq">
			<option>당신이 태어난곳은?</option>
            <option>당신이 기억에 남는 선생님 성함은?</option>
            <option>당신이 가본 여행 중 가장 기억남는 곳은?</option>
            <option>당신의 어머님 성함은?</option>
            <option>당신의 아버지 성함은?</option>
			</select></td>
		</tr>
		<tr>
			<th class="pwsearch">비밀번호 답</th>
			<td><input type="text" class="form-control" id="answer"/></td>
		</tr>
	</table>
	<center>
	<button class="btn-success btn-lg pwbtn" type="button" id="pwSearchAction">확인</button>
	</center>

</div>	
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
</div>

</div>
</body>
</html>