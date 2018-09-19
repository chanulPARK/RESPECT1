<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	#detail .place_card a, #detail .place_card a:hover {
		color: #000;
		text-decoration: none;
	}
	.pagination_jeju {
		margin-top: 50px;
	}
	.pagination_jeju .page-item .page-link {
		color: #000;
	}
	.pagination_jeju .page-item.active .page-link {
		color: #fff;
		background-color: #ffb53c;
		border-color: #ffb53c;
	}
	#detail .container .card-deck .card {
		box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2);
	}
	.map-row {
		border: 1px solid #e5e5e5;
	}
	.cate_click {
		background: #ffb53c;color: #fff;
	}
</style>

<main class="page landing-page">
	<input type="hidden" id="minorcategory" name="minorcategory" value="자연" />
	<input type="hidden" id="page" name="page" value="" />
	
	<section class="clean-block slider dark" style="padding:0;margin:0 0 100px;">
		<img src="${path }/resources/img/spot/성산일출봉.gif" style="width:100%;">
	</section>
	<section id="map-index">
	    <div class="container">
	        <h2>제주도 모든 여행지를 한 눈에…<br></h2>
	        <h5>내가 가본 제주는 어디까지일까? 수많은 제주의 아름다운 여행지를 취향에 맞게 선택해보자. 368개의 크고 작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른 바다…. 제주의 보석 같은 여행지가 여러분의 선택을 기다린다.<br></h5>
	        	<img src="${path }/resources/img/spot/지도.JPG" class="map">
	        	<button class="btn btn-outline-warning map-btn" type="button">전체지역</button>
       	</div>
	</section>
	<section id="map-tag">
	    <div class="container">
	        <div class="row map-row">
	            <div class="col-xl-1 tag-all cate cate_click" style="padding:0px;">
	                <h5 style="padding-top: 35px;">전체</h5>
	            </div>
	            <div class="col">
	                <a href="javascript:fn_search('리조트')">
	                <div class="row cate">
	                    <div class="col">
	                        <h5>리조트</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('게스트하우스')">
	                <div class="row cate">
	                    <div class="col">
	                        <h5>게스트하우스</h5>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('호텔')">
	                <div class="row cate">
	                    <div class="col">
	                        <h5>호텔</h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('모텔/여관')">
	                <div class="row cate">
	                    <div class="col">
	                        <h5>모텔/여관<br></h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('펜션/민박')">
	                <div class="row cate">
	                    <div class="col">
	                        <h5>펜션/민박</h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<section id="detail">
	    <div class="container">
		    <div class="d-flex justify-content-between">
				<h4 style="margin: 10px 0 0 ;">전체&nbsp;<small>${totalContents }</small></h4>
				
		        <div class="btn-group">
		            <!-- <div class="dropdown">
		            <button class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" type="button">검색기준</button>
		                <div class="dropdown-menu" role="menu">
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">이름</a>
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">주소</a>
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">테마</a>
		                </div>
		            </div>&nbsp;&nbsp;
		            <select class="form-control" name="minorcategory" required>
                    	<option value="" selected>카테고리를 선택하세요</option>
                    	<option value="자연">자연</option>
                    </select> -->
		            <input type="text" class="form-control" name="keyword" placeholder="이름 또는 주소">&nbsp;&nbsp;
		            <button class="btn btn-outline-secondary" type="button" onclick="fn_selectSearch22()">검색</button>
	            </div>
            </div>
	        <div class="card-deck row place_card" style="display: flex;flex-wrap: wrap;">
	        	<c:forEach items="${list}" var="p">
	        	<div class="col-4 mt-4 px-3">
		        	<div class="card m-0">
		        		<img class="card-img-top" src="${path }/resources/upload/spot/thumbnail/${p.thumbnail}" style="height: 200px">
		                <div class="card-body">
		                <c:choose>
		                <c:when test="${userLoggedIn ne null}">
		                    <h4 class="text-center card-title"><a href="${path }/spot/spotViewLogin.do?spotno=${p.placeno}&userid=${userLoggedIn.userId}">${p.title}</a></h4>
		                </c:when>
						<c:otherwise>
		               		<h4 class="text-center card-title"><a href="${path }/spot/spotView.do?spotno=${p.placeno}">${p.title}</a></h4>
						</c:otherwise>
						</c:choose>
		                    <p class="text-center card-text" style="margin:0;">${p.area}</p>
		                    <p class="text-center" style="color:#ffb53c;">#${p.minorcategory}</p>
		                    <div class="row row-icon">
		                        <div class="col"><i class="fa fa-thumbs-o-up icon" style="font-size: 20px;"></i>
		                            <p>좋아요</p>
		                            <p>${p.goodcount}</p>
		                            
		                        </div>
		                        <div class="col"><i class="fa fa-heart icon" style="font-size: 20px;"></i>
		                            <p>찜하기</p>
		                            <p>${p.bringcount}</p>
		                        </div>
		                        <div class="col"><i class="fa fa-check icon" style="font-size: 20px;"></i>
		                            <p>조회수</p>
		                            <p>${p.hitscount}</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </div>
	            </c:forEach>
            </div>
            ${pageBar }<br/>
        </div>
        <button class="btn btn-warning btn-block" type="button" onclick="fn_spotEnrollgo()">장소 등록</button>
    </section>
</main>
	
<script>
	function fn_selectSearch22() {
		location.href="${path}/spot/selectSearchList.do?keyword="+$('input[name=keyword]').val();
	}

	function fn_spotEnrollgo() {
		location.href="${path}/spot/spotEnroll.do";
	}
	
	function fn_search(minorcategory) {
		location.href="${path}/spot/searchaccommCategoryList.do?minorcategory="+minorcategory;
	}
	
	$(document).ready(function() {
		$('.cate').click(function() {
			$('.cate').each(function(){
				$(this).removeClass('cate_click');
			});
			$(this).addClass('cate_click');
		});
	});
	
/* 	function fn_search(minorcategory) {
		var sendData = {"placeno":$('#placeno').val(), "userid":$('#userid').val()};
		
		console.log("boardno, userid : " + placeNo +","+ userId);
		
		$.ajax({
		    url: "${path}/spot/searchCategory.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: 'minorcategory='+minorcategory,
		    success: function(data) {
		    	
		    	
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	} */
</script>

	
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>