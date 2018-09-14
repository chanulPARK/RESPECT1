<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	td>a{
		text-decoration: none;
		color:black;
	}
</style>
<script type="text/javascript">
	function fn_goNoticeWrite() {
		
		location.href='${pageContext.request.contextPath}/notice/noticeWrite.do';
	}
</script>

	<div class="container">
        <h4 class="text-center pt-5">공지</h1>
        <p class="text-center pt-4">제주도의 공지사항을 알려드립니다</p>
        <input type="button" value="글쓰기" style="float:right;" class="btn btn-outline-warning mb-3" onclick="fn_goNoticeWrite()"/>
        <div class="table-responsive">
            <table class="table text-center">
                <thead>
                    <tr id="ta-header">
                        <th>글번호</th>
                        <th style="width: 400px;">제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="nb">
                    <tr>
                        <td>${nb.NOTICENO}</td>
                        <td><a href="${pageContext.request.contextPath}/notice/notice-view.do?noticeNo=${nb.NOTICENO}">${nb.TITLE}</a></td>
                        <td>${nb.WRITEDATE}</td>
                        <td>${nb.HITSCOUNT}</td>
                        
                        <td align="center">
				            <c:if test="${nb.FILECOUNT>0}">
				                <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/image/if_files-folders-48_808600.png">
				            </c:if>
				        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <nav class="d-flex justify-content-center pt-4 pb-5">
            <!-- <ul class="pagination">
                <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li class="page-item"><a class="page-link">1</a></li>
                <li class="page-item"><a class="page-link">2</a></li>
                <li class="page-item"><a class="page-link">3</a></li>
                <li class="page-item"><a class="page-link">4</a></li>
                <li class="page-item"><a class="page-link">5</a></li>
                <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
            </ul> -->
            ${pageBar}<br>
        </nav>


        <div class="row py-3" style="background-color:#efefef;">
            <div class="col d-flex align-content-center justify-content-end">
                <select><option value="12" selected="">제목</option><option value="13">내용</option></select>
            </div>
            <div class="col-xl-4 text-center"><input type="text" class="form-control"></div>
            <div class="col text-left"><button class="btn btn-warning" type="button">검색</button></div>
        </div>
        
    </div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp"%>