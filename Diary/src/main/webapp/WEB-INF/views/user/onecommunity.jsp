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
<script type="text/javascript" src="script/onecommunity.js"></script>
<body>
	<div class="wrap">
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
	<div class="contents" >
	<h1>만남의 장</h1>

	<table class="table table-striped table-hover table-bordered">
		<tbody>
		<tr>
			<td>제목</td>
			<td colspan="3">
			${data.ctitle }
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
           		${data.edate }
         		
      		</td>
      	</tr>
      	<tr>
      	
    	</tr>
    	
		</tbody>
</table>

			<div class="form-group">
      		
      		<textarea class="form-control" name="contents" rows="20" readonly="readonly" style="background-color: #fff;">${data.contents }</textarea>
      		
    		</div>
    	
    		
				<div>
			<table>
				<tr>
					<td>${user.nick }</td>
				</tr>
				<tr>
					<td>
					<input type="text" id="contents" size="90" >
					<button type="button" onclick="ccomment('${user.nick}','${data.idx}');">댓글쓰기</button>
					</td>
				</tr>
				
			</table>
		</div>
			
		<hr>
		
		<div>
		
		<table id="ccomment">
			<c:forEach items="${list }" var="data1" >
			<tr>
				<td>${data1.nick}</td>
			</tr>
			<tr>
				<td>${data1.contents }</td>
			</tr>
			</c:forEach> 
		</table>
		
		</div>
	
	
	
	</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	</div>
	
	


</body>
</html>