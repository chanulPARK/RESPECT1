<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>

<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
		<br>
		
		<div class="card mb-4">
			<div class="col-sm-3" style="float:right;">
				<button class="btn btn-success" onclick="sendM()">쪽지보내기</button>
		    </div>
	        <div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">닉네임</label>
				   	<div class="col-sm-3">
				       	${meet.nickName }
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">성별</label>
				   	<div class="col-sm-3">
				       	${meet.gender=='M'?'남':'여' }자
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">나이</label>
				   	<div class="col-sm-3">
				       	${meet.age} 살
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">날짜</label>
				   	<div class="col-sm-3">
				       	${meetDate }
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">시간</label>
				   	<div class="col-sm-3">
				       	${meet.meetTime }
				    </div>
				</div>
			</div>
		</div>
		<hr>
		<div id="bung-content">
			${meet.content }
		</div>
		<hr>
		<c:if test="${userLoggedIn.userId==meet.userId }">
			<div class="justify-content-center">
				<button class="btn btn-primary" onclick="meetUpdate(${meet.meetNo})" value="${meet.meetNo }">수정</button>
				<button class="btn btn-danger" onclick="meetDelete(${meet.meetNo})" value="${meet.meetNo }">삭제</button>
			</div>
		</c:if>
		<!-- 댓글영역 -->
		
		
	</div>
	<br><br><br>
	<script>
		function sendM(){
			if(${userLoggedIn==null})
			{
				alert("로그인 후 이용 가능합니다.");
				location.href="${path}/user/userLogin.do";
				return;
			}else{
				
				var bool = confirm("쪽지를 보내시겠습니까?");
				
				if(bool)
				{
					location.href="${path}/message/sendMessage.do";
				}
				else
				{
					alert("취소되었습니다.");
					e.preventDefault();
				}
			}
		}
		
		function meetUpdate(meetNo)
		{
			
			var bool = confirm("정말 수정하시겠습니가?");
			
			if(bool)
			{
				location.href="${path}/meet/meetUpdate.do?meetNo="+meetNo;
			}
			else
			{
				alert("취소되었습니다.");
				e.preventDefault();
			}
		}
		
		function meetDelete(meetNo)
		{
			console.log(meetNo);
			var bool = confirm("정말 삭제하시겠습니가?");
			if(bool)
			{
				location.href="${path}/meet/meetDelete.do?meetNo="+meetNo;
			}
			else
			{
				alert("취소되었습니다.");
				e.preventDefault();
			}
		}
		
		
		
	</script>
	
</section>

<!-- 푸터 -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





