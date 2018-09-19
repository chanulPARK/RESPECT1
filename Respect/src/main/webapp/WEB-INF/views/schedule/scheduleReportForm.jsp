<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>

@media screen and (min-width: 769px) {
   /* 데스크탑에서 사용될 스타일을 여기에 작성합니다. */
}
   #map
   {
      background:black;   
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
        
        .hidetext
        {
            display: none;
        }
        
     .contact-form{ margin-top:15px;}
     .contact-form .textarea{ min-height:220px; resize:none;}
     .form-control{ box-shadow:none; border-color:#eee; height:49px;}
     .form-control:focus{ box-shadow:none; border-color:#e15002;}
     
     .main-btn:hover{ background:#e15002;color:#fff;}
</style>

<!-- 지도 라이브러리  -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
 <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> 
<script src="${path }/resources/js/summernote.js"></script>
<script src="${path }/resources/js/summernote.min.js"></script>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>  

<script>


//summernote
$(document).ready(function() {
	    $('.summernote').summernote({
        height : 400,                 // set editor height
        lang : 'ko-KR', // default: 'en-US'
  		callbacks : {
  			onImageUpload : function(files, editor, welEditable){
  				sendFile(files, editor, welEditable);
  			}
  		}
	    });
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
             $('.summernote').summernote('insertImage', "${path}/resources/uploadImg/"+data[i],data[i]);
          }
       },
       error:function(obj,a,b){
    	   console.log(obj);
    	   console.log(b);
       }
    });
}


   function fn_submit()
   {
      $("#reportForm").submit();
   }
   function fn_reviewDelete(scheduleNo)
   {
      location.href="${path}/schedule/scheduleReportDelete?scheduleNo="+scheduleNo;
   }
   
   function fn_reviewModify(scheduleNo)
   {
      location.href="${path}/schedule/scheduleReportModify?scheduleNo="+scheduleNo;
   }
     
     function fn_toggle(ev)
     {
       ev.preventDefault();
        var btnId=ev.target.value;
        console.log(btnId);
        $("#content"+btnId).toggle();
     }
     

</script>

<body>
        <div class="container">
                <div class="col-md-12 mt-4" align='center'>
                        <ul class="nav nav-tabs row justify-content-center"  id="myTab">
                                <li class="nav-item">
                                        <a id="timeTable" class="nav-link active" data-toggle="tab" href="#timeTableTab">여행일정</a>
                                </li>
                                <li class="nav-item">
                                        <a id="sendMessage" class="nav-link" data-toggle="tab" href="#Review">여행후기 </a>
                                </li>
                        </ul>
            <div class="tab-content">
            <div class="row tab-pane active" id="timeTableTab">
                    <!-- side bar -->
                    <div class="col-md-8 mt-4" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
                        <br>          
                            <h4>${viewList.NICKNAME}의 여행일정</h4>
                            <hr>
                            <div class="row justify-content-center">
                                <h6>제목</h6>
                                <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.TITLE }</h6>
                            </div>
                            <br>
                            <div class="row justify-content-center">
                                <h6>기간</h6>
                                <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.STARTDATE1 }</h6>&nbsp;<h6 style="color:rgb(174, 166, 166);">~</h6> &nbsp;<h6 style="color:rgb(174, 166, 166);">${viewList.ENDDATE1 }</h6>
                            </div>
                            <br>
                            <div class="row justify-content-center">
                                <h6>인원</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">${viewList.PEOPLENUM}명</h6>
                                <h6 class="ml-5">일행</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">${viewList.PARTYNAME}</h6> 
                            </div>
                            <br>
                            <div class="row justify-content-center">
                                <h6>여행 구분</h6>
                                <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.TRAVELTHEME}</h6>
                            </div>
                            <br>
                        </div>
              
                        <!-- 사이드바 끝  -->
                           <div class="pl-1 col-md-8" >
                                <div class="mt-4" id="map" style=" width:100%; height:353px; border-radius:0;"></div> 
                                <p id="timetableList"></p>
                                <fmt:parseDate value="${viewList.STARTDATE }" var="startDate" pattern="yyyy-MM-dd"/>
                        <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDay"></fmt:parseNumber>
                        <fmt:parseDate value="${viewList.ENDDATE }" var="endDate" pattern="yyyy-MM-dd"/>
                        <fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDay"></fmt:parseNumber>
                                <div id="demo" class="carousel slide" style="width: 100%;" data-ride="carousel" data-interval="false">
                                      <!-- The slideshow -->
                                      <div class="carousel-inner">
                                      <c:forEach var="v" begin='1' end='${endDay - startDay +1}' varStatus="s">
                                  <c:choose>
                                    <c:when test="${s.index==1}">
                                       <div class="carousel-item active">
                                    </c:when>
                                       <c:otherwise>
                                          <div class="carousel-item">
                                       </c:otherwise>
                                    </c:choose>
                                                <div class="day">
                                            <table id='${s.count }' class="table-bordered timeline">
                                                    <tr>
                                                        <th class="time1">TIME</th>
                                                        <th class="time2">
                                                                <a class="float-left" href="#demo" data-slide="prev">&lt;</a>
                                                                   DAY ${s.count }
                                                                <a class="float-right" href="#demo" data-slide="next">&gt;</a>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                           <td class="time1">06:00</td>
                                                            <td id='06' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">07:00</td>
                                                            <td id='07' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">08:00</td>
                                                            <td id='08' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">09:00</td>
                                                            <td id='09' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">10:00</td>
                                                            <td id='10' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">11:00</td>
                                                            <td id='11' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">12:00</td>
                                                            <td id='12' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">13:00</td>
                                                            <td id='13' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">14:00</td>
                                                            <td id='14' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">15:00</td>
                                                            <td id='15' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">16:00</td>
                                                            <td id='16' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">17:00</td>
                                                            <td id='17' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">18:00</td>
                                                            <td id='18' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">19:00</td>
                                                            <td id='19' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">20:00</td>
                                                            <td id='20' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">21:00</td>
                                                            <td id='21' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">22:00</td>
                                                            <td id='22' class="place"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="time1">23:00</td>
                                                            <td id='23' class="place"></td>
                                                    </tr>
                                            </table>
                                    </div>
                              </div>
                                          </c:forEach>
                                         
                                          </div>
                                          </div>
                            
                                </div>
                              </div>
                              <div class="tabe-pane fade" id="Review">
                              <br>
                              <br>
                                <div class="btn-group">
                             <button type="button" class="btn btn-outline-warning" onclick="fn_submit()">
                               후기 작성
                             </button>
                           </div>
                           <br>
                                 
                                <br>  
                                <form name="reportForm" id="reportForm" action="${path }/schedule/scheduleReportInsert" method='post'> 
                                <input type="hidden" name="scheduleNo" value="${viewList.SCHEDULENO }">
                                <!-- for문 -->
                                <c:forEach var="v" begin='1' end='${endDay - startDay +1}' varStatus="s">
                                <input type="hidden" name="day" value="${s.count }">
                               
                                <button class="btn" value="${s.count }" onclick="fn_toggle(event)">${s.count }일차</button><br>
                                <br>
                                <div id="content${s.count }"  class="hidetext">
                                <div >
                                        
                                        <h5 class="col-md-8">제목</h5>
                                        <div class="col-md-7">
                                                <div class="">
                                                   <input type="text" class="form-control" name="reportTitle" autocomplete="off" id="reportTitle" placeholder="title" required>
                                                </div>
                                        </div>
                                        <br>
                                        <h5 class="col-md-8">내용</h5>
                                                <div class="col-md-7">
                                                <div class="">
                                                     <textarea class="col-md-7 form-control textarea summernote"  name="reportContent" id="reportContent" placeholder="content"  style="resize: none;" required></textarea>
                                                </div>
                                                </div>
                                        <br>
                                        </div>
                                </div>
                                <br>
                                </c:forEach>
                                   </form>   
                              </div>
                              
      
                    <br>
                </div>
                </div>
                </div>
                
                
                
                
                
              </body>
      
  <script>
   var title;
   
   
  
    
    
  
   var createSeq = function(){
      var no=0;
      return function(){
         return ++no;
      }
   };
   
   var seq= createSeq();
   var markers=[];
   var seq_num;
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
      console.log("마커생성 : "+seq_num);
      //위치를 지도에 표기
      var marker = new daum.maps.Marker({
         map:map,
         title:seq_num,
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
      markers.push(marker);
   };
   
   function fn_move()
   {
      console.log(markers);
      for(var i=0; i<markers.length;i++)
         {
            markers[i].setMap(null);
         }
      
      markers=null;
      console.log(markers);
   }
   
   
   
  

   


   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>