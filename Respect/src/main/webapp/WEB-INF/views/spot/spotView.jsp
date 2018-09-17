<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
    .hide {
        display: none;
    }

    .btn-outline-warning.focus, .btn-outline-warning:focus,
    .btn-outline-warning:not(:disabled):not(.disabled).active:focus,
    .btn-outline-warning:not(:disabled):not(.disabled):active:focus,
    .show>.btn-outline-warning.dropdown-toggle:focus {
        box-shadow: none;
    }
</style>

<main class="page landing-page">
    <section id="detail-header" style="padding:0; margin:0 0 50px;">
        <div class="info">
            <h2>${place.title }<br><br></h2>
            <div style="font-size:22px;margin-bottom:5px;">
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
           	</div>
            <p>${place.minorcategory }</p>
            
            <input type="hidden" id="placeno" value="${place.placeno }">
            <input type="hidden" id="title" value="${place.title }">
            <input type="hidden" id="addr" value="${place.address }">
            
            <div class="table-responsive info-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th colspan="2" style="font-size:20px">기본정보</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="font-size:14px;">주소</td>
                            <td style="font-size:14px;">${place.address }<br></td>
                        </tr>
                        <tr>
                            <td style="font-size:14px;">연락처</td>
                            <td style="font-size:14px;">(+82) ${place.phone }<br></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- <div>
                <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button">
                    <i class="fa fa-thumbs-o-up"></i>좋아요</button>
                <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button" style="margin-left:10px;"><i class="fa fa-heart"></i>찜하기</button>
            </div> -->
        </div>
        <div class="mx-auto" style="width: 1902px">
	        <img src="${path }/resources/upload/spot/mainimage/${place.mainimage}" style="width:100%; height:560px;">
	        <%-- <img src="${path }/resources/img/spot/${place.title}.jpg" style="width: 1902px; height:560px;"> --%>
        </div>
        </section>
    <section id="detail-body">
        <div class="container">
            <div class="row" style="text-align:center;">
                <div class="col">
                    <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button" style="border: 0">
                        <i class="fa fa-thumbs-o-up m-0" style="font-size: 50px;"></i>
                    </button>
                    <h5 style="color:rgb(150,150,150);">좋아요</h5>
                    <h5 style="color:#ffb53c;">${place.goodcount }</h5>
                </div>
                <div class="col" style="border-left:1px solid #e5e5e5">
                    <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button" style="border: 0; padding: 8px 12px">
                        <i class="fa fa-heart m-0" style="font-size: 50px;"></i>
                    </button>
                    <h5 style="color:rgb(150,150,150);">찜하기</h5>
                    <h5 style="color:#ffb53c;">${place.bringcount }</h5>
                </div>
                <div class="col" style="border-right: 1px solid #e5e5e5;border-left: 1px solid #e5e5e5;">
                    <i class="fa fa-commenting-o detail-icon" style="padding: 8px 16px"></i>
                    <h5 style="color:rgb(150,150,150);">리뷰</h5>
                    <h5 style="color:#ffb53c;">${place.replycount }</h5>
                </div>
                <div class="col">
                    <i class="fa fa-check detail-icon" style="padding: 8px 16px"></i>
                    <h5 style="color:rgb(150,150,150);">조회수</h5>
                    <h5 style="color:#ffb53c;">${place.hitscount }</h5>
                </div>
            </div>
        </div>
    </section>
    <section id="detail">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_info" class="nav-link active">상세 정보</a></li>
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_map" class="nav-link text-body">지도</a></li>
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_review" class="nav-link text-body">리뷰</a></li>
            </ul>
            
        </div>
    </section>
    <section id="detail_info">
        <div class="detail-content container">
            <h5 style="line-height: 3.5;">${place.content }</h5>
        </div>
    </section>
    <section id="map" class="hide">
        <div class="container">
            <div class="detail-content">
                <div id="map-container" style="width:100%; margin: 0 0 auto;">
                    <div id="map-d" style="width:100%; height:300px;"></div>
                </div>
            </div>
        </div>
    </section>
    <section id="review" class="hide">
        <div class="container">
            <div class="review-area">
                <div class="table-responsive review-form">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="user-photo"><img class="rounded-circle" src="${path }/resources/img/spot/user.jpg" width="100%"></th>
                                <th colspan="3">Column 2</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jia*********<br></td>
                                <td rowspan="2" colspan="2">스쿠터 대여해서 한바퀴 돌고 왔는데 너무 좋았어요 ~<br></td>
                            </tr>
                            <tr>
                                <td><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <button class="btn btn-warning btn-block" type="button" onclick="fn_spotUpdatego()">장소 수정</button>
</main>

<script>
	function fn_spotUpdatego() {
		location.href="${pageContext.request.contextPath}/spot/spotUpdate.do";
	}
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff31fd960290fc8b23e2c371566d7a6&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map-d'), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    // 지도를 생성합니다    
    var map = new daum.maps.Map(mapContainer, mapOption); 
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
    
    var addr = $("input[id=addr]").val();
    
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(addr , function(result, status) {
    
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
                content: '<div style="width:150px;text-align:center;">${place.title }</div>'
            });
            infowindow.open(map, marker);
            
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });
</script>

<script>
    $(document).ready(function(){
        $('#btn_info').click(function(){
            var state = $('#detail_info').css('display');
            if(state == 'none'){
                $('#detail_info').show();
                $('#map').hide();
                $('#review').hide();
                
                $('#btn_info').addClass('active');                
                $('#btn_map').removeClass('active');
                $('#btn_review').removeClass('active');
            }
        });

        $('#btn_map').click(function(){
            var state = $('#map').css('display');
            if(state == 'none'){
                $('#detail_info').hide();
                $('#map').show();
                $('#review').hide();
                
                $('#btn_info').removeClass('active');                
                $('#btn_map').addClass('active');
                $('#btn_review').removeClass('active');
            }
        });

        $('#btn_review').click(function(){
            var state = $('#review').css('display');
            if(state == 'none'){
                $('#detail_info').hide();
                $('#map').hide();
                $('#review').show();
                
                $('#btn_info').removeClass('active');                
                $('#btn_map').removeClass('active');
                $('#btn_review').addClass('active');
            }
        });
    });
</script>
<script type="text/javascript">
	function fn_like() {
		var placeNo = $("#placeno").val();
		
		$.ajax({
			url: "${path }/spot/like.do",
			type: "GET",
			datetype: "json",
			data: "placeno="+placeNO,
			success: function(data) {
				var msg = "좋아요하였습니다.";
			}
		})
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>