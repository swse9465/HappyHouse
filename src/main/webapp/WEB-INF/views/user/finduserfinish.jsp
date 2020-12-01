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
	function retry() {

		document.getElementById("retry").action = "${root}/retry";
		document.getElementById("retry").submit();
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<h1>${msg }</h1>
			<c:if test="${findfail == null }">
				<c:forEach var="id" items="${idresults }">
				<h2><c:out value="${id }"></c:out></h2>
				</c:forEach>
				<h1>입니다</h1>
				<footer>
					<div class="form-group" align="center">
						<button type="button" onclick="location.href = '${root}/login'">로그인하러
							가기</button>
					</div>
				</footer>
			</c:if>
			<c:if test="${findfail != null }">
				<footer style="padding-left: 5%">
					<div class="form-control" align="center">
						<form id="retry" method="post" action="">
							<c:if test="${'id' eq findfail }">
								<div class="form-group" align="center">
									<input type="hidden" class="form-control" id="retryid"
										name="retryid" style="width: 50%" value="/mvfindid">
									<button type="button" onclick="javascript:retry();">아이디 다시 찾기</button>
								</div>
							</c:if>
							<c:if test="${'pwd' eq findfail }">
								<input type="hidden" class="form-control" id="retrypwd"
									name="retrypwd" value="/mvfindpwd">
								<button type="button" onclick="javascript:retry();">비밀번호
									다시 찾기</button>
							</c:if>
							<c:if test="${'error' eq error }">
								<button type="button" onclick="location.href='/'">
								홈으로 돌아가기</button>
							</c:if>
						</form>
					</div>
				</footer>

			</c:if>

		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>