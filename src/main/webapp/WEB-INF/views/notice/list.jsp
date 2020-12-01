<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<script type="text/javascript">
		alert("로그인후 이용해주세요");
		window.location = '/';
	</script>

</c:if>
<c:if test="${userinfo != null}">
	<!DOCTYPE html>
	<html lang="ko">
<head>
<title>공지사항</title>
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
	function movewrite() {
		location.href = "${root}/moveWriteNotice";
	}
	function searchNotice() {
		var id = document.getElementById("keyword").value;
		console.log(id);
		if (document.getElementById("keyword").value == "") {
			alert("검색어입력!!");
			return;
		}
		document.getElementById("searchform").action = "/listNotice";
		document.getElementById("searchform").submit();
	}
	function pageMove(pg) { 
		document.getElementById("pg").value=pg;
		document.getElementById("pageform").action = "/listNotice";
		document.getElementById("pageform").submit();
	}
</script>
<style type="text/css">
#key {
	width: 15%;
	float: left;
	margin-left: 20%;
	margin-top: 15px;
	height: 45px;
}

#keyword {
	width: 35%;
	float: left;
	margin-left: 15px;
	margin-top: 15px;
	height: 45px;
}

#search {
	float: left;
	margin-left: 15px;
}

#writeDiv {
	float: right;
}
.pagination{display: inline-block; margin: 0 auto;} 
.page-item{display: inline-block;}
</style>
</head>


<body>
	<%@ include file="../header.jsp"%>
	<section id="banner"></section>
	<section>
		<form name="pageform" id="pageform" method="post" action="">
				<input type="hidden" name="pg" id="pg" value="">
				<input type="hidden" name="key" id="key" value="${key}">
				<input type="hidden" name="word" id="word" value="${word}">
		</form>
		
		<div class="col-lg-8" align="center" style="margin: auto;">
<!-- 			<div class="col-lg-8" align="center"> -->
				<h2>공지사항</h2>
				<form id="searchform" method="get" class="form-inline" action="">
					<input type="hidden" name="act" id="act" value="listnotice">
					<div id="writeDiv">
						<button type="button" id="write" class="btn btn-link"
							onclick="javascript:movewrite();">글쓰기</button>
					</div>
					<table class="table table-borderless">
						<tr>
							<td align="center">
								<select name="key" id="key">
										<option value="subject">제목</option>
										<option value="userid" selected="selected">아이디</option>
										<option value="noticeno">글번호</option>
								</select> 
							<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="keyword"> &nbsp;
								<button type="button" class="btn" id="search"
									onclick="javascript:searchNotice();">검색</button>
							</td>
						</tr>
					</table>
				</form>
				<c:if test="${notices.size() != 0}">
					<table class="table table-active">
						<thead align="center">
							<tr>
								<th>글 번호</th>
								<th colspan="7">제목</th>
								<th>작성자</th>
								<th colspan="3">작성일</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach var="notice" items="${notices}">
								<tr class="table-info">
									<td>${notice.noticeno}</td>
									<td colspan="7" class="table-success"><a href="/readNotice?noticeno=${notice.noticeno}">${notice.subject}</a>
									</td>
									<td>${notice.userid}</td>
									<td colspan="3" align="center">${notice.regtime}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</c:if>
				<c:if test="${notices.size() == 0}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info" align="center">
								<td>작성된 글이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:if>
			<hr>
			<div>
				${navigation.navigator}
			</div>
			<hr>
<!-- 			</div> -->
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</c:if>
</html>
