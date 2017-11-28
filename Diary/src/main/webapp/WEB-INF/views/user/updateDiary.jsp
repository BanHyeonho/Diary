<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="www.dto.DiaryVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="script/preview.js"></script>
</head>
<body>
<%
		DiaryVo vo =(DiaryVo)request.getAttribute("Diary");
		
		String[] place = vo.getPlace().split("/");
		String[] content = vo.getContents().split("/");
		String[] picture = vo.getDpicture().split("/");
		System.out.println("잘오나 : "+vo.toString());
%>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents" style="position: relative; overflow-x:hidden; height: 700px;">

		<form action="/updateDiaryAction.do" method="post" name="updateForm" enctype="multipart/form-data">
		<h2 style="display: inline;">${Diary.dtitle }</h2>
		<input type="hidden" name="idx" value="${Diary.idx }" />
		<input type="hidden" name="id" value="${user.id }" />
		<input type="hidden" name="place" />
		<input type="hidden" name="mapposition" />
		<input type="hidden" name="contents"/>
		<input type="date" name="sdate" value="${Diary.sdate }"/> ~ <input type="date" name="edate" value="${Diary.edate }"/>
		<button type="button" onclick="scrap_list('${user.id}');" >스크랩글 가져오기</button>
		<label><input type="radio" name="dpublic" value="Y" <c:if test="${Diary.dpublic=='Y' }">checked</c:if> />공개</label><label><input type="radio" name="dpublic" value="N" <c:if test="${Diary.dpublic=='N' }">checked</c:if> />비공개</label>
		
		<button type="button" class="btn-outline-warning" style="float: right;" onclick="change();">★</button>
		<span style="float: right;">글쓴이 : ${user.nick }</span>
		

    
<div class="map_wrap" >
		<button type="button" class="btn-outline-info" style="position: absolute; z-index: 10;" onclick="hiddenSearch();">&nbsp;</button>
    <div id="map"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                    키워드 : <input type="text" id="keyword" size="15"> 
               <button type="button" onclick="searchPlaces();">검색하기</button> 
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
 
		
		<div class="writingPlace" style="top:4%;">
		<ul id="oneDiaryTab" class="nav nav-tabs" style="position: absolute;display: table-row;right: 100%;">
		<li id="<%=place[0]%>"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;background:lightgray;" ><%=place[0]%></a></li>
		<c:forTokens items="${Diary.place}" delims="/" var="place" begin="1">
			<li id="${place}"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;" >${place}</a></li>
		</c:forTokens>
		</ul>
		<%int i=0;
		int k=0;
		int ct=0;%>
		<div class="<%=place[0]%> oneDiary">
		<table>
		<%for(int j = 0;j<content[k].split("&").length;j++){%>
		<tr class="${place}tr<%=ct%>">
		<td><img class="${place}holder<%=ct%>" src="/upload/<%=picture[i++] %>" alt="사진"><div id="${place}holder<%=ct%>"></div></td>
		<td rowspan="2"><textarea rows="10" cols="60" class="form-control textArea" ><%=content[k].split("&")[j] %></textarea></td>
		<%if(j!=0){ %>
		<td><button type="button" onclick="removetable('${place}tr<%=ct%>');">X</button></td>
		<%} %>
		</tr>
		<tr class="${place}tr<%=ct%>">
			<td><input type="file" name="${place}picture<%=ct%>" id="${place}picture<%=ct%>" class="form-control" /></td>
		</tr>
		<%if(j==content[k].split("&").length-1){ %>
		<tr id="${place}plus"><td colspan="2"><center><button type="button" onclick="addtable('${place}',<%=ct%>);">추가하기</button></center></td></tr>
		<%}%>
	<script type="text/javascript">
	addpicture('${place}picture<%=ct%>','${place}holder<%=ct%>');
	</script>
		
	<%	ct++;} %>
		</table>
		</div>
		 <%k++; %>
		 
		 
		 <c:forTokens items="${Diary.place}" delims="/" var="place" begin="1">
			<div class="${place} oneDiary" style="display: none;">
			<table>
			<%for(int j = 0;j<content[k].split("&").length;j++){ %>
			<tr class="${place}tr<%=ct%>">
				<td><img class="${place}holder<%=ct%>" src="/upload/<%=picture[i++] %>" alt="사진"><div id="${place}holder<%=ct%>"></div></td>
				<td rowspan="2"><textarea rows="10" cols="60" class="form-control textArea" ><%=content[k].split("&")[j] %></textarea></td>
				<%if(j!=0){ %>
				<td><button type="button" onclick="removetable('${place}tr<%=ct%>');">X</button></td>
				<%} %>
			</tr>
			<tr class="${place}tr<%=ct%>">
			<td><input type="file" name="${place}picture<%=ct%>" id="${place}picture<%=ct%>" class="form-control" /></td>
			</tr>
			<%if(j==content[k].split("&").length-1){ %>
			<tr id="${place}plus"><td colspan="2"><center><button type="button" onclick="addtable('${place}',<%=ct%>);">추가하기</button></center></td></tr>
			<%}%>
			<script type="text/javascript">
			addpicture('${place}picture<%=ct%>','${place}holder<%=ct%>');
			</script>
			
			<%ct++;}
			k++; %>
			</table>
			</div>
		</c:forTokens> 
		</div>
		
		<div style="margin-top: 50%;">
		<center><button class="btn-success btn-lg" type="button" onclick="update();">수정하기</button></center>
		</div>
		</form>
		</div>
	</div>
			<%@ include file="../layout/footer.jsp"%>
	</div>
	<script type="text/javascript" src="script/mypage.js"></script>
	
	<script type="text/javascript" src="script/updateDiary.js"></script>	
	<script type="text/javascript">
	setting('${Diary.mapposition}','${Diary.place}');
	</script>
</body>
</html>