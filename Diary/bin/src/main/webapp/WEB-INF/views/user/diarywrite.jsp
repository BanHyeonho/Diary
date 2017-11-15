<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary&Community</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543b81c594d5dd2c622b96e281dc3022&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* #map{width:300px;height:300px;display: inline-block;}
.oneDiaryDiv{width:48%;float: right; border: 1px solid black;}
.oneDiaryDiv ul{list-style: none;float: left; margin-left: -110px;}
.oneDiary{width:100%;height:600px;border: 1px solid black;float: right;}
.oneDiaryContents{width: 730px;} 옛날꺼 */
</style>
</head>
<body>
<div class="wrap">
		<%@ include file="../layout/header.jsp"%>
		<div class="container">
		<div class="contents" style="position: relative; overflow:hidden; height: 700px;">
		<div class="btn-group" role="group" aria-label="Basic example">
		<input type="text" class="form-control" placeholder="글 제목"/><button class="btn-info btn-sm">스크랩 가져오기</button>
		</div>
		<button type="button" style="float: right;" onclick="change()">샥!</button>
		
		<div class="map_wrap" style="position: absolute;">
		<button type="button" style="position: absolute; z-index: 10;" onclick="hiddenSearch();">V</button>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

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
		
		<div class="writingPlace" style="position: absolute;left: 100%;">
			<input type="file" class="form-control" />
			<textarea rows="30" cols="50" class="form-control" ></textarea>
		</div>
		
		
		
		
		
		
		
		<!-- <div class="oneDiaryContents">한줄내리기 위한 div 옛날꺼 새로엎음
		<div class="btn-group" role="group" aria-label="Basic example">
		<input type="text" id="search" class="form-control"/><input type="button" onclick="searchAction();" id="seachBtn" value="검색" class="btn-primary btn-sm" />
		</div>
		<br/> 
	 	<div id="map">
		</div>
		
		<div class="oneDiaryDiv">
		<ul id="oneDiaryTab">
			<li id="diaryList"><a class="click" href="#" id="oneDiary1">oneDiary1</a></li>
			<li id="plusDiary"><a href="javascript:plusDiary();">+</a></li>
		</ul>
		
		<div  class="oneDiary1 oneDiary">
			<input type='file' /><br/>
			<textarea rows="30" cols="50" class="form-control" ></textarea>
		</div>
		
		
		</div>oneDiaryDiv 
		
		</div>한줄내리기 위한 div  -->
		
		
		</div><!-- contents -->
			
			<%@ include file="../layout/nav.jsp"%>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript" src="script/diarywrite.js"></script>	
</body>
</html>