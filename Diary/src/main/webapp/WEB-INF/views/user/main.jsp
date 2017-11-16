<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Diary&Community</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		
		<c:forEach items="${list }" var="data" begin="1" varStatus="rank">
		
			<div class="contents jumbotron" >
				<h2 class="title">${rank.count} 등!${data.dtitle}</h2>
				<br>
				<p class="content">
					<!-- 여행사진 -->
					<img src="${data.dpicture}" ; width="200px" height="100px"
						align="left" alt="여행사진">
					<!-- 프로필 사진 -->
					<img src="${data.picture}" width="50px" height="50px" alt="프로필 사진"
						vspace="10" hspace="10" align="left"> <a href="/oneDiary.do?linkedidx=${data.idx }">
						<c:forTokens items="${data.contents}" delims="/" var="contents">
						<p>${contents }</p>
						</c:forTokens>
						</a>
				</p>
			</div>
		</c:forEach>



			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
</body>

</html>