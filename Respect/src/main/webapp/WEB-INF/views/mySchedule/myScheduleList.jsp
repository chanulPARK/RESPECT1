<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  

    <script>
      // 더보기버튼구현
    $(function(){
          $(".card_list").slice(0, 3).show();
          $("#load").click(function(e){ 
              e.preventDefault();
              if($(".card_list:hidden").length== 0){
                  alert("더 보여줄 게시물이 없습니다");
                  return;
               }
              $(".card_list:hidden").slice(0, 4).show(); 
           
              
    });

    
  });
      
      function check(){
    	  var chk = confirm("삭제하시겠습니까?")
    	  if(chk==false){
    		  return false;
    	  }
    	  
    	  if(chk==true){
    		return true;  
    	  }
    	  
      }

  
  </script>
    <style>
      .card_list{
        display: none;
    }
        #user_name{
    font-size: 25px;
    font-weight: 800;
    color: #ef8321;
    line-height: 25px;
    display: inline-block;
    }
    #text_tit{
        margin-top: 4px;
    font-size: 18px;
    color: #1b1b1b;
    display: inline-block;
  
    }
    #text_myInfo_key{
        font-size: 17px;
        color: #1b1b1b;
        line-height: 17px
    }
    #text_myInfo_value{

        color: #ef8321;
        font-size: 17px
    }
    #text_myTripSchedule{
      color: #ef8321; font-size: 18px; line-height: 40px; font-weight:bold;
    }

    #card_line{
      height: 200px ; width: 100%; box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2);
    }

    #card_line_noshadow{
      height: 200px ; width: 100%;
    }

    #more_title{
      font-size: 18px; line-height: 90%; color: #ef8321;
    }

    #more_num{
      font-size: 18px; color: #ef8321; font-size: 42px;  font-weight: 400; line-height: 1%;
    }
    
    #div_title{
      height: 50px; width: 100%; border: 3px solid #f8c990; border-radius: 10px;
    }

    #p_title{
      font-size: 17px; color: black; text-align: center; font-weight: bold;
    }

    #span_info{
      font-size: 14px; color: black; text-align: center; font-weight: 300;
    }

    </style>

    <div class="container p-0">
       
            <div class="card card-register mx-auto mt-5" style="background: #f4f4f4; border: 1px solid #e5e5e5;">
                    
                    <div class="card-body">
                        <div class="form-group">
                          <div class="form-row">
                            <div class="col-md-2" style="border-right: 1px solid #e5e5e5" >
                              <div class="form-label-group">
                                  <!--사진 (경로를 잘 찾아라!!)-->
                                <c:if test="${userLoggedIn.picture ne null }">
                            		<img src="${path }/resources/upload/profile/${userLoggedIn.picture}" alt="프로필사진" width="100%"  height= "157px" style="max-height: 100%" class="rounded-circle" >
                              </c:if>
                              <c:if test="${userLoggedIn.picture eq null }">
                            		<img src="${path }/resources/upload/profile/basicprofile.jpg" alt="프로필사진" width="100%"  height= "157px" style="max-height: 100%" class="rounded-circle" >
                              </c:if>
                              </div>
                            </div>
                            <div class="col-md-10" >
                              <div class="form-label-group" style="border-bottom: 1px solid #e5e5e5">
                                    <!--유저닉넴이나 이름-->
                                    <span id="user_name" class="ml-4 mb-3">${userLoggedIn.nickName}</span>
                                    <span id="text_tit">님의 제주여행</span>
                              </div>
                              <div class="form-group mt-4 ml-4">
                                    <div class="form-row">
                                      <div class="col-md-4">
                                        <div class="form-label-group ">
                                          <span id="text_myInfo_key">나의 여행일정 : </span>
                                          <!--등록한 여행일정의 수-->
                                          <span id="text_myInfo_value">${myScheduleNum}</span>
                                        </div>
                                      </div>
                                      <div class="col-md-4">
                                        <div class="form-label-group">
                                                <span id="text_myInfo_key">&nbsp;&nbsp;찜한 여행지 : </span> 
                                                <!--찜한여행지의 수-->
                                                <span id="text_myInfo_value">&nbsp;${putPlaceNum }</span>
                                        </div>
                                      </div>
                                      <div class="col-md-4">
                                            <div class="form-label-group">
                                                    <span id="text_myInfo_key">&nbsp;&nbsp;안읽은 쪽지 : </span>
                                                    <!--읽지않은 쪽지의 수-->
                                                    <span id="text_myInfo_value">&nbsp;${userLoggedIn.noReadMessage }</span>
                                            </div>
                                          </div>
                                    </div>
                                  </div>
                                  <div class="form-group mt-4 ml-4">
                                        <div class="form-row">
                                          <div class="col-md-4">
                                            <div class="form-label-group ">
                                              <span id="text_myInfo_key ">찜한 여행일정 : </span>
                                              <!--찜한 여행일정의 수-->
                                              <span id="text_myInfo_value">${putScheduleNum }</span>
                                            </div>
                                          </div>
                                          <div class="col-md-4">
                                            <div class="form-label-group">
                                                    <span id="text_myInfo_key">나의 여행후기 : </span>
                                                    <!--자신이 작성한 여행후기의 수-->
                                                     <span id="text_myInfo_value">${myScheduleReportNum }</span>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    
                            </div>
                          </div>
                        </div>            
                    </div>
                  </div>
          
          
          <div class="mt-5">
          	  <c:if test="${sort eq 'all' }">
              	<span style="font-size: 24px">나의 전체 여행일정(${fn:length(myScheduleList)})</span>
              </c:if>
              <c:if test="${sort eq 'before' }">
              	<span style="font-size: 24px">나의 여행전 일정(${fn:length(myScheduleList)})</span>
              </c:if>
              <c:if test="${sort eq 'ing' }">
              	<span style="font-size: 24px">나의 여행중 일정(${fn:length(myScheduleList)})</span>
              </c:if>
              <c:if test="${sort eq 'after' }">
              	<span style="font-size: 24px">나의 여행완료 일정(${fn:length(myScheduleList)})</span>
              </c:if>
          </div>

          <!--클릭한거에 따라 색깔지정 잘해라!!-->
          <div class="mt-4">
          	<c:if test="${sort eq 'all' }">
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important;"><span style="font-size: 16px; color: black;">전체</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=before" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행전</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=ing" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행중</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=after" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행완료</span></a>
         	</c:if>
         	
         	<c:if test="${sort eq 'before'}">
         	  <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">전체</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=before" style="text-decoration:none !important;"><span style="font-size: 16px; color: black;">여행전</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=ing" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행중</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=after" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행완료</span></a>
         	</c:if>
         	
         	<c:if test="${sort eq 'ing'}">
         	  <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">전체</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=before" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행전</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=ing" style="text-decoration:none !important;"><span style="font-size: 16px; color: black;">여행중</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=after" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행완료</span></a>
         	</c:if>
         	
         	<c:if test="${sort eq 'after'}">
         	  <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;" >전체</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=before" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;">여행전</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=ing" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;" >여행중</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path}/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=after" style="text-decoration:none !important;"><span style="font-size: 16px; color: black;">여행완료</span></a>
         	</c:if>
         </div>

    </div>


    <div class="container p-0">
        <div class="row">

          <!--나의 일정 만들기-->
          <div class="col-md-3 col-sm-6 portfolio-item mt-3">
              
                  <div class="portfolio-hover mt-3 ">
                    <div class="portfolio-hover-content">
                      
                    </div>
                  </div>
                  <div id="card_line" style=" border: 1px solid #ef8321; text-align: center;" >
                    <br><br>
                    <p id="more_title" class="mt-1">나의 여행일정 만들기</p>
                    <a class="portfolio-link" href="http://www.naver.com" style="text-decoration:none !important">
                        <img src="${path }/resources/upload/profile/btn_plus.PNG" alt="">
                      </a>
                  </div>
               
            </div>
          <!--만들기 끝-->
          
    			<c:forEach items="${myScheduleList }" var="msl">
    			
    				<div class="col-md-3 col-sm-6 portfolio-item mt-3 card_list">
	                	<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${msl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
		                    <div class="portfolio-hover mt-3">
		                      <div class="portfolio-hover-content">
		                        
		                      </div>
		                    </div>
		                    <div id="card_line" style="height: auto;">
		                      <img src="${path }/resources/upload/spot/thumbnail/${msl.THUMBNAIL}" alt="" width="100%" height="130px">
		                      <a href="${path }/mySchedule/myScheduleDelete.do?scheduleNo=${msl.SCHEDULENO }&userId=${userLoggedIn.userId}&sort=${sort}" style="text-decoration:none !important" onclick="return check()"><img src="${path }/resources/upload/profile/xButton.png" alt="" width="20px" style="position: absolute; top: 25px; right: 25px;"></a>
		                      
		                      <fmt:parseDate value="${msl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${msl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
								
									
		                     
		                      
		                      <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
		                      
				
				                  <p id="p_title" class="p-2">${msl.TITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${msl.PARTYNAME}ㅣ${msl.TRAVELTHEME}</span></p>
		                      
		                    </div>
	                  </a>
	              </div>
    			
    			</c:forEach>
    			
    			
    			
        </div>
        <c:if test="${fn:length(myScheduleList)==0}">
			<p class="text-center">등록된 정보가 없습니다.</p>
		</c:if>
    </div>
    <div class="container p-0">

        <div class="form-group mt-5" align="center">
            <button  id='load' type="button" class="btn w-50">더보기</button>
          </div>
    </div>
<div class="mb-5"></div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>