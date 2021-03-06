<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/admin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		change('${idx}');
	});
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div class="container">
		<div class="contents ">
			<div style="height: 50px">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#user" onclick="location.href='/admin.do'" id="a">사용자 계정</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#diaryboard" onclick="location.href='/alldiary.do'" id="b">여행일지
							게시판 </a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#communityboard" onclick="location.href='/allcommunity.do'"
						id="c">커뮤니티 게시판</a></li>
					  <li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#comment" onclick="commentList();" id="d">신고 댓글</a></li>
					 		 
				</ul>
			</div>

			<!-- user -->
			<div id="myTabContent" class="tab-content">
				<div id="user" class="tab-pane fade show">
					<div class="searchtool">
						<form class="ss form-inline my-2 my-lg-0" name="userSearch"
							method="get" action="/memberSearch.do">
							<select class="form-control" name="option">
								<option>아이디</option>
								<option>닉네임</option>
							</select> <input class="form-control mr-sm-2" type="text"
								placeholder="Search" name="keyword">

							<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
							<button type="button" class="bt btn-danger btn-md"
								onclick="blacklist();">블랙리스트</button>
						</form>
					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>아이디</th>
								<th>닉네임</th>
								<th>신고당한 횟수</th>
								<th>블랙리스트</th>
								<th>회원정보보기</th>
							</tr>
						</thead>
						<tbody id="blacklist">
							<c:forEach var="mdata" items="${mlist}">
								<tr>
									<td>${mdata.id}</td>
									<td>${mdata.nick}</td>
									<td>${mdata.reportcount}</td>
									<td><input type="checkbox" disabled="disabled"
										<c:if test="${mdata.reportcount>=3}">checked</c:if> /></td>
									<td><button type="button"
											class="btt btn-primary btn-md"
											onclick="javascript:openWin('${mdata.id}');">정보보기</button></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					
				</div>

				<!--diaryboard-->
				<div id="diaryboard" class="tab-pane fade show">
					<div class="searchtool">
						<form class="ss form-inline my-2 my-lg-0" method="get"
							action="/diarySearch.do">
							<select class="form-control" name="option">
								<option>글제목</option>
								<option>닉네임</option>
							</select> <input class="s form-control mr-sm-2" type="text"
								placeholder="Search" name="keyword">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
							<button type="button" class="btt btn-danger btn-md"
								onclick="reportdlist();">신고된 게시물 보기</button>

						</form>

					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr id="dTable">
								<th>글제목</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="dlist">
							<c:forEach var="ddata" items="${dlist}">
								<tr id="${ddata.idx}">
									<td>${ddata.dtitle}</td>
									<td>${ddata.nick}</td>
									<td><button type="button"
											class="btn-primary btn-md"
											onclick="javascript:DviewopenWin('${ddata.idx}');">글보기</button></td>
									<td><button type="button"
											class="btn-danger btn-md"
											onclick="deletediary('${ddata.idx}');">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				<!-- communityboard -->
				<div id="communityboard" class="tab-pane fade show">
					<div class="searchtool">
						<form class="ss form-inline my-2 my-lg-0" name="searchtool"
							method="get" action="/communitySearch.do">
							<select class="form-control" name="option">
								<option>글제목</option>
								<option>닉네임</option>
							</select> <input class="s form-control mr-sm-2" type="text"
								placeholder="Search" name="keyword">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit"
								onclick="communitysearch();">검색</button>
							<!--onclick="communitysearch();"  -->
							<button type="button" class="btt btn-danger btn-md"
								onclick="reportclist();">신고된 게시물 보기</button>
						</form>

					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr id="cTable">
								<th>글제목</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="clist">
							<c:forEach var="cdata" items="${clist}">
								<tr id="${cdata.idx}">
									<td>${cdata.ctitle}</td>
									<td>${cdata.nick}</td>
									<td><button type="button"
											class="btn-primary btn-md"
											onclick="javascript:CviewopenWin('${cdata.idx}');">글보기</button></td>
									<td><button type="button"
											class="btn-danger btn-md"
											onclick="deletecommunity('${cdata.idx}');">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>

				<!--여행일지 comment -->
				<div id="comment" class="tab-pane fade show">
					<div class="searchtool">
						<h3>여행일지 신고된 댓글</h3>
						<form class="ss form-inline my-2 my-lg-0" name="dcosearchtool"
							method="get">
							<select class="form-control" name="option">
								<option>댓글내용</option>
								<option>닉네임</option>
							</select> <input class="s form-control mr-sm-2" type="text"
								placeholder="Search" name="keyword">
							<button class="btn btn-secondary my-2 my-sm-0" type="button"
								onclick="dcosearch();">검색</button>
							<button type="button" class="btt btn-danger btn-md"
								data-toggle="tab" href="#Comcomment" onclick="Comcomment();">커뮤니티
								신고 댓글보기</button>
						</form>

					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>댓글내용</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
								<th>신고사유보기</th>
							</tr>
						</thead>
						<tbody id="dcommentlist">
							
						</tbody>

					</table>
					
				</div>

				<!--만남의장 comment -->
				<div id="Comcomment" class="tab-pane fade show">
					<div class="searchtool">
						<h3>커뮤니티 신고된 댓글</h3>
						<form class="ss form-inline my-2 my-lg-0" name="ccosearchtool"
							method="get">
							<select class="form-control" name="option">
								<option>댓글내용</option>
								<option>닉네임</option>
							</select> <input class="s form-control mr-sm-2" type="text"
								placeholder="Search" name="keyword">
							<button class="btn btn-secondary my-2 my-sm-0" type="button"
								onclick="ccosearch();">검색</button>
							<button type="button" class="btt btn-danger btn-md"
								data-toggle="tab" href="#comment" onclick="commentList();">여행일지
								신고 댓글보기</button>
						</form>

					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>댓글내용</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
								<th>신고사유보기</th>
							</tr>
						</thead>
						<tbody id="ccommentlist">
						</tbody>

					</table>
					
				</div>

			</div>

		</div>

	</div>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>