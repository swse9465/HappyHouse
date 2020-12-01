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
	function join() {
		var pwd = document.getElementById("userpwd").value;
		var pwdcheck = document.getElementById("userpwdcheck").value;
		var email = document.getElementById("email").value;
		var en = /[a-z]/i;
		var no = /[0-9]/;
		var nNo = /[^0-9]/;
		var em = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요.");
			return false;
		} else if (!en.test(pwd) || !no.test(pwd) || pwd.length < 6) {
			alert("비밀번호는 영문 숫자 포함 6자리 이상 입니다.");
			return false;
		} else if(pwd != pwdcheck){
			alert("비밀번호가 서로 일치하지 않습니다.");
			return false;
		} else if (document.getElementById("username").value == "") {
			alert("이름을 입력하세요.");
			return false;
		} else if (!em.test(email)) {
			alert("형식에 맞는 이메일을 입력하세요.");
			return false;
		} else if (nNo.test(document.getElementById("phone").value)) {
			alert("전화번호는 숫자만 입력하세요.");
			return false;
		} else if (document.getElementById("phone").value == "") {
			alert("전화번호를 입력하세요.");
			return false;
		} else {
			document.getElementById("writeform").action = "/join";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section id=banner>
		<c:if test="${msg!=null}">
			<script>
				alert("${msg}");
			</script>
		</c:if>
		<div class="inner">
			<div class="container text-center">
				<h1>회원가입</h1>
				<form id="writeform" method="post" action=""
					style="padding-left: 35%" onsubmit="return join()">
					<input type="hidden" name="act" id="act" value="join">
					<div class="form-group" align="left">
						<label for="name">아이디</label> <input type="text"
							class="form-control" id="userid" style="width: 50%"
							placeholder="아이디 입력" name="userid" onkeyup='saveValue(this);'>
					</div>
					<div class="form-group" align="left">
						<label for="name">비밀번호</label> <input type="password"
							class="form-control" id="userpwd" style="width: 50%"
							placeholder="영문 숫자 포함 6자리 이상" name="userpwd"
							onkeyup='saveValue(this);'>
					</div>
					<div class="form-group" align="left">
						<label for="name">비밀번호 확인</label> <input type="password"
							class="form-control" id="userpwdcheck" style="width: 50%"
							placeholder="비밀번호를 똑같이 재입력해주세요" 
							onkeyup='saveValue(this);'>
					</div>
					<div class="form-group" align="left">
						<label for="content">이름</label> <input type="text"
							class="form-control" id="username" style="width: 50%"
							placeholder="User Name" name="username"
							onkeyup='saveValue(this);'>
					</div>
					<div class="form-group" align="left">
						<label for="content">이메일</label> <input type="text"
							class="form-control" id="email" style="width: 50%"
							placeholder="____@__.__" name="email" onkeyup='saveValue(this);'>
					</div>
					<div class="form-group" align="left">
						<label for="content">전화번호</label> <input type="text"
							class="form-control" id="phone" style="width: 50%"
							placeholder="숫자만 입력하세요" name="phone" onkeyup='saveValue(this);'>
					</div>
					<div align="left">
						<button type="submit">등록</button>
						<button type="reset">초기화</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>