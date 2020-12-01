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
	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			document.getElementById("loginform").action = "${root}/login";
			document.getElementById("loginform").submit();
		}
	}

	function findUser() {
		document.getElementById("loginform").action = "${root}/mvfinduser";
		document.getElementById("loginform").submit();
	}

	function moveJoin() {
		document.getElementById("loginform").action = "${root}/mvjoin";
		document.getElementById("loginform").submit();

	}
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
			<c:if test="${sessionScope.userinfo != null }">
				<h1>환영합니다 ! ${sessionScope.userinfo.username } 님!</h1>
				<a href="${root}/logout">로그아웃</a> &nbsp;
		<a href="${root}/info">회원정보</a>
			</c:if>
			<c:if test="${sessionScope.userinfo == null }">
				<c:if test="${userinfo != null}">
					<script type="text/javascript">
						var pwdmsg = `비밀번호는 ${userinfo.userpwd} 입니다.`;
						alert(pwdmsg);
					</script>
				</c:if>

				<div class="container" align="center">
					<div class="col-lg-6" align="center">

						<form id="loginform" method="post" action="">
							<input type="hidden" name="act" id="act" value="">
							<div class="form-group" align="left" style="width: 50%">
								<label for="">아이디</label> <input type="text"
									class="form-control" id="userid" name="userid" placeholder=""
									value="${save_id}">
							</div>
							<div class="form-group" align="left" style="width: 50%">
								<label for="">비밀번호</label> <input type="password"
									class="form-control" id="userpwd" name="userpwd" placeholder=""
									onkeydown="javascript:if(event.keyCode == 13) {login();}">
							</div>
							<div class="form-group form-check" align="right">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox" id="idsave"
									name="idsave" value="saveok" ${save_btn}> 아이디저장
								</label>
							</div>

						</form>
					</div>
				</div>
				<footer style="padding-left:5%">
					<div class="form-group" align="center">
						<button type="button" onclick="javascript:login();">로그인</button>
						<button type="button" onclick="javascript:findUser();">아이디 / 비밀번호
							찾기</button>
						<button type="button" onclick="javascript:moveJoin();">회원가입</button>
					</div>
				</footer>
			</c:if>

		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>