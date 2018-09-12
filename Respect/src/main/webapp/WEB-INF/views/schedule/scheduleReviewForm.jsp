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
        .btn{ background:#e15002; border-color:#e15002; color:#fff;}
        .main-btn:hover{ background:#e15002;color:#fff;}
</style>

<!-- 지도 라이브러리  -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>

<script>
	function fn_reviewDelete()
	{
		location.href="${path}/scheduleReviewDelete.do";
	}
	
	function fn_reviewModify()
	{
		location.href="${path}/scheduleReviewModify.do";
	}
     
     function fn_toggle(ev)
     {
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
                                        <a id="timeTable" class="nav-link active" data-toggle="tab" href="#timeTableTab">타임테이블</a>
                                </li>
                                <li class="nav-item">
                                        <a id="sendMessage" class="nav-link" data-toggle="tab" href="Review">여행후기 </a>
                                </li>
                        </ul>
            <div class="tab-content">
            <div class="row tab-pane active" id="timeTableTab">
                    <!-- side bar -->
                    <div class="col-md-8 mt-4" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
                        <form action="test.html" method="get">
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
                                <input class="btn" type="button" value="후기 수정" onclick="fn_reviewModify()">&nbsp;&nbsp;&nbsp;
                                <input class="btn" type="button" value="후기 삭제" onclick="fn_reviewDelete()">
                            </div>
                            </form>
                            <br>
                        </div>
              
                        <!-- 사이드바 끝  -->
                           <div class="pl-1 col-md-8" >
                                <div class="mt-4" id="map" style=" width:100%; height:353px; border-radius:0;"></div> 
                                <p id="timetableList"></p>
                                <div id="demo" class="carousel slide" style="width: 100%;" data-ride="carousel" data-interval="false">
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
                            
                                </div>
                              </div>
                              <div class="tabe-pane fade" id="Review">
                                     <!-- side bar -->
                                 <div class="col-md-8 mt-4 ml-1" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
                                <form action="test.html" method="get">
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
                                        <input class="btn" type="button" value="후기 수정" onclick="fn_reviewModify()">&nbsp;&nbsp;&nbsp;
                                        <input class="btn" type="button" value="후기 삭제" onclick="fn_reviewDelete()">
                                    </div>
                                    </form>
                                    <br>
                                </div>
                                <br>  
                                <!-- for문 -->
                                <button class="btn" value="1" onclick="fn_toggle(event)">1일차</button><br>
                                <br>
                                <div id="content1"  class="hidetext">
                                <div class="container">
                                        <form action="#" id="contact-form" class="contact-form">
                                                <h5 class="col-md-8">제목</h5>
                                                <div class="col-md-8">
                                                        <div class="form-group">
                                                        <input type="text" class="form-control" name="Name" autocomplete="off" id="title1" placeholder="title1">
                                                        </div>
                                                </div>
                                                <h5 class="col-md-8">내용</h5>
                                                        <div class="col-md-8">
                                                        <div class="form-group">
                                                                <textarea class="form-control textarea" rows="3" name="Message1" id="Message1" placeholder="Message"></textarea>
                                                        </div>
                                                        </div>
                                                <div class="col-md-8">
                                                <button type="submit" class="btn main-btn pull-right">등록하기</button>
                                                
                                                </div>
                                        </form>
                                        <br>
                                        </div>
                                </div>
                                        <button class="btn" value="2" onclick="fn_toggle(event)">2일차</button><br>
                                        <br>
                                        <div id="content2"  class="hidetext">
                                                <div class="container">
                                                        <form action="#" id="contact-form" class="contact-form">
                                                                <h5 class="col-md-8">제목</h5>
                                                                <div class="col-md-8">
                                                                        <div class="form-group">
                                                                        <input type="text" class="form-control" name="Name" autocomplete="off" id="title2" placeholder="title2">
                                                                        </div>
                                                                </div>
                                                                <h5 class="col-md-8">내용</h5>
                                                                        <div class="col-md-8">
                                                                        <div class="form-group">
                                                                                <textarea class="form-control textarea" rows="3" name="Message2" id="Message2" placeholder="Message"></textarea>
                                                                        </div>
                                                                        </div>
                                                                <div class="col-md-8">
                                                                <button type="submit" class="btn main-btn pull-right">등록하기</button>
                                                
                                                                </div>
                                                        </form>
                                                        </div>
                                                </div>
                              </div>
                              
      
                    <br>
                </div>
                </div>
                </div>
              </body>
      
  <script>
   var title;
   
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    
    
    $(function() {
$("#start_date").on("click",function()
{
      
   var sDate=$("#start_date").val();
   var eDate=$("#end_date").val();
   console.log(sDate);
   console.log(eDate);
   if(sDate!=""&&eDate!="")
   {
      
      
      var flag=confirm("시작날짜를 변경할 경우 일정이 초기화될 수 있습니다 계속 하시겠습니까?");
      if(flag)
      {
         $("#demo").remove();
         $("#start_date").val("");
         $("#end_date").val("");
      }
      else
         {
         
         return;
         }
   
   }
});
   
   $("#end_date").on("click",function()
         {

         var eDate=$("#end_date").val();
         /* 끝날짜에 밸류가 있을때 */
         if(eDate!="")
         {
            var flag=confirm("끝날짜를 변경할 경우 일정이 초기화됩니다. 계속 하시겠습니까?");
            if(flag)
            {
               var eDate=$("#end_date").val("");
               $("#demo").remove();                  
            }
            else
            {
            
               
               return;
            }
         }            
         });
       
    $("#start_date").datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: showDays
    });
    
    
    $("#end_date").datepicker({
        dateFormat: 'yy-mm-dd',
        midDate:$('#start_date').datepicker('getDate'),
        onSelect: showDays
        
    });
    
    $('#start_date').datepicker("option", "maxDate", $("#end_date").val());
    $('#start_date').datepicker("option", "onClose", function ( selectedDate ) {
        $("#end_date").datepicker( "option", "minDate", selectedDate );
    });
    $('#end_date').datepicker("option", "minDate", $("#start_date").val());
    $('#end_date').datepicker("option", "onClose", function ( selectedDate ) {
        $("#start_date").datepicker( "option", "maxDate", selectedDate );
    });
    
    
   function showDays() {
        var start = $('#start_date').datepicker('getDate');
        var end = $('#end_date').datepicker('getDate');
        
        if (!start || !end) return;
        var days = (end - start) / 1000 / 60 / 60 / 24;
        if($("#demo")!=null)
           {
            $("#demo").remove();   
           }
        
        var printHTML="<div id='demo' class='carousel slide' data-ride='carousel' data-interval='false'><div class='carousel-inner'>";
        for(i=0; i<=days; i++)
         {
           
           if(i==0)
             {
              printHTML+="<div class='carousel-item active'>";         
             }else
            {
                printHTML+="<div class='carousel-item'>";
            }
           printHTML+="<div class='day'>";
           printHTML+="<table class='table-bordered timeline'>";
           printHTML+="<tr><th class='time1'>TIME</th>";
           printHTML+="<th class='place'>";
           printHTML+="<a class='float-left'  href='#demo' onclick='fn_move()' data-slide='prev'>&lt;</a>";
            printHTML+="DAY "+(i+1);             
            printHTML+="<a class='float-right' href='#demo' onclick='fn_move()' data-slide='next'>&gt;</a>";
            printHTML+="</th></tr>"
            printHTML+="<tr><td class='time1'>06:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>07:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>08:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>09:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>10:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>11:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>12:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>13:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>14:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>15:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>16:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>17:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>18:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>19:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>20:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>21:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>22:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>23:00</td><td class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="</table></div></div>";
         }
           printHTML+="</div></div>";
           console.log(printHTML);
             $('#timetableList').append(printHTML);
         
    }
   
});
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
   
   function fn_add(event)
   {
          var place1=event.target.value;
          
          var place2=place1.split(",");
          
          var seq_no=seq();
          seq_num=seq_no
           var html="<div id='data"+seq_no+"'>"+place2[1]+seq_no+"/"+place2[0]+"<input type='hidden' value='"+place1+"' class='placelist'><span class='float-right' class='drag' id='drag"+seq_no+"' draggable='true' ondragstart='drag(event)'> <img src='${path}/resources/img/arrow.png' style='width:50px; height:30px;'></span><button class='float-right' onclick='fn_delete("+seq_no+")'>X</button></div>";
           var active=$(".active TD[class='place']:first");
           active[0].classList.add("disable");
           active.append(html);
           var loc=place2[2];
           title=place2[1];
           console.log(loc);
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
   
   
   
   function fn_delete(num)
   {
      for(var i=0; i<markers.length;i++)
      {
         if(markers[i].getTitle()==num)
            {
               markers[i].setMap(null);
            }
      }
      var targetdiv=document.getElementById("data"+num);
      
      targetdiv.parentElement.classList.remove("disable");
      targetdiv.remove();
      
   };

   


   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
