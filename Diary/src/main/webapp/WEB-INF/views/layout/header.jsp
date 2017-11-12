<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="css/simplex.css" rel="stylesheet" />
<link rel="stylesheet" href="css/diary.css">
<script type="text/javascript" src="script/header.js"></script>
<c:if test="${param.result!=null }">
<script type="text/javascript">
	alert('${param.result}');
</script>
</c:if>
<div class="header" id="head">
	<div class="header_son">
		<!-- 로고  -->
		<div class="logo">
			<a href="/main.do" style="display: block; width: 700px; height: 150px;"></a>
		</div>
		<!-- 로그인폼  -->
		<c:choose>
		<c:when test="${user==null }">	
		<div class="login_form">
			<form action="/login.do" method="post" name="loginform">
				<div class="form-group">
					<input class="form-control form-control-sm " type="text"
						placeholder="ID" name="id" /> <input
						class="form-control form-control-sm" type="password"
						placeholder="PW" name="password" />
				</div>
				<div class=login_btn>
					<button type="submit" class="btn btn-primary btn-sm"
						onclick="return login();">LOG IN</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="location.href='/join.do'">REGISTER</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="location.href='/pwSearch.do'">FIND ID&PW</button>
				</div>
			</form>
		</div>
		</c:when>
		<c:otherwise>
			<div class="login_form">

				<button type="button" class="btn btn-info btn-lg" onclick="location.href='/mypage.do'">마이페이지</button><button type="button" class="btn btn-primary btn-lg" onclick='location.replace("/logout.do")'>로그아웃</button>

			</div>

		</c:otherwise>

	</c:choose>
	</div>
</div>

