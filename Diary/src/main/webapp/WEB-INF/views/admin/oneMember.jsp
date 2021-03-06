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
	<script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/layout.css">
<link href="css/simplex.css" rel="stylesheet" />
<script type="text/javascript" src="script/oneMember.js"></script>
<script type="text/javascript" src="script/mypage.js"></script>
</head>
<body style="padding-top: 50px;">
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
			<%@ include file="../user/msgSend.jsp"%>
		
		<center class="ct">
			<button type="submit" class="btn-success btn-sm" onclick="updateConfirm('${userinfo.id}');" style="width:80px; ">확인</button>
			<button type="button" class="btn-primary btn-sm" onclick="deleteAccount('${userinfo.id}')" style="width:80px;">계정삭제</button>
			<button type="button" class="btn-info btn-sm" onclick="mag_form('${userinfo.nick}','${userinfo.id}','관리자','admin');">쪽지보내기</button>
		</center>
	</form>
	
</body>
</html>