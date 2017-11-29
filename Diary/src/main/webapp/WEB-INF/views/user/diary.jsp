<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
</head>
<body>

<%
int size=0;
int pagee=0;
	if(request.getAttribute("page")!=null){
	size = (int)request.getAttribute("size");
	pagee = Integer.parseInt((String)request.getAttribute("page"));
	}
%>
<div id="roof"></div>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
			<h1 class="page-tit">여행일지</h1>
			<div class="list-search">
				<div class="form-inline my-2 my-lg-0">
					<select id="option" class="form-control">
						<option>글제목</option>
						<option>여행지</option>
						<option>작성자</option>
					</select>
					<input class="form-control" type="text" placeholder="Search" id="keyword"/>
					<button class="btn btn-primary" type="submit" onclick="search();">Search</button>
				</div>
			</div>
			
			<div class="card-list">
				<div class="row">
				
				
				<c:forEach items="${list }" var="data" >
				
					<div class="col-lg-4">
						<div class="bs-component">
							<div class="card">
								<h3 class="card-header">${data.dtitle }</h3>
								<div class="card-body">
								<c:forTokens items="${data.place }" delims="/" var="place">
								<h5 class="card-title">${place }</h5>
							</c:forTokens>
								</div>
								<span class="thumb">
									<img src="/upload/${fn:split(data.dpicture,'/')[0]}" alt="이미지">
								</span>
								<div class="card-body">
									<p class="card-text"></p>
									<a href="/oneDiary.do?linkedidx=${data.idx }&id=${user.id}" class="card-link">View More</a>
								</div>
								<div class="card-footer text-muted">
									<span class="profile-thumb">
										<img src="/upload/${data.picture }" alt="프로필사진" />
									</span>
									<span class="name">${data.nick }</span>
								</div>
							</div>
						</div>
					</div>
					
					
				</c:forEach>	
					
					
				</div>
				<div>
	<%if(pagee!=0){ %>			
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="/diary.do?page=1">&lt;&lt;</a>
    </li>
    <%for(int i=1;i<=size;i++){ %>
    <li class="page-item <%if(i==pagee){%>active<%}%>">
      <a class="page-link" href="/diary.do?page=<%=i %>"><%=i %></a>
    </li>
    <%} %>
    <li class="page-item">
      <a class="page-link" href="/diary.do?page=<%=size %>">&gt;&gt;</a>
    </li>
  </ul>
 <%} %>
</div>
			
			</div>
			
			
		</div>
			
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
<script type="text/javascript" src="script/diary.js"></script>
</body>
</html>