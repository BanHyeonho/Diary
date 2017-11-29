<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents" style="position: relative;">
		<form action="/writeDiary.do" method="post" name="writingForm" enctype="multipart/form-data">
		<input type="hidden" name="pictureData" />
		<input type="hidden" name="id" value="${user.id }" />
		<input type="hidden" name="nick" value="${user.nick }" />
		<input type="hidden" name="place" />
		<input type="hidden" name="contents" />
		<input type="hidden" name="mapposition" />
		<input type="text"  name="dtitle" placeholder="글 제목"/><button type="button" onclick="scrap_list('${user.id}');">스크랩 가져오기</button>
		
		<label><input type="radio" name="dpublic" value="Y" checked >공개</label><label><input type="radio"  name="dpublic" value="N"  >비공개</label>
		<input type="date" name="sdate" /> ~ <input type="date" name="edate"/> 
		<button type="button" class="btn-outline-warning" style="float: right;" onclick="change();">★</button>
		
		<div class="map_wrap" style="position: relative;">
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
		<ul id="oneDiaryTab" class="nav nav-tabs" >
			
		</ul>
			
		</div>
		<div id="write" style="margin-top: 100px;">
		<center>
		<button type="button" onclick='writing();' class="btn-success btn-lg">글쓰기</button>
		</center>
		</div>
		
		</form>
		
		
		
		
		</div><!-- contents -->
			
		</div>
			<%@ include file="../layout/footer.jsp"%>
	</div>
	<script type="text/javascript" src="script/diarywrite.js"></script>
	<script type="text/javascript" src="script/preview.js"></script>	
</body>
</html>