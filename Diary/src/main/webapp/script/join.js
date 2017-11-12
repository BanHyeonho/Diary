$(document).ready(function(){
   $('#idchk').click(function(){
      if(document.sform.id.value==""){
         alert("아이디를 입력하세요");
         document.sform.id.focus();
         return false;
      }else{
         var id= document.sform.id.value;
         var data = {
               'id':id
         };
         var setting={
               url:'/idchk.do',
               data: data,
               dataType:'json',
               success:function(data){
                  $('#idresult').html("<font color='red'>"+data.result+"</font>");
                  
               },
               error: function(){
                  alert("error");
               }
               };
         $.ajax(setting);
         }
      });
   
   $('#nickchk').click(function(){
      if(document.sform.nick.value==""){
         alert("닉네임을 입력하세요");
         document.sform.nick.focus();
         return false;
      }else{
         var nick= document.sform.nick.value;
         var data = {
               'nick':nick
         };
         var setting={
               url:'/nickchk.do',
               data: data,
               dataType:'json',
               success:function(data){
                  $('#nresult').html("<font color='red'>"+data.result+"</font>");
                  
               },
               error: function(){
                  alert("error");
               }
               };
         $.ajax(setting);
         }
      });
         
   });

function confirm(){
   if(document.sform.id.value==""){
      alert("아이디를 입력하세요");
      document.sform.id.focus();
      return false;
   }else if(document.sform.name.value==""){
      alert("이름을 입력하세요");
      document.sform.name.focus();
      return false;
   }else if(document.sform.password.value==""){
      alert("비밀번호를 입력하세요");
      document.sform.password.focus();
      return false;
   }else if(document.sform.pwdchk.value==""){
      alert("비밀번호를 확인하세요");
      document.sform.pwdchk.focus();
      return false;
   }else if(document.sform.nick.value==""){
      alert("닉네임을 확인하세요");
      document.sform.nick.focus();
      return false;
   }else if(document.sform.gender.value==""){
      alert("성별을 체크하세요");
      document.sform.gender.focus();
      return false;
   }else if(document.sform.email.value==""){
      alert("이메일을 입력하세요");
      document.sform.email.focus();
      return false;
   }else if(document.sform.phone.value==""){
      alert("핸드폰번호를 입력하세요");
      document.sform.phone.focus();
      return false;
   }else if(document.sform.answer.value==""){
      alert("질문에 답을 써주세요");
      document.sform.answer.focus();
      return false;
   }else{
      return true;
   }
      
}