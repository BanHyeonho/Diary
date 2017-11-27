<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>

<link href="css/simplex.css" rel="stylesheet" />
<link rel="stylesheet" href="css/layout.css">
</head>
<script type="text/javascript" src="script/onecommunity.js"></script>
<body style="padding-top: 50px;">
	<div class="wrap">
	<div class="container">
	<div class="contents" >
	<h1 style="margin-left:390px;">커뮤니티</h1>

	<table class="table table-striped table-hover table-bordered">
		<tbody>
		<tr>
			<td>제목</td>
			<td colspan="3">
			${viewCommunity.ctitle }
			</td>
		</tr>
    	<tr> 
       		<td>지역</td>
         	<td>${viewCommunity.cplace}</td>
      		<td>인원</td>
      		<td>${viewCommunity.attendee}</td>
    	</tr>
    	<tr>
       		<td>성별</td>
         	<td>${viewCommunity.gender}</td>
      		<td>차량유무</td>
      		<td>${viewCommunity.car }</body></td>
    	</tr>
    	<tr>
       		<td>여행날짜</td>
         	<td colspan="3">	
          		${viewCommunity.sdate }
          		~
           		${viewCommunity.edate }
         		
      		</td>
      	</tr>
      	<tr>
      	
    	</tr>
    	
		</tbody>
</table>

			<div class="form-group">
      		
      		<textarea class="form-control" name="contents" rows="20" readonly="readonly" style="background-color: #fff;">${viewCommunity.contents }</textarea>
      		
    		</div>
    	
    		
				<div>
			<table>
				<tr>
					<td>${user.nick }</td>
				</tr>
			</table>
		</div>
			
		<hr>
		
		<div>
		<c:forEach items="${list }" var="data1" >
			<table>
			<tr>
				<td>${data1.nick}</td>
			</tr>
			<hr>
			<tr>
				<td>${data1.contents }</td>
			</tr>
			</table>
		</c:forEach>
		</div>
	
	
	
	</div>
		
	</div>
	</div>
	
	
</body>
</html>