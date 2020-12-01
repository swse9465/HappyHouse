<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>아이디 찾기</title>
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
		var phone = document.getElementById("phone").value;
		var no = /[^0-9]/;
		if (document.getElementById("username").value == "") {
			alert("이름을 입력하세요.");
			return false;
		} else if (no.test(phone)) {
			alert(phone);
			alert("전화번호는 숫자만 입력하세요.");
			return false;
		} else {
			document.getElementById("writeform").action = "${root}/findid";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<div class="container text-center">
	<div class="inner">
		<h2>아이디찾기</h2>
		<form id="writeform" method="post" action="" style="padding-left: 35%" onsubmit="return find();">
			<input type="hidden" name="act" id="act" value="find">
			<div class="form-group" align="left">
				<label for="name">이름</label> <input type="text"
					class="form-control" id="username" style="width: 50%" placeholder="이름을 입력하세요"
					name="username" onkeyup='saveValue(this);'>
			</div>
			<div class="form-group" align="left">
				<label for="content">전화번호</label> <input type="text"
					class="form-control" id="phone" style="width: 50%"
					placeholder="'-'없이 숫자만 입력하세요" name="phone" onkeyup='saveValue(this);'>
			</div>
			<div align="center" style="margin-left:-50%; margin-top: 10%">
				<h3>아이디를 찾으시겠습니까?</h3>
				<button type="submit" >아이디 찾기</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>