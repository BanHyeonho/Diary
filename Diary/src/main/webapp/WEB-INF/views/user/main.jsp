<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="www.dto.TopVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travel Diary</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/layout.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>
<body>
<%
	List<TopVo> list = (List)request.getAttribute("list");
	Random r = new Random();
	
	List<Integer> idx = new ArrayList<Integer>();
	while(idx.size()!=5){
		int num =r.nextInt(5);
		if(!idx.contains(num)){
			idx.add(num);	
		}
	}
	int i=0;
%>
<div id="roof"></div>

	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="slide">
		<ul class="slide_ul">
		<li><a href="#" style="display:block; position:relative; text-decoration:none;"></a>
		<div style="position:absolute; top:200px; left:53%;">
			
				<h1 class="display-3" style="color:white">Travel Diary</h1>
				<div style="float:right; top:10px;"><p style="font-size:17px; color:white;">나만의 여행 코스를 공유하세요</p>
				<a class="btn btn-primary btn-md" href="http://www.earthtory.com/ko" target="_blank">GO</a></div>
			</div>
			<img style="height: 600px;width: 100%;" src="http://image.tourbaksa.com/New/Main/MainThema/2017/6/abda9a8e-6832-42ca-a18e-56fb134d3235.jpg" alt="dane">
		</li>
		<li>
		<div style="position:absolute; top:200px; left:53%;">
			
				<h1 class="display-3" style="color:white">Travel Diary</h1>
				<div style="float:right; top:10px;"><p style="font-size:17px; color:white;">나만의 여행 코스를 공유하세요</p>
				<a class="btn btn-primary btn-md" href="http://www.earthtory.com/ko" target="_blank">GO</a></div>
			</div>
			<img style="height: 600px;width: 100%;" src="https://i.ytimg.com/vi/beNKzyf4Cyk/maxresdefault.jpg" alt="dane">
	<!-- 	<a href="http://www.jeju.go.kr/index.htm" target="_blank" style="display:block;"><img style="height: 600px;width: 100%;" src="https://i.ytimg.com/vi/beNKzyf4Cyk/maxresdefault.jpg" alt="dane"></a></li> -->
		<li>
		<div style="position:absolute; top:200px; left:53%;">
			
				<h1 class="display-3" style="color:white">Travel Diary</h1>
				<div style="float:right; top:10px;"><p style="font-size:17px; color:white;">나만의 여행 코스를 공유하세요</p>
				<a class="btn btn-primary btn-md" href="http://www.earthtory.com/ko" target="_blank">GO</a></div>
			</div>
			<img style="height: 600px;width: 100%;" src="http://image.tourbaksa.com/New/Main/MainThema/2017/11/8f242807-2f14-4c6d-baab-4f4985b64984.jpg" alt="dane">
	<!-- 	<a href="#" style="display:block;" target="_blank"><img style="height: 600px;width: 100%;" src="http://image.tourbaksa.com/New/Main/MainThema/2017/11/8f242807-2f14-4c6d-baab-4f4985b64984.jpg" alt="dane"></a></li> -->
		<li>
		<div style="position:absolute; top:200px; left:53%;">
			
				<h1 class="display-3" style="color:white">Travel Diary</h1>
				<div style="float:right; top:10px;"><p style="font-size:17px; color:white;">나만의 여행 코스를 공유하세요</p>
				<a class="btn btn-primary btn-md" href="http://www.earthtory.com/ko" target="_blank">GO</a></div>
			</div>
			<img style="height: 600px;width: 100%;" src="http://file.intereuro.co.kr/Puzzle/PuzzleBanner/PuzzleBanner_201783116239_76_61_1.jpg" alt="dane">
		
		<!-- <a href="#" style="display:block;" target="_blank"><img style="height: 600px;width: 100%;" src="http://file.intereuro.co.kr/Puzzle/PuzzleBanner/PuzzleBanner_201783116239_76_61_1.jpg" alt="dane"></a></li> --> 
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

									<h3 style="color: #ffffff"><%=list.get(idx.get(i)).getDtitle() %></h3><br>
									<h5 style="color: #ffffff"><%=list.get(idx.get(i)).getPlace().replaceAll("/", "#") %></h5>

								</div>
								
								<span class="thumb">
									<a href="/oneDiary.do?linkedidx=<%=list.get(idx.get(i)).getIdx() %>&id=${user.id}"><img style="width:680px;height: 500px; " src="/upload/<%=list.get(idx.get(i++)).getDpicture().split("/")[0] %>" alt="이미지"></a>
								</span>
							</div>
							<!-- 2,3등 div -->
							<div style="margin-top: 30px;">
								<!-- 2등 div -->
								<div style="width:325px;height:250px; background-color:blue; float: left; position: relative;">
									<div style="position: absolute;top:150px;left:15px;">
										<h3 style="color: #ffffff"><%=list.get(idx.get(i)).getDtitle() %></h3><br>
										<h5 style="color: #ffffff"><%=list.get(idx.get(i)).getPlace().replaceAll("/", "#") %></h5>

									</div>
									
									<span class="thumb">
										<a href="/oneDiary.do?linkedidx=<%=list.get(idx.get(i)).getIdx() %>&id=${user.id}"><img style="width:325px;height: 250px; " src="/upload/<%=list.get(idx.get(i++)).getDpicture().split("/")[0] %>" alt="이미지"></a>
									</span>
								</div >
								<!-- 3등 div -->
								<div style="width:325px;height:250px; background-color:blue; float : left; margin-left:30px;position: relative;">
									<div style="position: absolute;top:150px;left:15px;">
										<h3 style="color: #ffffff"><%=list.get(idx.get(i)).getDtitle() %></h3><br>
										<h5 style="color: #ffffff"><%=list.get(idx.get(i)).getPlace().replaceAll("/", "#") %></h5>

									</div>
									
									<span class="thumb">
										<a href="/oneDiary.do?linkedidx=<%=list.get(idx.get(i)).getIdx() %>&id=${user.id}"><img style="width:325px;height: 250px; " src="/upload/<%=list.get(idx.get(i++)).getDpicture().split("/")[0] %>" alt="이미지"></a>
									</span>
								</div>
							</div>
						</div>
						<div  style="float: left; margin-left: 30px; "><!-- 4,5등 div -->
							<!--4등 div  -->
							<div style="width:370px;height:375px; background-color:green; position: relative;">
								<div style="position: absolute;top:280px;left:15px;">
										<h3 style="color: #ffffff"><%=list.get(idx.get(i)).getDtitle() %></h3><br>
										<h5 style="color: #ffffff"><%=list.get(idx.get(i)).getPlace().replaceAll("/", "#") %></h5>

								</div>
								
								<span class="thumb">
									<a href="/oneDiary.do?linkedidx=<%=list.get(idx.get(i)).getIdx() %>&id=${user.id}"><img style="width:370px;height: 375px; " src="/upload/<%=list.get(idx.get(i++)).getDpicture().split("/")[0] %>" alt="이미지"></a>
								</span>
							</div>
							<!--5등 div  -->
							<div style="width:370px;height:375px; background-color:green; margin-top: 30px; position: relative;">
								<div style="position: absolute;top:280px;left:15px;">
										<h3 style="color: #ffffff"><%=list.get(idx.get(i)).getDtitle() %></h3><br>
										<h5 style="color: #ffffff"><%=list.get(idx.get(i)).getPlace().replaceAll("/", "#") %></h5>
								</div>
								
								<span class="thumb">
									<a href="/oneDiary.do?linkedidx=<%=list.get(idx.get(i)).getIdx() %>&id=${user.id}"><img style="width:370px;height: 375px; " src="/upload/<%=list.get(idx.get(i++)).getDpicture().split("/")[0] %>" alt="이미지"></a>
								</span>
							</div>
						</div>
					</div>
				</div>
				
				</div>
			</div>
		</div>
		
		
		</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>

</html>