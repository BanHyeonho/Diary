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
	
<body>
	<div class="wrap">
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
	<div class="contents" >
	<h1>만남의 장 글쓰기</h1>

	<table class="table table-striped table-hover table-bordered">
		<tbody>
    	<tr>
 
       		<td>지역</td>
         	<td>
        		<form action="#">
           			<select name="지역">
           				<option value="서울">서울</option>
           				<option value="부산">부산</option>
           				<option value="대전">대전</option>
           				<option value="광주">광주</option>
           			</select>
         		</form>
      		</td>
      		<td>인원</td>
      		<td>
      		<input type="number" placeholder="1" name="attendee">
      		</td>
    	</tr>
    	<tr>
       		<td>성별</td>
         	<td>
            	<input type="radio" name="gender" value="anything" checked> 상관없음
             	<input type="radio" name="gender" value="male"> 남
           		<input type="radio" name="gender" value="female"> 여
      		</td>
      		<td>차량유무</td>
      		<td style="text-align:center;">
      	   		<input type="radio" name="car" value="y"> 있음
           		<input type="radio" name="car" value="n"> 없음
      		</td>
    	</tr>
    	<tr>
       		<td>여행날짜</td>
         	<td colspan="3">
            	<form action="/action_page.php">
            	여행날짜:
          		<input type="text" name="bday">
          		~
           		<input type="text" name="bday">
         		</form>
      		</td>
      	</tr>
      	<tr>
      	
    	</tr>
    	
		</tbody>
		</table>

		<div class="form-group">
      		<label for="exampleTextarea"></label>
      		<textarea class="form-control" id="exampleTextarea" rows="20"></textarea>
    	</div>
    	
    	<button type="button" class="btn btn-primary btn-lg btn-block">글쓰기</button>
		
	
	</div>
		<%@ include file="../layout/nav.jsp"%>
		<%@ include file="../layout/footer.jsp"%>
	</div>
	</div>
	
	


</body>
</html>