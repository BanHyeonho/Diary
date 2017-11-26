<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travel Diary</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="main-visual">
			<div class="jumbotron container">
				<h1 class="display-3">Travel Diary</h1>
				<p>나만의 여행 코스를 공유하세요.</p>
				<p><a class="btn btn-primary btn-lg" href="#">Learn more</a></p>
			</div>
		</div>
		
		
		<div class="container">
		
		
		<div class="wrap-ranking container">
			<h1 class="h1">RANKING 6</h1>
			 <div class="card-list">
				<div class="row">
				
				<c:forEach items="${list }" var="data" varStatus="rank">
				
				
				 <div class="col-lg-12">
						<div class="bs-component">
							<div class="card">
								<h3 class="card-header">${rank.count}등! ${data.dtitle }</h3>
								<div class="card-body">
									<h5 class="card-title">${data.place }</h5>
									<h6 class="card-subtitle text-muted">명동 · 서울특별시 중구 남산동2가 49-24</h6>
								</div>
								<span class="thumb">
									<img src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
								</span>
								<div class="card-body">
								<c:forTokens items="${data.contents}" delims="/" var="contents">
								<p class="card-text">${contents }</p>
								</c:forTokens>
									
									<a href="/oneDiary.do?linkedidx=${data.idx }&id=${user.id}" class="card-link">View More</a>
								</div>
								<div class="card-footer text-muted">
									<span class="profile-thumb">
										<img src="C:\Users\seohyeon\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Diary\upload\ayo.png" alt="프로필사진" />
									</span>
									<span class="name">보노보노보노</span>
								</div>
							</div>
						</div>
					</div> 
				
			 	<%-- <div class="contents jumbotron" >
			 	<div style="z-index:10;  position: absolute;width: 50%;background:url('https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg') no-repeat ;  "></div>
				<h2 class="title">${rank.count} 등!${data.dtitle}</h2>
				<br>
				<p class="content">
					<!-- 여행사진 -->
					<img src="" ; width="200px" height="100px"
						align="left" alt="${data.dpicture}">
					<!-- 프로필 사진 -->
					<img src="${data.picture}" width="50px" height="50px" alt="프로필 사진"
						vspace="10" hspace="10" align="left"> <a href="/oneDiary.do?linkedidx=${data.idx }&id=${user.id}">
						<c:forTokens items="${data.contents}" delims="/" var="contents">
						<p>${contents }</p>
						</c:forTokens>
						</a>
				</p>
			</div> --%>
				
				
				
				</c:forEach>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
			
		


			
		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>

</html>