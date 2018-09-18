<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/mainPage",
			type:"get",
			dataType:"html",
			success:function(data)
			{
				console.log(data);
				$("#main").html(data);
			}
			
		});
	});
</script>

<section id="main">

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>