<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/assets/css/main.css" />
</head>
<body>
<%@ include file="../header.jsp" %>
<section id=banner></section>
<h3 style="color:#ffccff">삐빅 - 에러입니다!</h3>
<h3 style="color:#0073e6">삐빅 - 에러입니다!</h3>
    <p>에러메세지 : ${msg}</p>
<%@ include file="../footer.jsp" %>
</body>
</html>