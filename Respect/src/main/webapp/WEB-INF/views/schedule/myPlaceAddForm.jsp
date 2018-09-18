<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <title>내 장소 추가</title>
 </head>
 <body>
	<form action="${path}/spot/mySpotAdd.do" method="get">
           <div class="container">
	           <div class="form-group">
		           <label for="recipient-name" class="form-control-label">제목</label>
		           <input type="text" name="myTitle" class="form-control" id="recipient-name">
		       </div>
	           <div class="form-group">
					<label for="recipient-name" class="form-control-label">주소</label>
					<input type="text" name="myAddr" class="form-control" id="recipient-name" value="${detailAddr }" readonly>
			   </div>
			   <div class="form-group"><label for="message-text" class="form-control-label">상세설명</label>
					<textarea name="myContent" class="form-control" id="message-text" style="resize: none;"></textarea></div>
			   <div>
					<button type="submit" class="btn btn-warning">등록</button>
			   </div>
		    </div>
    </form>
  </body>
</html>