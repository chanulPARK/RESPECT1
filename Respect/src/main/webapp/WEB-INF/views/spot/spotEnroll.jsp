<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
    .custom-file-input {
        min-width: 14rem;
        max-width: 100%;
        height: calc(2.25rem + 2px);
        margin: 0;
        opacity: 0;
    }
    .custom-file-control {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    z-index: 5;
    height: calc(2.25rem + 2px);
    padding: 0.375rem 0.75rem;
    line-height: 1.5;
    color: #495057;
    pointer-events: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    }

    select option {    
        padding: 50px;
    }

</style>

<main class="page landing-page">
        <section class="clean-block slider dark" style="padding:0;margin:185px 0 100px;"><img src="${path }/resources/img/spot/성산일출봉.gif" style="width:1905x;"></section>
        <section>
            <div class="container">
                <h2>명소 등록</h2>
                <div class="form-group">
                	<form action="${pageContext.request.contextPath}/spot/spotEnrollEnd.do" method="post" enctype="multipart/form-data">
                		<input type="hidden" name="userid" value="admin">
                		<!-- <input type="hidden" name="placeno" value="1">
                		<input type="hidden" name="gpa" value="0">
                		<input type="hidden" name="goodcount" value="0">
                		<input type="hidden" name="bringcount" value="0">
                		<input type="hidden" name="replycount" value="0">
                		<input type="hidden" name="hitscount" value="0"> -->
                		
                		<!-- <div id="map" style="width:100%;height:350px;"></div> -->
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">명소이름</label></div>
	                        <div class="col">
	                            <input class="form-control" type="text" name="title" required>
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">구분</label></div>
	                        <div class="col-xl-4 input-group">
	                            <input class="form-control" type="radio" value="관광지" name="majorcategory" style="margin-top:12px;" checked><label class="col-form-label">관광지</label>
	                            <input class="form-control" type="radio" value="숙소" name="majorcategory" style="margin-top:12px;"><label class="col-form-label">숙소</label>
	                            <input class="form-control" type="radio" value="음식점" name="majorcategory" style="margin-top:12px;"><label class="col-form-label">음식점</label>
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">카테고리</label></div>
	                        <div class="col">
                                <select class="form-control" name="minorcategory" required>
                                    <option selected>카테고리를 선택하세요</option>
                                    <option value="자연">자연</option>
                                    <option value="문화관광">문화관광</option>
                                    <option value="레저/체험">레저/체험</option>
                                    <option value="테마관광지">테마관광지</option>
                                    <option value="섬속의섬">섬속의 섬</option>
                                    <option value="도보">도보</option>
                                    <option value="포토스팟">포토스팟</option>
                                    <option value="70주년">4.3 70주년</option>
                                    <option value="템플스테이">템플스테이</option>
                                </select>
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">주소/위치</label></div>
	                        <div class="col">
                                <div class="input-group">
                                    <!-- <input class="form-control" type="text" name="sample5_address" placeholder="주소" required>
                                    <div class="input-group-append"><button class="btn btn-outline-warning" type="button" onclick="go_map()">검색</button></div>
                                    <div class="input-group-append">
                                    	<input class="btn btn-outline-warning" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
                                   	</div>
									<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div> -->
									<input type="text" class="form-control" id="sample5_address" name="address" placeholder="주소" required readonly>
									<input type="button" class="btn btn-outline-warning" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                                </div>
									<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>

                                <!-- <div id="postcodify"></div>
                                <input type="text" name="" id="address" value=""> -->
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">지역</label></div>
	                        <div class="col">
                                <select class="form-control" name="area" required>
                                    <option selected>지역을 선택하세요</option>
                                    <optgroup label="제주시">
                                    <option value="제주시내">제주시내</option>
                                    <option value="조천읍">조천읍</option>
                                    <option value="구좌읍">구좌읍</option>
                                    <option value="애월읍">애월읍</option>
                                    <option value="한림읍">한림읍</option>
                                    <option value="한경면">한경면</option>
                                    </optgroup>
                                    <optgroup label="서귀포시">
                                    <option value="서귀포시내">서귀포시내</option>
                                    <option value="남원읍">남원읍</option>
                                    <option value="표선읍">표선읍</option>
                                    <option value="성산읍">성산읍</option>
                                    <option value="중문">중문</option>
                                    <option value="안덕면">안덕면</option>
                                    <option value="대정읍">대정읍</option>
                                    </optgroup>
                                    <optgroup label="섬속의 섬">
                                    <option value="추자도">추자도</option>
                                    <option value="우도">우도</option>
                                    <option value="차귀도">차귀도</option>
                                    <option value="가파도">가파도</option>
                                    <option value="마라도">마라도</option>
                                    <option value="비양도">비양도</option>
                                    </optgroup>
                                </select>
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">연락처</label></div>
	                        <div class="col">
	                            <input class="form-control" type="text" id="cellPhone" name="phone" placeholder="-없이 입력하세요">
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">홈페이지</label></div>
	                        <div class="col">
	                            <input class="form-control" type="text" name="">
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">대표이미지</label></div>
	                        <div class="col">
	                            <label class="custom-file">
	                                <input type="file" name="thumbnail" class="custom-file-input" accept="image/*">
	                                <span class="custom-file-control" id="file-name">이미지를 선택하세요</span>
	                            </label>
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col-xl-2"><label class="col-form-label">내용</label></div>
	                        <div class="col">
	                        </div>
	                    </div>
	                    <div class="row m-1">
	                        <div class="col">
	                            <div class="form-group">
	                                <textarea class="form-control" name="content" style="min-height:500px;"></textarea>
	                            </div>
	                            <input type="submit" class="btn btn-warning btn-block" value="등록">
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
        </section>
    </main>

<script type="text/javascript">
	$("input[name=thumbnail]").change(function(){
	    var file = $(this).val().split('/').pop().split('\\').pop();
	    $("#file-name").text(file);
	});
</script>
<script type="text/javascript">
	function autoHypenPhone(str){
	    str = str.replace(/[^0-9]/g, '');
	    var tmp = '';
	    if( str.length < 4){
	        return str;
	    }else if(str.length < 7){
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3);
	        return tmp;
	    }else if(str.length < 11){
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3, 3);
	        tmp += '-';
	        tmp += str.substr(6);
	        return tmp;
	    }else{              
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3, 4);
	        tmp += '-';
	        tmp += str.substr(7);
	        return tmp;
	    }
	    return str;
	}
	
	var cellPhone = document.getElementById('cellPhone');
	cellPhone.onkeyup = function(event){
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val) ;
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff31fd960290fc8b23e2c371566d7a6&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff31fd960290fc8b23e2c371566d7a6&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	function go_map() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
	
		var addr = $("input[name=address]").val();
		
		geocoder.addressSearch(addr, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("input[name=title]").val()+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}
</script> -->
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>