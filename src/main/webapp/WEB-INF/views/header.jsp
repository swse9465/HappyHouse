<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
</head>

<body>
	<header id="header">
		<div class="inner">
			<a href="${root}/login" class="logo"><strong>Happy House</strong></a>
			<nav id="nav">
				<a href="${root }/login">Home</a> &nbsp; <a href="${root}/getDeal">매매가검색</a>
				&nbsp; <a href="${root}/listNotice">공지사항</a> &nbsp; <a href="/qna">Q&A</a>
				&nbsp;

			</nav>
		<c:if test="${userinfo != null}">
		<div class="inner" align="center">
			<div class="container" >
				<div class="col-lg-8" align="right">
					<strong onclick="location.href ='/info'">${userinfo.username}(${userinfo.userid})</strong>님 환영합니다.
					 <a	href="/logout">로그아웃</a>
					 <a href="/info">회원정보</a>
				</div>
				<br>
			</div>

		</div>
		</c:if>
		</div>
	</header>
</body>
</html>