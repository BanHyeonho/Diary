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
         	<td>
           			<select name="cplace">
           				<option value="서울">서울</option>
           				<option value="부산">부산</option>
           				<option value="대전">대전</option>
           				<option value="광주">광주</option>
           			</select>
         		
      		</td>
      		<td>인원</td>
      		<td>
      		<input type="number" name="attendee">
      		</td>
    	</tr>
    	<tr>
       		<td>성별</td>
         	<td>
            	<input type="radio" name="gender" value="A" checked> 상관없음
             	<input type="radio" name="gender" value="M"> 남
           		<input type="radio" name="gender" value="W"> 여
      		</td>
      		<td>차량유무</td>
      		<td style="text-align:center;">
      	   		<input type="radio" name="car" value="Y" > 있음
           		<input type="radio" name="car" value="N" checked> 없음
      		</td>
    	</tr>
    	<tr>
       		<td>여행날짜</td>
         	<td colspan="3">	
          		<input type="date" name="sdate">
          		~
           		<input type="date" name="edate">
         		
      		</td>
      	</tr>
      	<tr>
      	
    	</tr>
    	
		</tbody>
		</table>

		<div class="form-group">
      		
      		<textarea class="form-control" name="contents" rows="20"></textarea>
      		
    	</div>
    	
    	<button type="submit" class="btn btn-primary btn-lg btn-block">글쓰기</button>
	</form>
	
	</div>
	</div>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	
	


</body>
</html>