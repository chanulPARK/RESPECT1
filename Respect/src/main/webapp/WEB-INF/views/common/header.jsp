<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
    

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- <script src="${path }/resources/js/jquery.min.js"></script> --%>
<%-- <script src="${path }/resources/bootstrap/js/bootstrap.min.js"></script> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/Footer-Dark.css">
<link rel="stylesheet" href="${path }/resources/css/style.css">
<link rel="stylesheet" href="${path }/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/resources/fonts/font-awesome.min.css">
<link rel="stylesheet" href="${path }/resources/fonts/ionicons.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">


<style>
    #rank-list a{
        color: inherit; text-decoration: none;
    }
    #rank-list a:hover{
        color: orange;
        text-decoration: none;
    }
    /* p{
        margin:0;
    }
    ul{
        list-style: none;
    }
    ul>li{
        float: left;
    } */

    @media (max-width: 350px) {
        .fixed-top {
            max-width: 340px;
            margin:0;
            padding: 0;
        }
    }
    
    #navcol-1 {
    	font-size: 22px;
    	font-family: 'Do Hyeon', sans-serif;
    }
    
    .navbar-light .navbar-nav .nav-link {
    	color: #000;
	}
	
	.navbar-light .navbar-nav .nav-link:hover {
    	color: #ffc107;
	}

    #rank-list {
    overflow: hidden;
    margin: 0;
    }

    #rank-list ol {
        position: absolute;
        top: 0;
        left: 0;
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

        
</style>

<!-- <script type="text/javascript">
    $(function(){
        var latitude="";
        var longitude="";
        
        //제주시청기준
        if($("#weather-temp1").children().text().trim()=="제주시"){
            latitude="33.4996015";
            longitude="126.5290653";
        }
        
        //서귀포시청기준
        if($("#weather-temp2").children().text().trim()=="서귀포시"){
            latitude="33.2541658";
            longitude="126.5597051";
        }
        
        $.ajax({
            type : "get",
            crossDomain:true,
            url : "https://api2.sktelecom.com/weather/current/minutely",
            dataType: "json",
            async : false,
            data : {lat:latitude,lon:longitude,version:"1"},
            headers	: { appkey:"2e648883-2070-4bfe-aa3d-9b4c67e97171" },
            beforeSend: function(){
            },
            success : function(data){
                //날씨
                /* alert(data.weather.minutely[0].sky.name); */
                //온도
                /* alert(data.weather.minutely[0].temperature.tc); */
                
                var skyName=data.weather.minutely[0].sky.name;
                var temp=data.weather.minutely[0].temperature.tc;
                
                
                switch (skyName) {
                    case '맑음': $(".weather-picture").html("<i class='wi wi-day-sunny'></i>"); break;
                    case '구름조금': $(".weather-picture").html("<i class='wi wi-day-cloudy'></i>"); break;
                    case '구름많음': $(".weather-picture").html("<i class='wi wi-day-cloudy-high'></i>"); break;
                    case '구름많고 비': $(".weather-picture").html("<i class='wi wi-day-rain'></i>"); break;
                    case '구름많고 눈': $(".weather-picture").html("<i class='wi wi-day-snow'></i>"); break;
                    case '구름많고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-day-rain-mix'></i>"); break;
                    case '흐림': $(".weather-picture").html("<i class='wi wi-day-fog'></i>"); break;
                    case '흐리고 비': $(".weather-picture").html("<i class='wi wi-rain'></i>"); break;
                    case '흐리고 눈': $(".weather-picture").html("<i class='wi wi-snow'></i>"); break;
                    case '흐리고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-rain-mix'></i>"); break;
                    case '흐리고 낙뢰': $(".weather-picture").html("<i class='wi wi-lightning'></i>"); break;
                    case '뇌우/비': $(".weather-picture").html("<i class='wi wi-thunderstorm'></i>"); break;
                    case '뇌우/눈': $(".weather-picture").html("<i class='wi wi-storm-showers'></i>"); break;
                    default: $(".weather-picture").html("<i class='wi wi-storm-showers'></i>"); break;
                }
                
                $("#weather-temp1").children().children().after("<sub>"+temp+" ℃"+"</sub>");
                $("#weather-temp2").children().children().after("<sub>"+temp+" ℃"+"</sub>");
                
            },
            complete: function(){
            },
            error	: function(xhr, status, error){
                
                console.log("ajax실패!");
                console.log(jxhr);
                console.log(textStatus);
                console.log(error);
            }
            });
        
    });
    
</script> -->

</head>
<body>

	<div class="sticky-top" style="background: white; border-bottom: 1px solid #e5e5e5;">


        <div class="container mt-1">
        <nav class="navbar" style="overflow: hidden;">
            <div class="row ml-3">
                <div id="rank-list">
                    <ol>
                        <li>
                            <div class="row ml-3">
                                <div id="weather-temp1" class="mr-4">
                                    <a href="#">
                                        <p>제주시</p>
                                    </a>
                                </div>
                                <div class="weather-picture" style="padding-top: 5px;">
                                    <br>
                                    <br>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row ml-3 mt-2">
                                <div id="weather-temp2" class="mr-2">
                                    <a href="#">
                                        <p>서귀포시</p>
                                    </a>
                                </div>
                                <div class="weather-picture" style="padding-top: 5px;">
                                        
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
            <div class="row justify-content-between mr-3">
                <c:if test="${userLoggedIn==null }">
	                <div class="col-6">
	                    <a class="btn btn-outline-warning" href="${path}/user/userEnroll.do">회원가입</a>
	                </div>         
	                <div class="col-6">
	                    <a class="btn btn-outline-warning" href="${path}/user/userLogin.do">로그인</a> 
	                </div>
	                
	                
                </c:if>
                <c:if test="${userLoggedIn!=null }">
                	<div class="col-4">
	                    <a class="btn btn-outline-warning" href="${path}/mySchedule/allMySchedule.do?userId=${userLoggedIn.userId}">나의 일정관리</a>
	                </div>
	                <div class="col-4">
	                    <a class="btn btn-outline-warning" href="${path}/user/userUpdate.do">나의 정보관리</a>
	                </div>
	                <div class="col-4">
	                    <a class="btn btn-outline-warning" href="${path }/user/userLogout.do">로그아웃</a>
	                </div>
                </c:if>   
            </div>
        </nav>
        </div>

        <hr style="margin: 0; padding:0; border-top: 1px solid #dfdfdf;">
        
        <div class="container">
        <nav class="navbar navbar-light navbar-expand-md">
            <a class="navbar-brand" href="${path}">
            	<img class="img-fluid" src="${path }/resources/img/main/logo2.png" style="max-width: 50px; max-height: 50px;">
            </a>
                <div class="dokdo">
                    <h1>니가가라 제주도</h1>
                </div>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav ml-auto mx-auto">
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/spot/spotList.do">관광지</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="#">숙소</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="#">음식점</a></li>
                        <li class="dropdown mr-3"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">제주이야기 </a>
                            <div class="dropdown-menu" role="menu">
                            	<a class="dropdown-item" role="presentation" href="#">공지사항</a>
                            	<a class="dropdown-item" role="presentation" href="#">축제</a>
                            	<a class="dropdown-item" role="presentation" href="#">교통</a>
                          	</div>
                        </li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path }/meet/meetList.do">모임</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/schedule/scheduleWrite">여행일정</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="#">일정 만들기</a></li>
                    </ul>
                </div>
            </nav>
        </div>
     </div>
    