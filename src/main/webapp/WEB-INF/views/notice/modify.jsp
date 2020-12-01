<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<script laguage="javascript">
		alert("로그인후 이용해주세요");
		window.location='${root}/index.jsp';
	</script>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../../resources/assets/css/main.css" />
  <script type="text/javascript">
  function writeNotice() {
	if(document.getElementById("subject").value == "") {
		alert("제목 입력!!!!");
		return;
	} else if(document.getElementById("content").value == "") {
		alert("내용 입력!!!!");
		return;
	} else {
	  	document.getElementById("writeform").action = "/modifyNotice";
	  	document.getElementById("writeform").submit();
	}
  }
  function deleteNotice(){
	var no = "<c:out value='${notice.noticeno}'/>";
	location.href="deleteNotice?noticeno="+no;
  }
  function list(){
	  location.href="/listNotice";
  }
  </script>
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
	<div class="col-lg-6" align="center">
		<br>
		<h2>공지사항 수정</h2>
		<form id="writeform" method="post" action="">
		<input type="hidden" name="act" id="act" value="modifynotice">
		<input type="hidden" name="noticeno" id="noticeno" value="${notice.noticeno}">
			<div class="form-group" align="left">
				<label for="subject" style="color: #6cc091; text-shadow: 0 0 2.8px white">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${notice.subject}">
			</div>
			<div class="form-group" align="left">
				<label for="content" style="color: #6cc091; text-shadow: 0 0 2.8px white">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${notice.content}</textarea>
			</div>
			<button type="button" onclick="javascript:writeNotice();">글 수정</button>
			<button type="button" onclick="javascript:deleteNotice();">삭제</button>
			<button type="button" onclick="javascript:list();">취소</button>
<!-- 			<button type="reset">초기화</button> -->
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
</c:if>