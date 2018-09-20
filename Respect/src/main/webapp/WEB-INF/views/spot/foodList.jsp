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
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var temp = $('#minorcategory').val();
		if(temp=='향토음식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c1').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='한식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c2').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='양식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c3').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='일식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c4').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='중식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c5').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='동남아식') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c6').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='카페') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c7').prop('style', 'background: #ffb53c;color: #fff;')
		}
	});
</script>
<main class="page landing-page">
	<input type="hidden" id="minorcategory" name="minorcategory2" value="${minorcategory}" />
	<input type="hidden" id="page" name="page" value="" />
	
	<section class="clean-block slider dark" style="padding:0;margin:0 0 100px;">
		<img src="${path }/resources/img/spot/2.jpg" style="width:100%;">
	</section>
	<section id="map-index">
	    <div class="container">
	        <h2>제주의 전통음식부터 다양한 음식의 천국 제주도<br></h2>
	        <h5>여행의 즐거움 중 빼놓을 수 없는 것은 단연 음식이다. 제주도는 흑돼지, 말요리 그리고 해산물 등 다양한 음식문화를 접할 수 있다. 제주도의 전통 음식부터 줄을 서서 기다리는 최고 인기의 음식까지 모두 즐겨보자.<br></h5>
	        	<img src="${path }/resources/img/spot/지도.JPG" class="map">
	        	<button class="btn btn-outline-warning map-btn" type="button">전체지역</button>
       	</div>
	</section>
	<section id="map-tag">
	    <div class="container">
	        <div class="row map-row">
	            <div class="col-xl-1 tag-all cate cate_click" style="padding:0px;background: #ffb53c;color: #fff;">
	                <a href="javascript:fn_searchAll()">
		                <h5 style="padding-top: 35px;">전체</h5>
		            </a>
	            </div>
	            <div class="col">
	                <a href="javascript:fn_search('향토음식')">
	                <div class="row cate" id="c1">
	                    <div class="col">
	                        <h5>향토음식</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('중식')">
	                <div class="row cate" id="c5">
	                    <div class="col">
	                        <h5>중식</h5>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('한식')">
	                <div class="row cate" id="c2">
	                    <div class="col">
	                        <h5>한식</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('동남아식')">
	                <div class="row cate" id="c6">
	                    <div class="col">
	                        <h5>동남아식</h5>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('양식')">
	                <div class="row cate" id="c3">
	                    <div class="col">
	                        <h5>양식<br></h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('카페')">
	                <div class="row cate" id="c7">
	                    <div class="col">
	                        <h5>카페</h5>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('일식')">
	                <div class="row cate" id="c4">
	                    <div class="col">
	                        <h5>일식</h5>
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
		                        <div class="col"><i class="fa fa-commenting-o icon" style="font-size: 20px;"></i>
		                            <p>리뷰</p>
		                            <p>${p.replycount}</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </div>
	            </c:forEach>
            </div>
            ${pageBar }<br/>
        </div>
        <c:if test="${userLoggedIn.userLevel==1}">
        	<button class="btn btn-warning btn-block" type="button" onclick="fn_spotEnrollgo()">장소 등록</button>
        </c:if>
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
		location.href="${path}/spot/searchfoodCategoryList.do?minorcategory="+minorcategory;
	}
	
	function fn_searchAll() {
		location.href="${path}/spot/searchfoodCategoryList.do";
	}
</script>

	
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>