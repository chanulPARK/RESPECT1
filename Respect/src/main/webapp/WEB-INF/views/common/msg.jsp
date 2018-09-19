<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>

<script>
	
	if(${msg!=null})
	{
		alert("${msg}");
	}
	
	location.href="${path}${loc}";
	if(${option!=null})
	{
		${option}
	}
</script>