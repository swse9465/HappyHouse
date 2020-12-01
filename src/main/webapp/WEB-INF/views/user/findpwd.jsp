<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호찾기</title>
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
	function find() {
		var email = document.getElementById("email").value;
		var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요.");
			return false;
		} else if (!em.test(email)) {
			alert("형식에 맞는 이메일을 입력하세요.");
			return false;
		} else {
			document.getElementById("writeform").action = "${root}/findpwd";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<div class="container text-center">
	<div class="inner">
		<h2>비밀번호 찾기</h2>
		<form id="writeform" method="post" action="" style="padding-left: 35%" onsubmit="return find();">
			<input type="hidden" name="act" id="act" value="find">
			<div class="form-group" align="left">
				<label for="name">아이디</label> <input type="text"
					class="form-control" id="userid" style="width: 50%" placeholder="아이디를 입력하세요"
					name="userid" onkeyup='saveValue(this);'>
			</div>
			<div class="form-group" align="left">
				<label for="content">이메일</label> <input type="text"
					class="form-control" id="email" style="width: 50%"
					placeholder="회원가입시 작성했던 메일" name="email" onkeyup='saveValue(this);'>
			</div>
			<div align="center" style="margin-left:-50%; margin-top: 10%">
				<h3>비밀번호를 조회하겠습니까?</h3>
				<button type="submit" ">비밀번호 찾기</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>