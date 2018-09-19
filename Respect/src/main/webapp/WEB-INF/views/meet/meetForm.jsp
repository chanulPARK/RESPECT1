<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set value="${pageContext.request.contextPath}" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<head>

<title>Insert title here</title>

<link href="${path }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js"></script>
<script src="${path }/resources/js/i18n/datepicker.en.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="${path }/resources/js/summernote.js"></script>
<script src="${path }/resources/js/summernote.min.js"></script>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>
<style type="text/css">

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
</style>


</head>

<script type="text/javascript">
	//summernote
	$(document).ready(function() {
  	    $('#summernote').summernote({
            height : 300,                 // set editor height
            lang : 'ko-KR', // default: 'en-US'
      		callbacks : {
      			onImageUpload : function(files, editor, welEditable){
      				sendFile(files, editor, welEditable);
      			}
      		}
  	    });
  	});
	
	$(document).ready(function(){
		//datepicker
		// Initialization
		$('.datepicker-here').datepicker({
			autoClose : true
		});
		// Access instance of plugin
		$('#my-element').data('datepicker');
	});
	
	function sendFile(file, editor, welEditable){
	    data = new FormData();
	    console.log(file);
	    for(var i=0;i<file.length;i++){
	       data.append("uploadFile", file[i]);
	    }
	    console.log(data.getAll('uploadFile'));
	    $.ajax({
	       data:data,
	       url:"${path}/imageUpload.do",
	       type:"POST",
	       cache:false,
	       contentType:false,
	       processData:false,
	       dataType:"json",
	       success:function(data){
	    	  alert(data);
	          console.log(data);
	          for(var i=0;i<data.length;i++)
	          {
	             //$('#test').append('<img src=/resources/uploadImg/'+data.list[i]+'>');
	             $('#summernote').summernote('insertImage', "${path}/resources/uploadImg/"+data[i],data[i]);
	          }
	       },
	       error:function(obj,a,b){
	    	   console.log(obj);
	    	   console.log(b);
	       }
	    });
	}
	
	
	
</script>

<section class="container">
	<br><br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="card mb-4">
	        <div class="card-header bg-white font-weight-bold">번개모집</div>
	        <div class="card-body">
	            <form action="${path }/meet/meetFormEnd.do" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	            
	                <div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">제목</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputEmail3" name="title" placeholder="제목" required="required">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">대표이미지</label>
	                    <div class="col-sm-8">
							<input type="file" accept="image/*" id="thumbnail" name="thumbnail" required="required">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">지역</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="area" name="area" placeholder="동/읍/면" required="required">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">주소</label>
	                    <div class="col-sm-8">
	                        <!-- <input type="text" class="form-control" id="address" name="address" placeholder="상세주소"> -->
	                        <input type="text" class="form-control" id="address" name="address" placeholder="상세주소" required="required"><br>
							<input type="button" class="btn btn-success" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
							
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
							                document.getElementById("address").value = fullAddr;
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
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="inputPassword3" class="col-sm-2 col-form-label">작성자</label>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" id="writer"  value="${userLoggedIn.nickName }" readonly="readonly">
	                        <input type="hidden" name="userId" value="${userLoggedIn.userId }">
	                    </div>
	                </div>
					<div class="form-group row">
					   	<label for="gender" class="col-sm-2 col-form-label">성별</label>
					   	<div class="col-sm-3">
					       	<input type="text" class="form-control" name="gender" value="${userLoggedIn.gender=='M'?'남':'여' }" readonly="readonly"> 
					    </div>
					</div>
	              	<div class="form-group row">
					   	<label for="gender" class="col-sm-2 col-form-label">나이</label>
					   	<div class="col-sm-3">
					       	<input type="text" class="form-control" name="age" value="${userLoggedIn.birth }" readonly="readonly"> 
					    </div>
					</div>
	                <!-- 날자 정하기 -->
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">날짜</label>
	                	<div class="col-sm-3">
	                		<input type='text' class='datepicker-here form-control' data-language='en' required="required"/>
	                	</div>
	                </div>
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">시간</label>
	                	<div class="col-sm-3">
	                		<input type="time" class="form-control" name="meetTime" required="required">
	                	</div>
	                </div>
	                <!-- 썸머노트 에디터 사용 -->
					<div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">내용</label>
	                    <textarea id="summernote" name="content" class="col-sm-8" style="resize: none;" required="required"></textarea>
	                </div>
	                <div class="justify-content-center" align="center">
				        <div class="card-footer bg-white" style="align-content:center;">
				            <button type="submit" class="btn btn-primary">확인</button>
				            &nbsp;&nbsp;
				            <button type="button" onclick="fn_cancel()" class="btn">취소</button>
				        </div>
			        </div>
	            </form>
	        </div>
	    </div>
	</div>
	<script>
		/* 취소버튼 */
		function fn_cancel()
		{
			alert("취소되었습니다.");
			location.href="${path}/meet/meetList.do";
		}
		
		
		
	</script>
	
	
</section>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>


















