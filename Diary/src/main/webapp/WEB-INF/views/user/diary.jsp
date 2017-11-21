<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<style type="text/css">
.card{width: 30%;display: inline-block; float: left; margin:10px;}
.diaryMore{width:100%;}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<%@ include file="../layout/nav.jsp"%>
			<div class="contents" style="position: relative;">
			<div style="position: absolute; right: 0;">
			<select id="option"><option>글제목</option><option>여행지</option><option>작성자</option></select><input type="text" id="keyword"/><input type="button" onclick="search();" value="검색"/></div>
			<h1>여행일지</h1>
		<c:forEach items="${list }" var="data">
				<div class="card border-info" style="height: 200px;">
					<div class="card-body">
						<blockquote class="card-blockquote">
				<a href="/oneDiary.do?linkedidx=${data.idx }&id=${user.id}">
						<h2>${data.dtitle }</h2>
						<img alt="대표이미지" src="#" />
							<p>
							<footer><img alt="프로필사진" src="#" />
							<c:forTokens items="${data.place }" delims="/" var="place">
							${place }<br/>
							</c:forTokens>
							</footer>
							</p>
				</a>
						</blockquote>
					</div>
				</div>
		</c:forEach>
		
		<button type="button" class="btn-success btn-lg diaryMore">더보기</button>
			</div>

			
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript" src="script/diary.js"></script>
</body>
</html>