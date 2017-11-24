<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<style>


</style>
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
			<td>
			${data.ctitle }
			</td>
			<td>닉네임</td>
			<td>
			${data.nick }
			</td>
		
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
  
		</tbody>
	</table>
	
			<div class="form-group">
      		
      		<textarea class="form-control" name="contents" rows="20" readonly="readonly" style="background-color: #fff;">${data.contents }</textarea>
      		
    		</div>
    	
    		
				<div>
			<table>
				<tr>
					<td>${user.nick } </td>
				</tr>
				<tr>
					<td>
					<input type="text" id="contents" size="150" >
					<button type="button" onclick="ccomment('${user.nick}','${data.idx}');">댓글쓰기</button>
					</td>
				</tr>
				
			</table>
		</div>
			
		<hr>
		
		
		<div>
	
		<table id="ccomment" border="1"   table class="table table-striped table-hover table-bordered">
			<c:forEach items="${list }" var="data1" >
			<tr class='${data1.idx}'>
				<td>${data1.nick} <c:if test="${data1.nick==user.nick}"><span style="float:right"><button type="button" class="btn btn-primary btn-sm" onclick="deleteccomment('${data1.idx}');">댓글 삭제</button></span> </c:if>  </td>
				
			</tr>
			<tr class='${data1.idx}'>
			<td>${data1.contents }<span style="float:right"> <button type="button" onclick="window.open('reportForm.do?id=${user.id }&linkedidx=${data.idx }','신고','width=400,height=500,location=no,status=no,scrollbars=yes');"class="btn btn-primary btn-sm"> 신고</button></span></td>
			</tr>
			
			</c:forEach> 
		</table>
		</div>
	
		<p>
	    <c:if test="${data.nick==user.nick}"><button  style="float:left" margin:5px type="button" class="btn btn-primary btn-sg" onclick="location.href='/deletecommu.do?idx=${data.idx }'" >글삭제</button></c:if>
    	<c:if test="${data.nick==user.nick}">
    	
    	<form action="/updatecommu.do" method="POST">
    	<input type ="hidden" name="idx"value="${data.idx }">
    	<input type ="hidden" name="nick"value="${data.nick }">
    	<input type ="hidden" name="ctitle"value="${data.ctitle }">
    	<input type ="hidden" name="contents"value="${data.contents }">
    	<input type ="hidden" name="sdate"value="${data.sdate }">
    	<input type ="hidden" name="edate"value="${data.edate }">
    	<input type ="hidden" name="chitcount"value="${data.chitcount }">
    	<input type ="hidden" name="cplace"value="${data.cplace }">
    	<input type ="hidden" name="car"value="${data.car }">
    	<input type ="hidden" name="attendee"value="${data.attendee }">
    	<input type ="hidden" name="gender"value="${data.gender }">
    	
    	
    	<button  style="float:right"  type="submit" class="btn btn-primary btn-sg" >글수정</button>
    	
    	</form>
    	
    	</c:if>
  		</p>
	</div>
	</div>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	
	


</body>
</html>