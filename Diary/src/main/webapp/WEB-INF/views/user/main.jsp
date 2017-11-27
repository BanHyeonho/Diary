<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travel Diary</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/layout.css" rel="stylesheet" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

</head>
<body>
<div id="roof"></div>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		
		<div class="slide">
		<ul class="slide_ul">
		<li><a href="#" style="display:block;"><img style="height: 600px;width: 100%;" src="https://i.ytimg.com/vi/beNKzyf4Cyk/maxresdefault.jpg" alt="dane"></a></li>
		<li><a href="#" style="display:block;"><img style="height: 600px;width: 100%;" src="http://i.huffpost.com/gen/5089222/images/o-UNIVERSE-facebook.jpg" alt="dane"></a></li>
		<li><a href="#" style="display:block;"><img style="height: 600px;width: 100%;" src="https://img-wishbeen.akamaized.net/plan/1463029230608__%EC%8A%AC%EB%A1%9C%EB%B2%A0%EB%8B%88%EC%95%8403.jpg" alt="dane"></a></li>
	
		
		
		</ul>
		</div>
		
	
		
		
		<div class="container">
		
		
		<div class="wrap-ranking container">
			<h1 class="h1">HOT 5</h1>
			 <div class="card-list">
				<div class="row">
				
				<%-- <c:forEach items="${list }" var="data" varStatus="rank"> --%>
				<!-- 전체 div -->
				<div class="col-lg-12">
					<div class="bs-component"> 
						<!-- 1,2,3, 등 div -->
						<div style="float: left; ">
							<!-- 1등 div -->
							<div style="width:680px; height:500px; background-color: red; position: relative; ">
								<div style="position: absolute;top:400px;left:30px;">
									<h5>글제목</h3><br>
									<h3>여행위치</h3>
								</div>
								<div style="position: absolute;top:450px; left:550px;">
									<h5>작성자 닉네임</h5>
								</div>
								<span class="thumb">
									<img style="width:680px;height: 500px; " src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
								</span>
							</div>
							<!-- 2,3등 div -->
							<div style="margin-top: 30px;">
								<!-- 2등 div -->
								<div style="width:325px;height:250px; background-color:blue; float: left; position: relative;">
									<div style="position: absolute;top:150px;left:15px;">
										<h5>글제목</h3><br>
										<h3>여행위치</h3>
									</div>
									<div style="position: absolute;top:200px; left:210px;">
										<h5>작성자 닉네임</h5>
									</div>
									<span class="thumb">
										<img style="width:325px;height: 250px; " src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
									</span>
								</div >
								<!-- 3등 div -->
								<div style="width:325px;height:250px; background-color:blue; float : left; margin-left:30px;position: relative;">
									<div style="position: absolute;top:150px;left:15px;">
										<h5>글제목</h3><br>
										<h3>여행위치</h3>
									</div>
									<div style="position: absolute;top:200px; left:210px;">
										<h5>작성자 닉네임</h5>
									</div>
									<span class="thumb">
										<img style="width:325px;height: 250px; " src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
									</span>
								</div>
							</div>
						</div>
						<div  style="float: left; margin-left: 30px; "><!-- 4,5등 div -->
							<!--4등 div  -->
							<div style="width:370px;height:375px; background-color:green; position: relative;">
								<div style="position: absolute;top:280px;left:15px;">
										<h5>글제목</h3><br>
										<h3>여행위치</h3>
								</div>
								<div style="position: absolute;top:330px; left:180px;">
										<h5>작성자 닉네임</h5>
								</div>
								<span class="thumb">
									<img style="width:370px;height: 375px; " src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
								</span>
							</div>
							<!--5등 div  -->
							<div style="width:370px;height:375px; background-color:green; margin-top: 30px; position: relative;">
								<div style="position: absolute;top:280px;left:15px;">
										<h5 style="color: #ffffff">글제목</h3><br>
										<h3 >여행위치</h3>
								</div>
								<div style="position: absolute;top:330px; left:180px;">
										<h5>작성자 닉네임</h5>
								</div>
								<span class="thumb">
									<img style="width:370px;height: 375px; " src="https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/56012/51348/56012_51348_76_0_9284_201652465543354.jpg" alt="이미지">
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<%--  <div class="col-lg-12">
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
										<img src="upload/다운로드.png" alt="프로필사진" />
									</span>
									<span class="name">보노보노보노</span>
								</div>
							</div>
						</div>
					</div>  --%>
				
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
				
				
				
				<%-- </c:forEach> --%>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
			
		


			
		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>

</html>