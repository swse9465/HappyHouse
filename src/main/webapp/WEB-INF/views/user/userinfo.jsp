<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY</title>
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
	function modify() {
		var pwd = document.getElementById("userpwd").value;
		var email = document.getElementById("email").value;
		var en = /[a-z]/i;
		var no = /[0-9]/;
		var nNo = /[^0-9]/;
		var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!en.test(pwd) || !no.test(pwd) || pwd.length < 6) {
			alert("비밀번호는 영문 숫자 포함 6자리 이상 입니다.");
			return false;
		} else if (document.getElementById("username").value == "") {
			alert("이름을 입력하세요.");
			return false;
		} else if (!em.test(email)) {
			alert("형식에 맞는 이메일을 입력하세요.");
			return false;
		} else if (nNo.test(document.getElementById("phone").value)) {
			alert("전화번호는 '-' 없이 숫자만 입력하세요.");
			return false;
		} else if (document.getElementById("phone").value == "") {
			alert("전화번호를 입력하세요.");
			return false;
		} else {
			document.getElementById("writeform").action = "${root}/modify";
			document.getElementById("writeform").submit();
			alert("수정이 완료되었습니다");
		}
	}
	function withdrawal() {
		var con = confirm("정말 탈퇴하시겠습니까?");
		if (con) {
			document.getElementById("writeform").action = "${root}/withdrawal";
			document.getElementById("writeform").submit();

		}
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section id="banner">
	<c:if test="${msg!=null}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<div class="inner">
		<div class="container text-center">
			<h1>회원 정보</h1>
			<div class="container" align="center">
				<div class="col-lg-6" align="center">
					<form id="writeform" method="post" action="" onsubmit="return modify();"
						style="padding-left: 35%">
						<div class="form-group" align="left">
							<label for="name">아이디</label> <input type="hidden"
								class="form-control" id="userid" name="userid"
								style="width: 50%" value="${userinfo.userid}">
							<div id="userinfo-userid">${userinfo.userid}</div>
							
						</div>
						<div class="form-group" align="left">
							<label for="name">비밀번호</label> <input type="password"
								class="form-control" id="userpwd" style="width: 50%"
								placeholder="영문 숫자 포함 6자리 이상" name="userpwd"
								value="${userinfo.userpwd}">
						</div>
						<div class="form-group" align="left">
							<label for="content">이름</label> <input type="text"
								class="form-control" id="username" style="width: 50%"
								placeholder="User Name" name="username"
								value="${userinfo.username}">
						</div>
						<div class="form-group" align="left">
							<label for="content">이메일</label> <input type="text"
								class="form-control" id="email" style="width: 50%"
								placeholder="" ____ @__.__"" name="email"
								value="${userinfo.email}">
						</div>
						<div class="form-group" align="left">
							<label for="content">전화번호</label> <input type="text"
								class="form-control" id="phone" style="width: 50%"
								placeholder="" name="phone" value="${userinfo.phone}">
						</div>
						<div style="margin-left: -15%; float: left">
							<button type="submit" >수정</button>
							<button type="button" onclick="javascript:withdrawal();">탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>