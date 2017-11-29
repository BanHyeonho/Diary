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
<div id="roof"></div>
	<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
	<div class="container">
	<div class="contents" >
	<form action="/csearch.do" method="post">
	<h1>만남의 장</h1>
	<table class="table table-striped table-hover table-bordered">
	
		<tbody>
    	<tr>
       		<td>지역</td>
         	<td>
        		
           			<select name="cplace">
           				<option>지역</option>
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
             	<input type="radio" name="gender" value="M"> 남
           		<input type="radio" name="gender" value="W"> 여
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
          			<select name="ctitle">
          			<option>전체</option>
           			<option value="ctitle">제목</option>
           			<option value="contents">내용</option>
           			<option value="nick">닉네임</option>
           			</select>
          
           			<input type="text" placeholder="검색어 입력" name="contents" size="60">
           			<button type="submit">검색</button>
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
      		<th>차량</th>
      		<th>조회수</th>
      		
    	</tr>
  		</thead>
  		<tbody>
  		<c:forEach items="${list }" var="data" varStatus="d">
    		<tr border>
      			<td>${d.count}</td>
      			<td>${data.nick}</td>
      			<td>
      			<a href="/onecommunity.do?id=${user.id }&linkedidx=${data.idx }">${data.ctitle}</a>
      			</td>
      			<td>${data.cplace}</td>
      			<td>${data.attendee}</td>
      			<td>${data.sdate} ~ ${data.edate}</td>
      			<td>
      			<input type="checkbox" name="chk_info" disabled=true <c:if test="${data.car=='Y'}">checked</c:if> value="car">
      			
      			</td>
      			<td>${data.chitcount}</td>
      			
    		</tr>
    	</c:forEach>
 		</tbody>
 	</table>
 		
 		

		</div>
		<%@ include file="../layout/nav.jsp"%>
	</div>
		<%@ include file="../layout/footer.jsp"%>

</body>
</html>