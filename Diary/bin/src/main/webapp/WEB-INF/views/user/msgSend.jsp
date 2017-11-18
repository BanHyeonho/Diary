<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MSG</title>


<link href="css/simplex.css" rel="stylesheet" />

</head>
<body>
<c:if test="${result!=null }">
<script type="text/javascript">
alert('보내기 성공');
	self.close();
</script>
</c:if>
<div>

	<h1>쪽지 보내기</h1>
	<form action="/sendmsg.do" method="post" name='f'>
	<table>
		<tr>
		<td><label for="receiver" style="font-size: 20px;">받는 사람</label></td>
		<td><input type="text" class="form-control" name="receiver" value="${data.sender }" readonly="readonly"/></td>
		<input type="hidden" name="receiverid" value="${data.senderid }" />
		<input type="hidden" name="sender" value="${data.receiver }" />
		<input type="hidden" name="senderid" value="${data.receiverid }" />
		<input type="hidden" name="chk" value="1" />
		</tr>
	</table>
	<h2>내용</h2>
	<textarea rows="20" cols="50" class="form-control" name="content"></textarea><br/>
	<center>
	<button type="submit" class="btn btn-success msgbtn btn-lg">전송</button><button type="reset" class="btn btn-warning msgbtn btn-lg">취소</button>
	</center>
	</form>
</div>


</body>
</html>