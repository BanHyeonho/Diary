<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div class="container">
		<div class="contents ">
			<div style="height: 50px">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#home">개인정보변경</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#">내가쓴글</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#">스크랩</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#">팔로워</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#">팔로윙</a></li>
				</ul>
			</div>

			<div>
				<table class="table table-striped table-hover table-bordered">
					<thead class="thead-dark">

					</thead>
					<tr>
						<th>아이디</th>
						<td><input type="text" value="" class="form-control"
							readonly="readonly" id="id"></td>
					</tr>
					<tr>
						<th class="join">이름</th>
						<td><input type="text" value="" class="form-control"
							id="name" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" value="" class="form-control"
							id="password"></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input type="password" class="form-control"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" value="" class="form-control"
							id="addr" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="" class="form-control"
							id="email" /></td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td><input type="text" value="" class="form-control"
							id="phone" /></td>
					</tr>
				</table>

				<button type="button" class="btn-success btn-lg joinbtn" onclick="">확인</button>
				<button type="reset" class="btn-warning btn-lg joinbtn">취소</button>
			</div>




		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>
</html>