var infowindow = null;
var mapContainer = null;
var mapOption = null;
var map = null;
var place = null;
var ps = null;
var savePlaces = [];
var placeCount = 0;

window.onload = function() {
	createMap();
}
function createMap() {
	infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 15
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다
	map = new daum.maps.Map(mapContainer, mapOption);
	
	for (var i = 0; i < savePlaces.length; i++) {
		
		displayMarker(savePlaces[i]);
	}

}

function searchAction() {
	createMap();
	place = document.getElementById('search').value;
	// 장소 검색 객체를 생성합니다
	ps = new daum.maps.services.Places();

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(place, placesSearchCB);
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	if (status === daum.maps.services.Status.OK) {

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		var bounds = new daum.maps.LatLngBounds();

		for (var i = 0; i < data.length; i++) {
			displayMarker(data[i]);
			bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		}

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}
}

// 지도에 마커를 표시하는 함수입니다

function displayMarker(place) {

	// 마커를 생성하고 지도에 표시합니다
	var marker = new daum.maps.Marker({
		map : map,
		position : new daum.maps.LatLng(place.y, place.x)
	});

	// 마커에 클릭이벤트를 등록합니다
	daum.maps.event.addListener(marker, 'mouseover', function() {
		// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		infowindow.setContent('<div style="padding:5px;font-size:12px;">'
				+ place.place_name + '</div>');
		infowindow.open(map, marker);

	});// 이벤트
	daum.maps.event.addListener(marker, 'mouseout', function() {
		infowindow.close();
	});

	daum.maps.event.addListener(marker, 'click', function() {
		var text = place.place_name + '을(를) 추가하시겠습니까?';
		for (var i = 0; i < savePlaces.length; i++) {
			if(place.place_name==savePlaces[i].place_name){
				text = place.place_name + '을(를) 삭제하시겠습니까?';
			}	
		}
		if (confirm(text)) {
			// console.log(place.y, place.x);
			if(text==place.place_name + '을(를) 삭제하시겠습니까?'){//북마크 삭제
				for (var i = 0; i < savePlaces.length; i++) {
					if (savePlaces[i].place_name == place.place_name) {
						alert('삭제되었습니다.');
						deleteTab(place.place_name);
						for (var j = i; j < savePlaces.length; j++) {
							
							if(j+1>=savePlaces.length){
								savePlaces.length = j;
								
								placeCount--;
								break;
							}
							savePlaces[j] = savePlaces[j + 1];

						}
						
						marker.setMap(null);
						infowindow.close();
						
						break;
					}
				}
			}else{//추가
				savePlaces[placeCount] = place;
				placeCount++;
				createMap();
				plusTab(place.place_name);
			}
			
		} else {
			alert('취소되었습니다.');
			

		}
	});

}

var count = 2;
function plusTab(name) {
	$('#oneDiaryTab').append('<li><a class="click" href="#" id="' +name+'">'+name+'</a></li>');
}
function deleteTab(name){
	$('#'+name).remove();
}
$(document).ready(function() { // 탭 이동
	$('.click').click(function() {
		$('.oneDiary').css('display', 'none');
		var id = $(this).attr('id');
		$('.' + id).css('display', '');
	});
});