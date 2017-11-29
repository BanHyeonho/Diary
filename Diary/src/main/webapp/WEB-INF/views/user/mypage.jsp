<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="www.dto.MemberVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/mypage.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var s = document.getElementsByTagName('select')[0];
		s.value = '${user.pwq}';
	}
</script>

</head>
<body>

	<%@ include file="../layout/header.jsp"%>
	<c:if test="${msg!=null }">
		<script type="text/javascript">
			msg_1('${user.id}');
			$(document).ready(
					function() {
						$('#msg').attr('class',
								'privacy tab-pane fade active show in');
						$('#privacy').attr('class', 'tab-pane fade show');
						$('.color a').css('color', '#626261');
						$('#msg_1 a').css('color', '#d9534f');

					});
		</script>
	</c:if>
	<div class="container"
		style="width: 860px; min-height: 800px; margin: 0 auto;">
		<div class="contents">

			<ul class="nav nav-tabs">
				<li class="nav-item color" id="privacyy"><a
					class="nav-link ative" data-toggle="tab" href="#"
					onclick="privacyy();">개인정보변경</a></li>
				<li class="nav-item color" id="mywrite"><a class="nav-link "
					data-toggle="tab" href="#" onclick="mywrite('${user.id}')">내가쓴글</a></li>
				<li class="nav-item color" id="scrap_list"><a class="nav-link "
					data-toggle="tab" href="#" onclick="scrap_list('${user.id}')">스크랩</a></li>
				<li class="nav-item color" id="followerss"><a class="nav-link "
					data-toggle="tab" href="#" onclick="followers('${user.id}')">팔로워</a></li>
				<li class="nav-item color" id="followingg"><a class="nav-link "
					data-toggle="tab" href="#" onclick="following('${user.id}')">팔로윙</a></li>
				<li class="nav-item color" id="msg_1"><a class="nav-link "
					data-toggle="tab" href="#" onclick="msg_1('${user.id}');">쪽지함</a></li>
				<li class="nav-item color" id="block_listt"><a
					class="nav-link " data-toggle="tab" href="#"
					onclick="block_list('${user.id}')">차단목록</a></li>
			</ul>

			<!-- privacy -->
			<div id="myTabContent" class="tab-content">
				<div id="privacy" class="privacy tab-pane fade in active show">


					<form action="/updateInfoAction.do" method="post" name="sform" enctype="multipart/form-data">
						<table class="table table-bordered">
							<thead class="thead-dark">
								<tr>
									<th colspan="2"><h1 style="color: #fff;">회원정보 수정</h1></th>
								</tr>
							</thead>
							<tr>
								<th class="join">아이디<font color="red">*</font></th>
								<td>
									<div class="btn-group" role="group" aria-label="Basic example">
										<input type="hidden" name="id" value="${user.id}" /> <input
											type="text" class="form-control" value="${user.id}"
											name="userid" readonly="readonly" />

									</div>
									<div id="idresult"></div>
								</td>
							</tr>
							<tr>
								<th class="join">이름<font color="red">*</font></th>
								<td><input type="text" class="form-control"
									value="${user.name}" name="name" /></td>
							</tr>
							<tr>
								<th class="join">비밀번호<font color="red">*</font></th>
								<td><input type="password" class="form-control"
									value="${user.password}" name="password" /></td>
							</tr>
							<tr>
								<th class="join">비밀번호확인<font color="red">*</font></th>
								<td><input type="password" class="form-control"
									value="${user.password}" id="pwdchk" /></td>
							</tr>
							<tr>
								<th class="join">닉네임<font color="red">*</font></th>
								<td>
									<div class="btn-group" role="group" aria-label="Basic example">
										<input type="hidden" name="nick" value="${user.nick}" /> <input
											type="text" class="form-control" value="${user.nick}"
											name="nickname" readonly="readonly" />

									</div>
									<div id="nresult"></div>
								</td>
							</tr>
							<tr>
								<th class="join">성별<font color="red">*</font></th>
								<td><input type="radio" name="gender" value="M"
									<c:if test="${user.gender =='M'}">checked</c:if> />남자<input
									type="radio" name="gender" value="W"
									<c:if test="${user.gender =='W'}">checked</c:if> />여자</td>
							</tr>
							<tr>
								<th class="join">생일<font color="red">*</font></th>
								<td><input type="date" class="form-control" name="birth"
									value="${user.birth }" /></td>
							</tr>
							<tr class="email">
								<th class="join">이메일<font color="red">*</font></th>
								<td><input type="text" class="form-control" name="email"
									value="${user.email}" />
							</tr>
							<tr class="phone">
								<th class="join">연락처</th>
								<td><input type="text" class="form-control" name="phone1"
									value="010" readonly /> <span>-</span> <input type="text"
									class="form-control" name="phone2"
									value="${user.phone.split('-')[1] }" /> <span>-</span> <input
									type="text" class="form-control" name="phone3"
									value="${user.phone.split('-')[2] }" /></td>
								<input type="hidden" name="phone">
							</tr>
							
							<tr>
								<th class="join">비밀번호 질문<font color="red">*</font></th>
								<td><select class="form-control" name="pwq">
										<option>당신이 태어난곳은?</option>
										<option>당신이 기억에 남는 선생님 성함은?</option>
										<option>당신이 가본 여행 중 가장 기억남는 곳은?</option>
										<option>당신의 어머님 성함은?</option>
										<option>당신의 아버지 성함은?</option>
								</select></td>
							</tr>
							<tr>
								<th class="join">비밀번호 답<font color="red">*</font></th>
								<td><input type="text" class="form-control" name="answer"
									value="${user.answer }" /></td>
							</tr>
							<tr>
								<th class="join">프로필사진</th>
								<td><input type="file" name="picture" id="picture" /><br/>
								
								<img src='/upload/${user.picture}' alt="프로필사진" id="oldpic" /> 
            						<div id="holder"></div></td>
							</tr>
						</table>
						<center>
							<button type="submit" class="btn-primary btn-lg"
								onclick="return confirmm();">회원정보 수정</button>
						</center>
						<div style="text-align: right;">
							<button type="button" class="btn-danger btn"
								onclick="deletee('${user.id}');">회원탈퇴</button>
						</div>
					</form>
				</div>
				<!-- my_write 여행 리스트-->
				<div id="my_write" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
						<button type="button" class="btn btn-danger">여행일지 내가쓴글</button>
						<button type="button" class="btn btn-success" data-toggle="tab"
							href="#myCommunity" onclick="myCommunity('${user.id}')">만남의장
							내가쓴글</button>

						<thead class="thead-dark">
							<tr>

								<th><span style="color: #d9534f;">여행일지</span> &nbsp;
									&nbsp;글제목</th>
								<th>날짜</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody id="my_diary">


						</tbody>
					</table>
				</div>
				<!-- myCommunity 만남의장 리스트 -->
				<div id="myCommunity" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<button type="button" class="btn btn-success">만남의장 내가쓴글</button>
						<button type="button" class="btn btn-danger" data-toggle="tab"
							href="#my_write" onclick="write_write()">여행일지 내가쓴글</button>
						<thead class="thead-dark">

							<tr>
								<th><span style="color: #4bbf73;">만남의장</span> &nbsp;
									&nbsp;글제목</th>
								<th>날짜</th>
								<th>조회수</th>

							</tr>
						</thead>
						<tbody id="my_commu">


						</tbody>
					</table>
				</div>

				<!-- scrap -->
				<div id="scrap" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>글제목</th>
								<th>날짜</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody id="scrap_body">
							<!-- <tr>
								 {} 넣어서 for each 로 돌려
								 <td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> -->
						</tbody>
					</table>
					<div>
						<span style="color: red;"> *스크랩 삭제를 원하시면 본문을 클릭하셔서 삭제 하셔야
							합니다! *</span>
					</div>
				</div>

				<!--followers -->
				<div id="followers" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th colspan="3">나를 팔로우한 사람들<span id="follow_cnt"></span></th>
							</tr>
						</thead>
						<tbody id="followers_list">

						</tbody>
					</table>

				</div>
				<!--follwoing -->
				<div id="follwoing" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th colspan="3">내가 팔로잉한 사람들<span id="folloing_cnt"></span></th>
							</tr>
						</thead>
						<tbody id="following_list">

						</tbody>
					</table>

				</div>
				<!-- 쪾지함  -->
				<div id="msg" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>보낸사람</th>
								<th>내용</th>
								<th>답장하기</th>
								<th>메세지삭제</th>
							</tr>
						</thead>
						<tbody id="msg_ham">

						</tbody>
					</table>
					
				</div>
				<!--block_list  -->
				<div id="block_list" class="tab-pane fade">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th colspan="3">차단회원목록</th>
							</tr>
						</thead>
						<tbody id="my_black">

							<!-- <td><button class="btn btn-outline-danger">차단 취소</button></td> -->

						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>
	<%@ include file="./msgSend.jsp"%>
	<%@ include file="../layout/footer.jsp"%>
	<script type="text/javascript" src="script/preview.js"></script>
</body>
</html>