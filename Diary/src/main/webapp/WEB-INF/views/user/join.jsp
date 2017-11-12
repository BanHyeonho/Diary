<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/join.js"></script>
</head>
<body>
<div class="wrap">
<%@ include file="../layout/header.jsp"%>
<div class="container">
<div class="contents">
   <h1>회원가입</h1>
   <form action="/joinAction.do" method="post" name="sform">
      <table class="table table-bordered">
         
         <tr>
            <th class="join">아이디<font color="red">*</font></th>
            <td>
            <div class="btn-group" role="group" aria-label="Basic example">
            <input type="text" class="form-control" name="id"/><button type="button" class="btn-primary" style="margin-left:10px;width: 180px;" id="idchk">아이디중복검사</button>
            </div>
            <div id="idresult"></div>
            </td>
         </tr>
         <tr>
            <th class="join">이름<font color="red">*</font></th>
            <td><input type="text" class="form-control" name="name" /></td>
         </tr>
         <tr>
            <th class="join">비밀번호<font color="red">*</font></th>
            <td><input type="password" class="form-control" name="password" /></td>
         </tr>
         <tr>
            <th class="join">비밀번호확인<font color="red">*</font></th>
            <td><input type="password" class="form-control" name="pwdchk" /></td>
         </tr>
         <tr>
            <th class="join">닉네임<font color="red">*</font></th>
            <td>
            <div class="btn-group" role="group" aria-label="Basic example">
            <input type="text" class="form-control" name="nick"/><button type="button" class="btn-primary" style="margin-left:10px;width: 180px;" id="nickchk">닉네임 중복검사</button>
            </div>
            <div id="nresult"></div>
            </td>
         </tr>
         <tr>
            <th class="join">성별<font color="red">*</font></th>
            <td><input type="radio" name="gender"/>남자<input type="radio" name="gender"/>여자</td>
         </tr>
         <tr>
            <th class="join">생일<font color="red">*</font></th>
            <td><input type="date" class="form-control" name="births"/></td>
         </tr>
         <tr>
            <th class="join">이메일<font color="red">*</font></th>
            <td><input type="text" class="form-control" name="email" /></td>
         </tr>
         <tr>
            <th class="join">연락처</th>
            <td><input type="text" class="form-control" name="phone" /></td>
         </tr>
         <tr>
            <th class="join">주소</th>
            <td><input type="text" class="form-control" name="addr" /></td>
         </tr>
         <tr>
            <th class="join">비밀번호 질문<font color="red">*</font></th>
            <td><select class="form-control" name="pwdq"><option>당신이 태어난곳은?</option></select></td>
         </tr>
         <tr>
            <th class="join">비밀번호 답<font color="red">*</font></th>
            <td><input type="text" class="form-control" name="answers"/></td>
         </tr>
         <tr>
            <th class="join">프로필사진</th>
            <td><input type="file" class="form-control" name="picture"/></td>
         </tr>
      </table>
      <center>
         <button type="submit" class="btn-success btn-lg joinbtn" onclick="return confirm();">확인</button>
         <button type="reset" class="btn-warning btn-lg joinbtn">취소</button>
      </center>
   </form>
   
</div>
<%@ include file="../layout/nav.jsp"%>
      <%@ include file="../layout/footer.jsp"%>
 </div>
</div>
</body>
</html>