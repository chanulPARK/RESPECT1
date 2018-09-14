<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<main class="page landing-page">
	<section class="clean-block slider dark" style="padding:0;margin:0 0 100px;">

		<img src="${path }/resources/img/spot/성산일출봉.gif" style="width:100%;">
		</section>
	<section id="map-index">
	    <div class="container">
	        <h2>제주도 모든 여행지를 한 눈에…<br></h2>
	        <h5>내가 가본 제주는 어디까지일까? 수많은 제주의 아름다운 여행지를 취향에 맞게 선택해보자. 368개의 크고 작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른 바다…. 제주의 보석 같은 여행지가 여러분의 선택을 기다린다.<br></h5>
	        	<img src="${path }/resources/img/spot/지도.JPG" class="map">
	        	<button class="btn map-btn btn-warning" type="button">전체지역</button>
       	</div>
	</section>
	<section id="map-tag">
	    <div class="container">
	        <div class="row map-row">
	            <div class="col-xl-1 tag-all" style="padding:0px;">
	                <h5>전체</h5>
	            </div>
	            <div class="col">
	                <div class="row">
	                    <div class="col">
	                        <h5>자연</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>섬속의 섬</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>템플스테이</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	                <div class="row">
	                    <div class="col">
	                        <h5>문화관광</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>도보</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	                <div class="row">
	                    <div class="col">
	                        <h5>레저/체험<br></h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>포토/스팟</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	                <div class="row">
	                    <div class="col">
	                        <h5>테마관광지</h5>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col">
	                        <h5>4-3 70주년</h5>
	                    </div>
	                </div>
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
				<h4>전체&nbsp;<small>${totalContents }</small></h4>
				
		        <div class="btn-group">
		            <div class="dropdown">
		            <button class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" type="button">정렬기준</button>
		                <div class="dropdown-menu" role="menu">
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">최신순</a>
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">좋아요순</a>
			                <a class="dropdown-item" role="presentation" href="#" style="font-size: .875rem">리뷰순</a>
		                </div>
		            </div>&nbsp;&nbsp;
		            <input type="text" placeholder="검색어"><button class="btn btn-secondary" type="button">검색</button>
	            </div>
            </div>
            
            
	        <div class="card-deck row" style="display: flex;flex-wrap: wrap;">
	        	
	        	<c:forEach items="${list }" var="p">
	        	
	        	<div class="col-4 mt-4 px-3">
	        	
	        	<div class="card m-0">
	        		<%-- <img class="card-img-top" src="${path }/resources/upload/spot/thumbnail/${p.THUMBNAIL}"> --%>
	        		<img class="card-img-top" src="${path }/resources/upload/spot/thumbnail/${p.thumbnail}" style="height: 200px">
	                <div class="card-body">
	                    <h4 class="text-center card-title"><a href="${path }/spot/spotView.do?spotno=${p.placeno}">${p.title}</a></h4>
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
	            
	            <%-- <div class="card"><img class="card-img-top w-100 d-block" src="${path }/resources/img/spot/우도.jpg" style="height:262px;">
	                <div class="card-body">
	                    <h4 class="text-center card-title">우도(해양도립공원)</h4>
	                    <p class="text-center card-text" style="margin:0;">섬속의섬 &gt; 우도</p>
	                    <p class="text-center" style="color:#ffb53c;">#섬속의섬 #경관/포토 #아이</p>
	                    <div class="row row-icon">
	                        <div class="col"><i class="fa fa-thumbs-o-up icon"></i>
	                            <p>좋아요</p>
	                        </div>
	                        <div class="col"><i class="fa fa-heart icon"></i>
	                            <p>찜하기</p>
	                        </div>
	                        <div class="col"><i class="fa fa-commenting-o icon"></i>
	                            <p>리뷰</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="card"><img class="card-img-top w-100 d-block" src="${path }/resources/img/spot/카멜리아힐.jpg">
	                <div class="card-body">
	                    <h4 class="text-center card-title">카멜리아힐</h4>
	                    <p class="text-center card-text" style="margin:0;">서귀포시&gt; 안덕</p>
	                    <p class="text-center" style="color:#ffb53c;">#경관/포토 #커플 #아이</p>
	                    <div class="row row-icon">
	                        <div class="col"><i class="fa fa-thumbs-o-up icon"></i>
	                            <p>좋아요</p>
	                        </div>
	                        <div class="col"><i class="fa fa-heart icon"></i>
	                            <p>찜하기</p>
	                        </div>
	                        <div class="col"><i class="fa fa-commenting-o icon"></i>
	                            <p>리뷰</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="card"><img class="card-img-top w-100 d-block" src="${path }/resources/img/spot/월정리해변.jpg">
	                <div class="card-body">
	                    <h4 class="text-center card-title">월정리해변</h4>
	                    <p class="text-center card-text" style="margin:0;">제주시&gt; 구좌</p>
	                    <p class="text-center" style="color:#ffb53c;">#해변 #경관/포토 #커플</p>
	                        <div class="row row-icon">
	                            <div class="col"><i class="fa fa-thumbs-o-up icon"></i>
	                                <p>좋아요</p>
	                            </div>
	                            <div class="col"><i class="fa fa-heart icon"></i>
	                                <p>찜하기</p>
	                            </div>
	                            <div class="col"><i class="fa fa-commenting-o icon"></i>
	                                <p>리뷰</p>
	                            </div>
	                        </div>
	                    </div>
	                </div> --%>
	            </div>
	            ${pageBar }<br/>
	            <div class="page">
	                <nav>
	                    <ul class="pagination">
	                        <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
	                        <li class="page-item"><a class="page-link">1</a></li>
	                        <li class="page-item"><a class="page-link">2</a></li>
	                        <li class="page-item"><a class="page-link">3</a></li>
	                        <li class="page-item"><a class="page-link">4</a></li>
	                        <li class="page-item"><a class="page-link">5</a></li>
	                        <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	                    </ul>
	                </nav>
	            </div>
	        </div>
	        <button class="btn btn-warning btn-block" type="button" onclick="fn_spotEnrollgo()">장소 등록</button>
	    </section>
	</main>
	
<script>
	function fn_spotEnrollgo() {
	location.href="${pageContext.request.contextPath}/spot/spotEnroll.do";
	}
</script>

	
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>