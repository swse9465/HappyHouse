<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<c:if test="${cookie.save_id.value ne null}">
	<c:set var="save_id" value="${cookie.save_id.value}" />
	<c:set var="save_btn" value="checked" />
</c:if>

<head>
<title>HappyHouse</title>
<link rel="stylesheet" href="../../resources/assets/css/main.css" />
<script type="text/javascript">
	

</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<header>
				<h1>Welcome to Happy House</h1>
			</header>
				<h1>
				환영합니다 ! <br>
				회원가입이 완료되었습니다! <br>
				다시 로그인해주세요 !
				</h1>
			<c:if test="${sessionScope.userinfo == null }">

				<footer style="padding-left:5%">
					<div class="form-group" align="center">
						<button type="button" onclick = "location.href = '${root}/login'">로그인하러 가기</button>
					</div>
				</footer>
			</c:if>

		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>