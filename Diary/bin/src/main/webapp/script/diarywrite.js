
// 마커를 담을 배열입니다
var markers = [];
var savePlaces =[];
var saveMark=[];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});



// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
    	
    	
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);
    
        var marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, place.place_name);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            daum.maps.event.addListener(marker, 'click', function() {
            	saveMarker(place);
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, place.place_name);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            itemEl.onclick =  function () {
            	saveMarker(place);
            };
        })(marker, places[i]);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}



// 장소를 저장합니다.
function saveMarker(place){
	var text = place.place_name + '을(를) 추가하시겠습니까?';
	for (var i = 0; i < savePlaces.length; i++) {
		if(place.place_name==savePlaces[i].place_name){
			text = place.place_name + '을(를) 삭제하시겠습니까?';
		}	
	}
	if (confirm(text)) {
	
		if(text==place.place_name + '을(를) 삭제하시겠습니까?'){//북마크 삭제
			a:for (var i = 0; i < savePlaces.length; i++) {
				if (savePlaces[i].place_name == place.place_name) {
					alert('삭제되었습니다.');
					infowindow.close();
					deleteTab(place.place_name);
					saveMark[i].setMap(null);
					for (var j = i; j < savePlaces.length; j++) {
						
						if(j+1==savePlaces.length){
							savePlaces.length = j;
							saveMark.length = j;
							break a;
						}
						savePlaces[j] = savePlaces[j + 1];
						saveMark[j] = saveMark[j + 1];
					}
				}
			}
		}else{//추가
			
			savePlaces.push(place);
			createTab(place.place_name);
			removeMarker();
			map = new daum.maps.Map(mapContainer, mapOption);
			removeAllChildNods(document.getElementById('placesList'));
			removeAllChildNods(document.getElementById('pagination'));
			saveMark=[];
			for (var i = 0; i < savePlaces.length; i++) {
				makeSaveMark(savePlaces[i]);
			}
			
			
		}
		
	} else {
		alert('취소되었습니다.');
		
	}
	
	
	
}

//저장된 마크를 생성합니다.
function makeSaveMark(savePlace){
	
		var marker = new daum.maps.Marker({
			map : map,
			position : new daum.maps.LatLng(savePlace.y, savePlace.x)
		});

		daum.maps.event.addListener(marker, 'mouseover', function() {
			displayInfowindow(marker, savePlace.place_name);
        });
		daum.maps.event.addListener(marker, 'mouseout', function() {
			infowindow.close();
        });
		daum.maps.event.addListener(marker, 'click', function() {
			saveMarker(savePlace);
        });
		saveMark.push(marker);
}








// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}






function hiddenSearch(){
	$('#menu_wrap').toggle(100);
}

function change(){// 탭 이동
	if($('.map_wrap').css('left')=="0px"){
		$('.map_wrap').animate({
			left:"-100%"
		},100);
		$('.writingPlace').animate({
			left:"207px"
		},100);
	}else{
		$('.map_wrap').animate({
			left:"0"
		},100);
		$('.writingPlace').animate({
			left:"100%"
		},100);
	}
	
}
function createTab(title){
	$('.oneDiary').css('display', 'none');
	$('.click').css('background','white');
	$('#oneDiaryTab').append('<li id="'+title+'"class="nav-item" ><a class="nav-link click" data-toggle="tab" href="#" style="width:150px;background:lightgray;" >'+title+'</a></li>')
	.append('<input type="hidden" class="places" id="place'+title+'" value="'+title+'"/>' );
	$('.writingPlace').append('<div class="'+title+' oneDiary"><input type="file" class="form-control" /><textarea rows="25" cols="100" class="form-control textArea" ></textarea></div>');
	$('.' + title).css('display', '');
	
	$('.click').click(function() {
		$('.oneDiary').css('display', 'none');
		var id = $(this).parent().attr('id');
		$('.' + id).css('display', '');
		$('.click').css('background','white');
		$(this).css('background','lightgray');
	});
}
function deleteTab(title){
	$('#'+title).remove();
	$('.'+title).remove();
	$('#place'+title).remove();
}

function writing(){
	
	var place ="";
	var content="";
	var mappositions="";
	for (var i = 0; i < $('.places').length; i++) {	//여행지 갯수만큼 반복
		place=place+$('.places')[i].value+"/";
	}
	document.writingForm.place.value=place.substr(0,place.length-1);
	//여행지 값 구하기 완료
	
	for (var i = 0; i < $('.textArea').length; i++) {	//여행지설명 갯수만큼 반복
		content=content+$('.textArea')[i].value+"/";
	}
	
	document.writingForm.contents.value=content.substr(0,content.length-1);
	
	for (var i = 0; i < savePlaces.length; i++) {
		mappositions=mappositions+savePlaces[i].y+","+savePlaces[i].x+"/"
	}
	
	document.writingForm.mapposition.value=mappositions.substr(0,mappositions.length-1);
	var con = document.writingForm.contents.value.replace(/\//g,'');
	
	if(document.writingForm.dtitle.value==''){
		alert('글제목을 입력하세요.');
		document.writingForm.dtitle.focus();
		return false;
	}else if(document.writingForm.sdate.value==''){
		alert('여행 시작일을 입력하세요.');
		document.writingForm.sdate.focus();
		return false;
	}else if(document.writingForm.edate.value==''){
		alert('여행 마지막일을 입력하세요.');
		document.writingForm.edate.focus();
		return false;
	}else if(document.writingForm.place.value==''){
		alert('여행지를 입력하세요.');
		document.getElementById('keyword').focus();
		return false;
	}else if(con==''){
		alert('여행지에 대한 설명을 입력하세요.');
		change();
		return false;
	}else{
		document.writingForm.submit();
	}
	
}


