<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"></c:set>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<style>
    th{
        font-size: 18px;
        border-right: 1px solid #e5e5e5;
        width: 100px;
    }
    pre{
        font-size: 16px;
    }
</style>

<script>
	function fileDownload(oName, rName) {
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href = "${pageContext.request.contextPath}/notice/fileDownload.do?oName="
				+ oName + "&rName=" + rName;
	}
</script>
<body>
    <div class="container">
        <div class="row my-5">
            <div class="col text-center">
             <h4>공지</h4>
             <p class="mt-3">제주도의 공지사항을 알려드립니다.</p>
            </div>
        </div>

        <div class="table">
            <table class="table">
                <tbody>
               	<c:forEach items="${list}" var="nv">
                    <tr style="border-top: 2px solid black;">
                    	<th>글번호</th>
                    	<td>${nv.noticeNo}</td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                        <td>${nv.title}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <p>
				                ${nv.content}
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>관리자</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>${nv.writeDate}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #e5e5e5;">
                        <th>조회수</th>
                        <td>${nv.hitsCount}</td>
                    </tr>
                    
                    <tr>
                    	<th>첨부파일</th>
                    	<td>
                    		<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				                <button type="button" class="btn btn-outline-warning btn-block"
				                    onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
				                   	 첨부파일${vs.count} - ${a.originalFileName }</button>
				            </c:forEach>
                    	</td>
                    </tr>
                    
                </tbody>
            </table>
        </div>

        <div class="row text-center mt-5">
            <div class="col text-right" >
                <a class="btn btn-warning" href="#">수정</a>
            </div>
            <div class="col text-left">
                <a class="btn btn-warning" href="${path}/notice/notice-del.do?noticeNo=${nv.noticeNo}">삭제</a>
            </div>
        </div>
		</c:forEach>
    </div>

</body>
</html>