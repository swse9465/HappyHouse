<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글작성성공</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../../resources/assets/css/main.css" />
</head>
<body>
<%@ include file="../header.jsp" %>
<section id=banner></section>
<div class="container" align="center">
			<div class="col-lg-8" align="right">
			<strong>${userinfo.username}(${userinfo.userid})</strong>님 환영합니다.
			<a href="${root}/user.do?act=logout">로그아웃</a>
			<a href="${root}/user.do?act=info">회원정보</a>
			</div>
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h2>공지사항 작성 성공!!!</h2>      
	  </div>  
	  <p><a href="/listNotice">글목록</a></p>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
</c:if>