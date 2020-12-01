<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>아이디 / 비밀번호 찾기 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../resources/assets/css/main.css" />
<script type="text/javascript">
	var urlpath = "<%=request.getAttribute("findfail")%>";
	$(function() {
		if(urlpath != null){
			acyncMovePage(urlpath);
			
		}
	});

	function acyncMovePage(url) {

		// ajax option

		var ajaxOption = {

			url : url,

			async : true,

			type : "POST",

			dataType : "html",

			cache : false

		};

		$.ajax(ajaxOption).done(function(data) {

			// Contents 영역 삭제

			$('#bodyContents').children().remove();

			// Contents 영역 교체

			$('#bodyContents').html(data);

		});

	}
</script>



</head>
<body>
	<%@ include file="../header.jsp"%>
	<section id="banner">
		<div class="inner">
			<input type="button" value="아이디 찾기" onclick="acyncMovePage('/mvfindid')">
			<input type="button" value="비밀번호 찾기" onclick="acyncMovePage('/mvfindpwd')">



			<div id="bodyContents"></div>

		</div>


	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>