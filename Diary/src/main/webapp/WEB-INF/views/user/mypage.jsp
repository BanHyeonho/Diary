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
					<li class="nav-item"><a class="nav-link "
						data-toggle="tab" href="#privacy">개인정보변경</a></li>
					<li class="nav-item"><a class="nav-link "
						data-toggle="tab" href="#my_write">내가쓴글</a></li>
					<li class="nav-item"><a class="nav-link "
						data-toggle="tab" href="#scrap">스크랩</a></li>
					<li class="nav-item"><a class="nav-link "
						data-toggle="tab" href="#followers">팔로워</a></li>
					<li class="nav-item"><a class="nav-link "
						data-toggle="tab" href="#follwoing">팔로윙</a></li>
				</ul>
			</div>
			<!-- privacy -->
			<div id="myTabContent" class="tab-content">
				<div id="privacy" class="tab-pane fade active show in">

					<table class="table table-striped table-hover table-bordered">
						<tr>
							<th>아이디</th>
							<td><input type="text" value="" class="form-control"
								readonly="readonly" id="id"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input type="text" value="" class="form-control"
								readonly="readonly" id="nick"></td>
						</tr>
						<tr>
							<th class="join">이름</th>
							<td><input type="text" value="" class="form-control"
								id="name" /></td>
						</tr>
						<tr>
							<th >성별</th>
							 <td><input type="radio" name="gender"/>남자	&nbsp;&nbsp;<input type="radio" name="gender"/>여자</td>
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
					<div class="kal">
						<button type="button" class="btn-success btn-lg joinbtn"
							onclick="">확인</button>
						<button type="reset" class="btn-warning btn-lg joinbtn">취소</button>

					</div>

				</div>
				<!-- my_write -->
				<div id="my_write" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-success">
							<tr>
								<th>글제목</th>
								<th>날짜</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!--  {} 넣어서 for each 로 돌려 -->
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- scrap -->
				<div id="scrap" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-danger">
							<tr>
								<th>글제목</th>
								<th>날짜</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!--  {} 넣어서 for each 로 돌려 -->
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>

				<!--followers -->
				<div id="followers" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
					<thead class="table-warning">
						<tr>
							<th>닉네임</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td> <!--  {} 넣어서 for each 로 돌려 -->
						</tr>
					</tbody>
					</table>
					
				</div>
				<!--follwoing -->
				<div id="follwoing" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
					<thead class="table-info">
						<tr>
							<th colspan="2">닉네임</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td><td><button class="btn btn-outline-danger">팔로우 취소</button></td> <!--  {} 넣어서 for each 로 돌려 -->
						</tr>
					</tbody>
					</table>
					
				</div>

			</div>

		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>
</html>