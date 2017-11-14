<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
</head>

<body>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
	<div class="container">
	<div class="contents" >
	<form action="#">
	<h1>만남의 장</h1>
	<table class="table table-striped table-hover table-bordered">
		<tbody>
    	<tr>
       		<td>지역</td>
         	<td>
        		
           			<select name="지역">
           				<option value="서울">서울</option>
           				<option value="부산">부산</option>
           				<option value="대전">대전</option>
           				<option value="광주">광주</option>
           			</select>
         		
      		</td>
    	</tr>
    	<tr>
       		<td>성별</td>
         	<td>
            	<input type="radio" name="gender" value="anything" checked> 상관없음
             	<input type="radio" name="gender" value="male"> 남
           		<input type="radio" name="gender" value="female"> 여
      		</td>
    	</tr>
    	<tr>
       		<td>여행날짜</td>
         	<td>
            	
          		<input type="date" name="sdate">
          		~
           		<input type="date" name="edate">
         		
      		</td>
    	</tr>
    	<tr>
         	<td colspan="2"> 
         	
           		<div>
          			<select name="제목">
           			<option value="제목">제목</option>
           			<option value="내용">내용</option>
           			<option value="닉네임">닉네임</option>
           			</select>
          
           			<input type="text" placeholder="검색어 입력" size="60">
           			<button>검색</button>
           			<button type='button' onclick="location.href='/communitywrite.do'">글쓰기</button>
           		</div>
     	
           	</td>
    	</tr>
		</tbody>
		</table>
		</form>
		
		<table class="table table-striped table-hover table-bordered">
  		<thead class="thead-dark">
    	<tr>
      		<th>NO</th>
      		<th>닉네임</th>
      		<th>제목</th>
      		<th>지역</th>
      		<th>인원</th>
      		<th>여행날짜</th>
      		<th>차량유무</th>
    	</tr>
  		</thead>
  		<tbody>
  		<c:forEach items="${list }" var="data" varStatus="d" begin="1" >
    		<tr>
      			<td>${d.count}</td>
      			<td>${data.nick}</td>
      			<td>${data.ctitle}</td>
      			<td>${data.cplace}</td>
      			<td>${data.attendee}</td>
      			<td>${data.sdate} ~ ${data.edate}</td>
      			<td>
      			<input type="checkbox" name="chk_info" disabled=true value="car">
      			</td>
    		</tr>
    	</c:forEach>
 		</tbody>
 	</table>
 	
 	<div>
  		<ul class="pagination justify-content-center">
    	<li class="page-item disabled">
      		<a class="page-link" href="#">&laquo;</a>
    	</li>
    	<li class="page-item active">
      		<a class="page-link" href="#">1</a>
    	</li>
    	<li class="page-item">
      		<a class="page-link" href="#">2</a>
    	</li>
    	<li class="page-item">
      		<a class="page-link" href="#">3</a>
    	</li>
    	<li class="page-item">
      		<a class="page-link" href="#">4</a>
    	</li>
    	<li class="page-item">
      		<a class="page-link" href="#">5</a>
    	</li>
    		<li class="page-item">
      		<a class="page-link" href="#">&raquo;</a>
    	</li>
 	 	</ul>
		</div>
		
	
	</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	
	
	</div>	


</body>
</html>