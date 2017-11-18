var map=null;
function createMap(mapposition){
	console.log(mapposition);
	var mappositions = mapposition.split('/');
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };

map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points = [];

for (var i = 0; i < mappositions.length; i++) {
	var position = mappositions[i].split(',');
	points.push(new daum.maps.LatLng(position[0],position[1]));
}
// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds();    

var i, marker;
for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker = new daum.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(points[i]);
}
setBounds(bounds);
}

function setBounds(bounds) {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
function change(){// 탭 이동
	if($('#map').css('left')=="0px"){
		$('#map').animate({
			left:"-100%"
		},100);
		$('.writingPlace').animate({
			left:"207px"
		},100);
	}else{
		$('#map').animate({
			left:"0"
		},100);
		$('.writingPlace').animate({
			left:"100%"
		},100);
	}
	
}
$('.click').click(function() {
	$('.oneDiary').css('display', 'none');
	var id = $(this).parent().attr('id');
	$('.' + id).css('display', '');
	$('.click').css('background','white');
	$(this).css('background','lightgray');
});
function add(){
	$('#add').toggle(100);
}
function comment(nick,idx){
	var text = $('#comment').val();
	var data = {
			"nick" : nick,
			"linkedidx" : idx,
			"contents" : text
	};
	var setting = {
			"url" : "/writeDComment.do",
			"type" : "post",
			"dataType" : "json",
			"data" : data,
			"success" : function(data){
				$('#comment').val('');
				alert('성공');
			},
			"error" : function(){}
	};
	
	$.ajax(setting);
}
function scrap(idx,id){
	
	if($('#scrap').text().trim()=="스크랩하기"){
		if(confirm('스크랩 하시겠습니까?')){
			
			var data = {
					"id":id,
					"linkedidx":idx
			};
			
			var setting={
					"url" : "/insertScrap.do",
					"dataType" : "json",
					"data":data,
					"type":"get",
					"success":function(){
						$('#scrap').text('스크랩취소');
					},
					"error":function(){}
			};
			
			
			$.ajax(setting);
		}
	}else{
		if(confirm('스크랩취소 하시겠습니까?')){
			
//			var data = {
//					"id":id,
//					"linkedidx":idx
//			};
//			
//			var setting={
//					"url" : "/insertScrap.do",
//					"dataType" : "json",
//					"data":data,
//					"type":"get",
//					"success":function(){
//						$('#scrap').text('스크랩하기');
//					},
//					"error":function(){}
//			};
//			
//			
//			$.ajax(setting);
//			
//			
			
		}
	}
	
}
function follow(followingId,following,followersId,followers){
	console.log(followingId,following,followersId,followers);
	
	if($('#follow').text()=="팔로우하기"){
		if(confirm(following+"님을 팔로우 하시겠습니까?")){
			var data = {
					"followingId":followingId,
					"following":following,
					"followersId":followersId,
					"followers":followers
			};
			
			var setting={
					"url" : "/addFollow.do",
					"dataType" : "json",
					"data":data,
					"type":"get",
					"success":function(){
						alert('팔로우 되었습니다.');
						$('#follow').text('팔로우 취소하기');
					},
					"error":function(){}
			};
			
			
			$.ajax(setting);
		}
	}else{	//팔로우 취소
		
	}
	
	
	
}



