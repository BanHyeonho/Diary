<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MSG</title>


<link href="css/simplex.css" rel="stylesheet" />

</head>
<body>
<div>

	<h1>쪽지 보내기</h1>
	<form action="#" method="post" name='f'>
	<table>
		<tr>
		<td><label for="receiver" style="font-size: 20px;">받는 사람</label></td>
		<td><input type="text" class="form-control" name="receiver" value="${data.sender }"/></td>
		</tr>
	</table>
	<h2>내용</h2>
	<textarea rows="20" cols="50" class="form-control"></textarea><br/>
	<center>
	<button type="submit" class="btn btn-success msgbtn btn-lg">전송</button><button type="reset" class="btn btn-warning msgbtn btn-lg">취소</button>
	</center>
	</form>
</div>


</body>
</html>