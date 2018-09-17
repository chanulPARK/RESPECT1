<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set value="${pageContext.request.contextPath}" var="path"/>


<%@ include file="/WEB-INF/views/common/header.jsp" %>

<head>

<title>번개리스트</title>

<link
	href="${path }/resources/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${path }/resources/css/sidebar.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js" type="text/javascript"></script>
<!-- Include English language -->
<script src="${path }/resources/js/i18n/datepicker.en.js" type="text/javascript"></script>

</head>


<section>
	<div class="container">
		<br><br><br><br><br><br><br><br>
		<div id="map-container" style="width: 100%; height: auto;">
			<div id="map" style="width: 100%; height: 300px; min-height: 150px;"></div>
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff31fd960290fc8b23e2c371566d7a6&libraries=services"></script>
		
		<script>
	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            mapOption = {
	                center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	                level: 7 // 지도의 확대 레벨
	            };
	        
	        // 지도를 생성합니다    
	        var map = new daum.maps.Map(mapContainer, mapOption); 
	        
	        // 주소-좌표 변환 객체를 생성합니다
	        var geocoder = new daum.maps.services.Geocoder();
	        
				        
	        <c:forEach items="${list }" var="meet">
	        	
	        	var addr = new Array();
	        	addr.push("${meet.ADDRESS}");
	        	
	        	console.log(addr);
	        	
	        	// 주소로 좌표를 검색합니다
	        	for(var i=0;addr.length>i;i++)
        		{
	        		(function(i){
			        geocoder.addressSearch(addr[i], function(result, status) {
			        
			            // 정상적으로 검색이 완료됐으면 
			             if (status === daum.maps.services.Status.OK) {
			        		
			                var coords = new daum.maps.LatLng(result[i].y, result[i].x);
			        		
			                // 결과값으로 받은 위치를 마커로 표시합니다
			                var marker = new daum.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			        		
			                var no = new Array();
			                no.push("${meet.MEETNO}");
			                
		                	var incontent = '<div style="width:200px;height:100px;text-align:center;padding:6px 0;">${meet.TITLE}<br><br><button class="btn btn-primary" onclick=location.href="${path}/meet/meetView.do?meetNo='+no+'">상세보기</button></div>',
		                	inRemoveable = true;
		                	
			                // 인포윈도우로 장소에 대한 설명을 표시합니다
			                var infowindow = new daum.maps.InfoWindow({
			                    //content: '<div style="width:150px;text-align:center;padding:6px 0;">$(no)</div>'
			                    content : incontent,
			                    removable : inRemoveable
			                });
			                
			                daum.maps.event.addListener(marker, 'click', function(){
			                	infowindow.open(map, marker);
			                })
			                
			                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			                map.setCenter(coords);
			            }
		        	});
	        		})(i);
        		}
	        </c:forEach>
	       	
		</script>
		<br>
		<div id="wrapper">
			<!-- Sidebar -->
			<div id="sidebar-wrapper">
				<!-- <div class="container"> -->
				<ul class="sidebar-nav" style="align: center;">
					<li>
						<div class="sidebar-top" style="text-align: center; line-height: 40px;">
							<h5 style="height: 50px; padding-top: 13px;">
								<strong>필터 설정</strong>
							</h5>
						</div>
						<div style="display: inline-block;">
							<a id="close" href="#" class="sidebar_close" style=""> 
								<i class="fa fa-close" style="font-size: 30px"></i>
							</a>
						</div>
						
						<div style="height: 10%; display: inline-block;padding-left:10px;">
							<br>
							<h5>더 재미있는 제주도 여행을 위해..</h5>
							<div class="justify-content-center" align='center'>							
								<button class="btn btn-block"
									onclick="writeMeet();" style="width: 60%;">글쓰기</button>
							</div>
							<br>
						</div>
						
					</li>
					<li class="sidebar-brand" style="background:#ef8321; text-align:center;padding-top:15px;">
						<h4>
							<strong>나만의 필터</strong>
						</h4>
					</li>
					<li>
						<form action="${path }/meet/searchMeet.do">
							<ul>
								<li>
									<h5>기간</h5>
									<div class="form-group row">
					                	<div class="col-sm-10">
					                		<input type="text" name="daterange"
											    data-range="true"
											    data-multiple-dates-separator=" - "
											    data-language="en"
											    class="datepicker-here form-control"
											    style="width:85%;"/>
					                	</div>
					                </div>
									<br>
								</li>
								<li>지역 
									<input type="text" name="area" class="form-control" 
										placeholder="주소를 입력해주세요." style="width: 70%;"> 
									&nbsp;
									<div class="form-inline">
										<input type="submit" class="btn" style="width: 30%;" value="검색">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" class="btn" style="width: 30%;" value="취소">
									</div>
									<br>
								</li>
							</ul>
							
						</form>
					</li>
				</ul>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container">
				<a href="#menu-toggle" class="btn btn-primary" id="menu-toggle">필터설정</a>
			</div>
			<br>
			<c:forEach items="${list }" var="meet">
				<div class="row" style="margin-left:-45px;">
		            <div class="col-lg-7 col-md-7">
		                <br>
		                <a href="#" onclick="location.href='${path}/meet/meetView.do?meetNo=${meet.MEETNO }'" style="margin-top:10px;">
		                    <img class="img-thumbnail" src="http://placehold.it/500x300" alt="">
		                </a>
		            </div>
		            <div class="col-lg-5 col-md-5" class="justify-content-center" align='center'>
		            	<br>
						제목 : ${meet.TITLE }<br><br>
						위치 : ${meet.ADDRESS }<br /><br /> 
						닉네임 : ${meet.NICKNAME }<br /><br /> 
						성별 : ${meet.GENDER=='M'?'남':'여' }<br /><br />
						나이 : ${meet.AGE } 살<br /><br />
						날짜 : ${meet.MEETDAY }<br /><br />
		                
	                	<button class="btn btn-primary" onclick="location.href='${path}/meet/meetView.do?meetNo=${meet.MEETNO }'">상세보기</button>
		                <br>
		            </div>
	        	</div>
				<hr>
			</c:forEach>
			<br>
			<div id="pagebar">
				${pagebar }
			</div>
			
		</div>
		
	</div>
	
	<!-- /#wrapper -->
	<!-- Menu Toggle Script -->
<script>
	
	$("#menu-toggle").click(function(e) {
	    e.preventDefault();
	    $("#wrapper").toggleClass("toggled");
	});
	$("#close").click(function(e){
	   e.preventDefault();
	   $("#wrapper").toggleClass("toggled");
	});
	// Initialization
	//$('#my-element').datepicker([options]);
	// Access instance of plugin
	$('#my-element').data('datepicker');
	
	function writeMeet()
	{
		if(${userLoggedIn.userId==null}){
			alert("로그인 후 이용 가능합니다.");
			//e.preventDefault();
			location.href="${path}/user/userLogin.do";
			return;
		}else{
			location.href='${path}/meet/meetForm.do';
		}
	}
</script>
	
	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

