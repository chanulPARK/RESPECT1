<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous">
</script>

<link href="${path }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js"></script>

</head>


<section>
	<div class="container">
	
		<div id="bung-img" align="center">
			<img alt="" src="http://placehold.it/800x300">
		</div>
		<hr>
		<div class="card mb-4">
	        <div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">이름</label>
				   	<div class="col-sm-3">
				       	<input type="text" class="form-control">
				    </div>
				    <div class="col-sm-3">
				       	<button class="btn btn-outline-success" onclick="">쪽지보내기</button>
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">성별</label>
				   	<div class="col-sm-3">
				       	<input type="text" class="form-control">
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">나이</label>
				   	<div class="col-sm-3">
				       	<input type="text" class="form-control">
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">기간</label>
				   	<div class="col-sm-3">
				       	<input type="text"
							    data-range="true"
							    data-multiple-dates-separator=" - "
							    data-language="en"
							    class="datepicker-here form-control"/>
				    </div>
				</div>
			</div>
		</div>
		<hr>
		<div id="bung-content">
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
			내용<br>
		</div>
		
		<!-- 댓글영역 -->
		
		
	</div>
	<br><br><br>
	
	
</section>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>






