<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
     <script src="https://bootswatch.com/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<link href="css/lux.css" rel="stylesheet" />
	<link href="css/layout.css" rel="stylesheet" />
<script type="text/javascript" src="script/header.js"></script>
<c:if test="${param.result!=null }">
<script type="text/javascript">
	alert('${param.result}');
</script>
</c:if>	
	<div class="header">
		<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/main.do">Travel Diary</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarColor02">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item <c:if test='${active==\'0\' }'>active</c:if>">
							<a class="nav-link" href="javascript:void(0)" onclick="location.href='/diary.do'">여행일지</a>
						</li>
						<c:choose>
						<c:when test="${admin==null}">
						<li class="nav-item <c:if test='${active==\'1\' }'>active</c:if>">
							<a class="nav-link" href="javascript:void(0)" onclick="goWrite('${user.id}');">여행일지 쓰기</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="nav-item <c:if test='${active==\'1\' }'>active</c:if>">
							<a class="nav-link"  href="javascript:void(0);" onclick="location.href='/admin.do'">관리자페이지</a>
						</li>
						</c:otherwise>
						</c:choose>
						<li class="nav-item <c:if test='${active==\'2\' }'>active</c:if>">
							<a class="nav-link" href="javascript:void(0)" onclick="location.href='/community.do'">커뮤니티</a>
						</li>
						
					</ul>	
				</div>
		<!-- 로그인폼  -->
		<c:choose>
		<c:when test="${admin!=null }">
		<div class="login_form">
		<div class="mypage_btn">
							<label class="login-after"><strong>${admin}</strong>님 반갑습니다</label>
							<button type="button" class="btn btn-primary btn-sm" onclick='location.replace("/logout.do");'>LOGOUT</button>
						</div>
		</div>
		
		
		
		</c:when>
		<c:when test="${user==null }">	
		<div class="login_form">
		
		<form action="/login.do" method="post" name="loginform">
							<div class="form-group form-inline">
								<input class="form-control form-control-sm" type="text" placeholder="ID" name="id" /> 
								<input class="form-control form-control-sm" type="password" placeholder="PW" name="password" />
								<button type="submit" class="btn btn-success btn-sm" onclick="return login();">LOG IN</button>
							</div>
							<div class="login_btn">
								<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/join.do'">REGISTER</button>
								<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/pwSearch.do'">FIND ID&PW</button>
							</div>
						</form>
		</div>
		</c:when>
		<c:otherwise><!-- 로그인됐을때 -->
		
		<div class="login_form">
		<div class="mypage_btn">
							<label class="login-after"><strong>${user.nick}</strong>님 반갑습니다</label>
							<button type="button" id="msg_chk"class="btn btn-info btn-sm" onclick="msg_move();">쪽지함</button>
							<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/mypage.do'">MY PAGE</button>
							<button type="button" class="btn btn-primary btn-sm" onclick='location.replace("/logout.do");'>LOGOUT</button>
						</div>
						<script type="text/javascript">
						msg_hham('${user.id}');
						document.addEventListener('click',function(){msg_hham('${user.id}');});
						</script>
		
			
		</div>
		</c:otherwise>

	</c:choose>
	</div>
	</nav>
</div>

