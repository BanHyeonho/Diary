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
			<div class="contents">
				<h1>여행일지</h1>

		<c:forEach items="${list }" var="data">
				<div class="card border-info">
					<div class="card-body">
						<blockquote class="card-blockquote">
				<a href="/oneDiary.do?idx=${data.idx }">
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
		
				<%-- <c:forEach items="${list }" var="data" begin="1" varStatus="rank">
		
			<div class="contents jumbotron" >
				<h5 class="title">${rank.count} 등!${data.dtitle}</h5>
				<br>
				<p class="content">
					<!-- 여행사진 -->
					<img src="${data.dpicture}" ; width="200px" height="100px"
						align="left" alt="여행사진">
					<!-- 프로필 사진 -->
					<img src="${data.picture}" width="50px" height="50px" alt="프로필 사진"
						vspace="10" hspace="10" align="left"> <a href="/oneDiary.do?idx=0">${data.contents}</a>
				</p>
			</div>
		</c:forEach> --%>
		<button type="button" class="btn-primary btn-lg diaryMore">더보기</button>
			</div>

			
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
</body>
</html>