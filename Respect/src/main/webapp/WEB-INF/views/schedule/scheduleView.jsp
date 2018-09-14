<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>

    #map{
        
        margin-left: 3%;
        margin-right: 3%;
    }
  

@media screen and (max-width: 768px) {
    body {
        background-color: lightgreen;
    }
}
@media screen and (min-width: 769px) {
   /* 데스크탑에서 사용될 스타일을 여기에 작성합니다. */
}

    .time1{width:20%;}
        .time2{width:80%;}
        .timeline th{background:black; color:orange;}
        .timeline{text-align: center; width:100%}
        .timeline tr{height:50px;}
        .time2 button{color:orange; background:black;}
        .schedule_width{overflow: hidden; width:100%;}
        #timeline-wrap{position: relative; overflow: hidden; width:100%; }
        .day a{text-decoration: none; color:orange;}
</style>

<!-- 지도 라이브러리  -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>

<script>
	function fn_review()
	{
		location.href="${path}/scheduleBoardReview.do";
	}
</script>
<body>
 <hr>

    <div class="container">
            <div class="row">
                    <h2 class="pt-4 ml-2">일정제목</h2>
                    <div class='row ml-5' style="margin-top:35px;">
                        <h6>조회</h6><h6 class="ml-2" style="color:rgb(208, 203, 203);">1234</h6>&nbsp;&nbsp;<h6>|</h6>&nbsp;&nbsp;<h6>찜하기</h6><h6 class="ml-2" style="color:rgb(208, 203, 203);">12</h6>&nbsp;&nbsp;<h6>|</h6>&nbsp;&nbsp;<h6>좋아요</h6><h6 class="ml-2" style="color:rgb(208, 203, 203);">100</h6>
                    </div>
                </div> 
            <div class="row">
                <!-- side bar -->
                <div class="col-md-3 mt-4 ml-1" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
           		 <form action="${path }" method="post">
                    <br>          
                        <h4>OOO의 여행일정</h4>
                        <hr>
                        <div class="row justify-content-center">
                            <h6>제목</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">제목 입력 DB데이터</h6>
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>기간</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">2018.06.05</h6>&nbsp;<h6 style="color:rgb(174, 166, 166);">~</h6> &nbsp;<h6 style="color:rgb(174, 166, 166);">2018.06.05</h6>
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>인원</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">1명</h6>
                            <h6 class="ml-5">일행</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">2명</h6> 
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>여행 구분</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">휴식과 치유 여행 등등</h6>
                        </div>
                        <br>
                        <div align='center'class='row justify-content-center'>
                            <input class="btn" type="button" value="일정 수정" >
                            <input class="btn" type="button" value="후기 등록" onclick="fn_review()">
                        </div>
                        </form>
                        <br>
                    </div>
                    <br>
                    <!-- 사이드바 끝  -->
                       <div class="pl-0 col-md-8" >
                            <div class="mt-4" id="map"  style="width:98%; height:352px; border-radius:0;"></div> 
                            <p id="timetableList"></p>
                            </div>
                        </div>
                        <!-- 타임테이블 -->
                        <div id="demo" class=" col-md-11 carousel slide" data-ride="carousel" data-interval="false">
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                              <div class="carousel-item active">
                                    <div class="day">
                                            <table class="table-bordered timeline">
                                                    <tr>
                                                        <th class="time1">TIME</th>
                                                        <th class="time2">
                                                                <a class="float-left" href="#demo" data-slide="prev">&lt;</a>
                                                                DAY 1
                                                                <a class="float-right" href="#demo" data-slide="next">&gt;</a>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">06:00</td>
                                                            <td class="time2">제주국제공항</td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">07:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">08:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">09:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">10:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">11:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">12:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">13:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">14:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">15:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">16:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">17:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">18:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">19:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">20:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">21:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">22:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">23:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                            
                                            </table>
                                    </div>
                              </div>
                              <div class="carousel-item">
                                    <div class="day">
                                            <table class="table-bordered timeline">
                                                    <tr>
                                                            <th class="time1">TIME</th>
                                                            <th class="time2">
                                                                    <a class="float-left" href="#demo" data-slide="prev">&lt;</a>
                                                                    DAY 2
                                                                    <a class="float-right" href="#demo" data-slide="next">&gt;</a>
                                                            </th>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">06:00</td>
                                                            <td class="time2">제주국제공항</td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">07:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">08:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">09:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">10:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">11:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">12:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">13:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">14:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">15:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">16:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">17:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">18:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">19:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">20:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">21:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">22:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">23:00</td>
                                                            <td class="time2"></td>
                                                    </tr>
                                            
                                            </table>
                                    </div>
                              </div>
                              
                            </div>
                          </div>
  
                <br>
            </div>
          </body>
          
         <br>
  
      
  <script>
   var title;
   var clicktarget;
   function allowDrop(ev) {
       ev.preventDefault();
   }
   
   function drag(ev) {
       clicktarget=ev.target.parentElement.parentElement.parentElement;
       clicktarget.classList.remove("disable");
       ev.dataTransfer.setData("text", ev.target.parentElement.parentElement.id);
   }
   
   function drop(ev) {
       ev.preventDefault();
       var data = ev.dataTransfer.getData("text");
       var td=$(".active TD[class='place']");
       
       if(ev.target.className=="place")
       {
           ev.target.classList.add("disable");
           ev.target.appendChild(document.getElementById(data));
       }
       else
       {
           clicktarget.classList.add("disable");
       }
   
   }
   var createSeq = function(){
      var no=0;
      return function(){
         return ++no;
      }
   };
   
   var seq= createSeq();
   
   
   var ps= new daum.maps.services.Geocoder();
   
   //지도상에 마커를 클릭하면 장소명을 표출할 인포윈도우
   var infowindow=new daum.maps.InfoWindow({zIndex:1});

   //지도를 담을 영역의 DOM (지도표기)
   var container = document.getElementById('map');
   var options = {//지도 옵션 설정
         center : new daum.maps.LatLng(33.361425, 126.529418),//지도 중심좌표
         level:10
   };
   var map= new daum.maps.Map(container, options);

   function fn_add(event)
   {
          var place1=event.target.value;
          
          var place2=place1.split(",");
          
          var seq_no=seq();/* 
           var html="<div id='data"+seq_no+"'>"+place2[1]+seq_no+"/"+place2[0]+"<input type='hidden' value='"+place1+"' class='placelist'><span class='float-right' class='drag' id='drag"+seq_no+"' draggable='true' ondragstart='drag(event)'> <img src='${path}/resources/img/arrow.png' style='width:50px; height:30px;'></span></div>";
           var active=$(".active TD[class='place']:first");
           active[0].classList.add("disable");
           active.append(html);
           var loc=place2[2];
           title=place2[1];
           console.log(loc); */
           var loc="인계동 159";
           ps.addressSearch(loc,placesSearchCB);
   }
   
   //장소 검색 완료시 호출되는 콜백 함수
   function placesSearchCB (data, status, pagination)
   {
      
      if(status === daum.maps.services.Status.OK)
      {
         //검색된 장소 위치를 기준으로 좌표 추가
         /* var bounds = new daum.maps.LatLngBounds(); */
         
         for(var i=0; i<data.length; i++)
         {
            
            displayMarker(data[i]);
            /* bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x)); */
         }
         //검색된 장소 위치를 기준으로 지도 표기
         /* map.setBounds(bounds); */
      }
   }

   //지도 마커 표기하는 함수
   function displayMarker(place)
   {
      console.log(place);
      //위치를 지도에 표기
      var marker = new daum.maps.Marker({
         map:map,
         position:new daum.maps.LatLng(place.y, place.x),
         clickable: true 
      });
      
      
       iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new daum.maps.InfoWindow({
           removable:iwRemoveable
       }); 
       infowindow.setContent('<div style="padding:5px; font-size:12px;">'+title+'</div>');
      daum.maps.event.addListener(marker, 'click', function()
      {
         console.log($("#addr").val());
         //마커 클릭시 장소명이 인포윈도우에 표출
         
         infowindow.open(map,marker);
      });
   }
   
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
