<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="www.dto.MemberVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/mypage.js"></script>
<script type="text/javascript">
window.onload=function(){
	var s =document.getElementsByTagName('select')[1];
	s.value='${user.pwq}';
	var b = document.sform.birth;
	b.value="${user.birth}";
}
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<%
	MemberVo vo =(MemberVo)session.getAttribute("user");
	String[] phone = vo.getPhone().split("-");
	%>
	<div class="container">
		<div class="contents ">
			<div style="height: 50px">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#privacy">개인정보변경</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#my_write">내가쓴글</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#scrap">스크랩</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#followers">팔로워</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#follwoing">팔로윙</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#msg">쪽지함</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#delete">회원탈퇴</a></li>
						
				</ul>
			</div>
			<!-- privacy -->
			<div id="myTabContent" class="tab-content">
				<div id="privacy" class="privacy tab-pane fade active show in">

					
					<form action="/updateInfoAction.do" method="post" name="sform">
						<table class="table table-bordered">
								<thead><tr><th colspan="2"><h1>회원정보 수정</h1></th></tr></thead>
							<tr>
								<th class="join">아이디<font color="red">*</font></th>
								<td>
									<div class="btn-group" role="group" aria-label="Basic example">
										<input type="hidden" name="id"value="${user.id}" /> <input type="text"
											class="form-control" value="${user.id}" name="userid" readonly="readonly" />
										
									</div>
									<div id="idresult"></div>
								</td>
							</tr>
							<tr>
								<th class="join">이름<font color="red">*</font></th>
								<td><input type="text" class="form-control" value="${user.name}" name="name" /></td>
							</tr>
							<tr>
								<th class="join">비밀번호<font color="red">*</font></th>
								<td><input type="password" class="form-control"
									value="${user.password}" name="password" /></td>
							</tr>
							<tr>
								<th class="join">비밀번호확인<font color="red">*</font></th>
								<td><input type="password" class="form-control" value="${user.password}" id="pwdchk" /></td>
							</tr>
							<tr>
								<th class="join">닉네임<font color="red">*</font></th>
								<td>
									<div class="btn-group" role="group" aria-label="Basic example">
										<input type="hidden" name="nick" value="${user.nick}" /> <input type="text"
											class="form-control"value="${user.nick}" name="nickname" readonly="readonly" />
										
									</div>
									<div id="nresult"></div>
								</td>
							</tr>
							<tr>
								<th class="join">성별<font color="red">*</font></th>
								<td>
								<input type="radio" name="gender" value="M"<c:if test="${user.gender =='M'}">checked</c:if> />남자<input
									type="radio" name="gender" value="W"<c:if test="${user.gender =='W'}">checked</c:if>/>여자</td>
							</tr>
							<tr>
								<th class="join">생일<font color="red">*</font></th>
								<td><input type="date" class="form-control" name="birth"  /></td>
							</tr>
							<tr class="email">
								<th class="join">이메일<font color="red">*</font></th>
								<td><input type="text" class="form-control" name="email1"  value="${user.email}"/><span>@</span><select
									class="emaill form-control" name="email2">
										<option>daum.net</option>
										<option>naver.com</option>
										<option>goole.com</option>
								</select></td>
								<input type="hidden" name="email">
							</tr>
							<tr class="phone">
								<th class="join">연락처</th>
								<td>
								
								<input type="text" class="form-control" name="phone1"
									value="010" readonly /> <span>-</span> 
									
									<input type="text"class="form-control" name="phone2" value="<%=phone[1]%>"/> <span>-</span> <input
									type="text" class="form-control" name="phone3" value="<%=phone[2]%>" /></td>
								<input type="hidden" name="phone">
							</tr>
							<tr>
								<th class="join">주소</th>
								<td><input type="text" class="form-control" name="addr"  value="${user.addr }"/></td>
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
								<td><input type="text" class="form-control" name="answer" value="${user.answer }" /></td>
							</tr>
							<tr>
								<th class="join">프로필사진</th>
								<td><input type="text" class="form-control" name="picture"
									value="${user.picture }" /></td>
							</tr>
						</table>
						<center>
							<button type="submit" class="btn-success btn-lg" onclick="return confirm();">회원정보 수정</button>
							
						</center>
					</form>
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
								<td></td>
								<!--  {} 넣어서 for each 로 돌려 -->
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
								<td></td>
								<td><button class="btn btn-outline-danger">팔로우 취소</button></td>
								<!--  {} 넣어서 for each 로 돌려 -->
							</tr>
						</tbody>
					</table>

				</div>
				<!-- 쪾지함  -->
				<div id="msg" class="tab-pane fade show">
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>보낸사람</th>
								<th>내용</th>
								<th>답장하기</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span>보낸이</span>&nbsp;&nbsp;<button class="btn btn-outline-danger">차단</button></td>
								<td></td>
								<td><button class="btn btn-outline-danger">답장</button></td>
								<td><button type="button" class="btn btn-outline-danger" >삭제</button></td>
								<!--  {} 넣어서 for each 로 돌려 -->
							</tr>
						</tbody>
					</table>

				</div>
				<div id="delete" class="tab-pane fade show">
					<button type="button" class="btn-danger btn-lg" onclick="deletee('${user.id}');">회원탈퇴</button>
				</div>
			</div>

		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>
</html>