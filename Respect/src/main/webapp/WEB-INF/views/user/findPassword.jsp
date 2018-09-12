<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah" rel="stylesheet">
    <style>
        #logo{color:black; font-family:'Gloria Hallelujah', cursive;  font-size: 30px; }
        #logo img{width:40px;}
        button{background: rgb(200, 152, 152);}
        body{background: #f1f1f1;}
    </style>

</head>
<body>
    <div class="container mt-5 p-5">
        <div class="p-4"align="center"><label><a id="logo" class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath() %>/images/dog.png" > 제주도다</a></label></div>
        <div class="container col-sm-5 shadow p-4 rounded" style="background:white;">
            <form action="${path }/user/findPasswordEnd.do" method="post">
                <div class="form-group">
                    <label for="userId">ID </label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID를 입력하세요" required>
                </div>
                <div class="form-group">
                    <label for="userEmail">E-Mail</label>
                    <input type="email" class="form-control" id="userEmail" name="email" placeholder="회원가입 당시 입력한 E-Mail을 입력하세요" required>
                </div>
                <div class="form-group" align="center">
                    <button type="submit" class="btn ">비밀번호찾기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>