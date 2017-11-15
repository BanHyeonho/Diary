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
	
<body items="${list }" var="data" varStatus="d">
	<div class="wrap">
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
	<div class="contents" >
	<h1>만남의 장 글쓰기</h1>

	<form action="/communityinsert.do"  method="post">
	<input type="hidden" name="id" value="${user.id}" />
	<input type="hidden" name="nick" value="${user.nick}" />
	<table class="table table-striped table-hover table-bordered">
		<tbody>
		<tr>
			<td>제목</td>
			
			
			<td colspan="3">
			<input type="text" name="ctitle" size="70">
			</td>
		</tr>
    	<tr> 
       		<td>지역</td>
         	<td>${data.cplace}</td>
      		<td>인원</td>
      		<td>${data.attendee}</td>
    	</tr>
    	<tr>
       		<td>성별</td>
         	<td> ${data.gender}</td>
      		<td>차량유무</td>
      		<td>${data.car }</body></td>
    	</tr>
    	<tr>
       		<td>여행날짜</td>
         	<td colspan="3">	
          		${data.sdate }
          		~
           		${data.edata }
         		
      		</td>
      	</tr>
      	<tr>
      	
    	</tr>
    	
		</tbody>
		</table>

		<div class="form-group">
      		
      		<textarea class="form-control" name="contents" rows="20"></textarea>
      		
    	</div>
    	
    	
	</form>
	
	</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	</div>
	
	


</body>
</html>