<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	change('${idx}');
});

function openWin(id){  
    window.open("http://localhost:8089/oneMember.do?id="+id, "한명의 멤버보기", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  

</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div class="container">
		<div class="contents ">
			<div style="height: 50px">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#" onclick="location.href='/admin.do'">계정관리</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#diaryboard" onclick="location.href='/alldiary.do'">일지게시판</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#communityboard" onclick="location.href='/allcommunity.do'">만남게시판</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#comment">댓글</a></li>
				</ul>
			</div>

			<!-- user -->
			<div id="myTabContent" class="tab-content">
				<div id="user" class="tab-pane fade show">
					<div class="searchtool">
					<form class="ss form-inline my-2 my-lg-0" name="userSearch" method="get" action="/memberSearch.do">
					<select class="form-control" name="option">
						<option>아이디</option>
						<option>닉네임</option>
					</select>
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search" name="keyword">
							
						<button class="btn btn-secondary my-2 my-sm-0" type="submit" >검색</button>
						<button type="button"
										class="bt btn-success btn-md" onclick="blacklist();">블랙리스트</button>
					</form>
					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-success">
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
								<td>
								<input type="checkbox" disabled="disabled" <c:if test="${mdata.reportcount>=3}">checked</c:if> />						
								</td>
								<td><button type="button"
										class="btt btn-success btn-md" onclick="javascript:openWin('${mdata.id}');">정보보기</button></td>
							</tr>
						</c:forEach>
						</tbody>

					</table>
					<div class="page">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>

				<!--diaryboard-->
				<div id="diaryboard" class="tab-pane fade show">
					<div class="searchtool">
					<form class="ss form-inline my-2 my-lg-0" method="get" action="/diarySearch.do" >
					<select class="form-control" name="option">
						<option>글제목</option>
						<option>닉네임</option>
					</select>
						<input class="s form-control mr-sm-2" type="text"
							placeholder="Search" name="keyword">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
						<button type="button" class="btt btn-danger btn-md"
							onclick="reportdlist();">신고된 게시물 보기</button>
					
					</form>
						
					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-danger">
							<tr>
								<th>글제목</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
								<th>신고사유보기</th>
							</tr>
						</thead>
						<tbody id="dlist">
							<c:forEach var="ddata" items="${dlist}">
							<tr id="${ddata.idx}">
								<td>${ddata.dtitle}</td>
								<td>${ddata.nick}</td>
								<td><button type="button"
										class="btn-danger btn-md" onclick="">글보기</button></td>
								<td><button type="button"
										class="btn-danger btn-md" onclick="deletediary('${ddata.idx}');">삭제</button></td>
								<td><button type="button"
										class="btn-danger btn-md" onclick="">신고사유</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- communityboard -->
				<div id="communityboard" class="tab-pane fade show">
					<div class="searchtool">
					<form class="ss form-inline my-2 my-lg-0" name="searchtool" method="get" action="/communitySearch.do">
					<select class="form-control" name="option">
						<option>글제목</option>
						<option>닉네임</option>
					</select>
						<input class="s form-control mr-sm-2" type="text"
							placeholder="Search" name="keyword">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit" onclick="communitysearch();">검색</button><!--onclick="communitysearch();"  -->
						<button type="button" class="btt btn-info btn-md"
							onclick="reportclist();">신고된 게시물 보기</button>
					</form>
						
					</div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-info">
							<tr>
								<th>글제목</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
								<th>신고사유보기</th>
							</tr>
						</thead>
						<tbody id="clist">
							<c:forEach var="cdata" items="${clist}" >
							<tr id="${cdata.idx}">
								<td>${cdata.ctitle}</td>
								<td>${cdata.nick}</td>
								<td><button type="button"
										class="btn-info btn-md" onclick="">글보기</button></td>
								<td><button type="button"
										class="btn-info btn-md" onclick="deletecommunity('${cdata.idx}');">삭제</button></td>
								<td><button type="button"
										class="btn-info btn-md" onclick="">신고사유</button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>

				<!--comment -->
				<div id="comment" class="tab-pane fade show" method="get" action="/commentSearch.do">
				<div class="searchtool">
					<form class="ss form-inline my-2 my-lg-0">
					<select class="form-control" name="option">
						<option>댓글내용</option>
						<option>닉네임</option>
					</select>
						<input class="s form-control mr-sm-2" type="text"
							placeholder="Search" name="keyword">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
					
					</form>
						
				    </div>
					<table class="table table-striped table-hover table-bordered">
						<thead class="table-warning">
							<tr>
								<th>댓글내용</th>
								<th>닉네임</th>
								<th>글보기</th>
								<th>삭제</th>
								<th>신고사유보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="codata" items="${rclist}">
							<tr>
								<td>
								<c:choose>
								<c:when test="${codata.content.length>=15}">${codata.content.substring(0,15)}</c:when>
								<c:otherwise>
								${codata.content}
								</c:otherwise>
								
								</c:choose>
								
								</td>
								<td>${codata.nick}</td>
								<td><button type="button"
										class="btn-warning btn-md" onclick="">글보기</button></td>
								<td><button type="button"
										class="btn-warning btn-md" onclick="">삭제</button></td>
								<td><button type="button"
										class="btn-warning btn-md" onclick="">신고사유</button></td>
							</tr>
							</c:forEach>
						</tbody>
						
					</table>
					<div class="page">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>

			</div>

		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>
</html>