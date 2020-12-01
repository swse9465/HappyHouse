<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>매매정보 상세조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../resources/assets/css/main.css" />
<script type="text/javascript">
		function getDealInfo() {
			document.getElementById("searchform").action = "${root}/getDeal";
			document.getElementById("searchform").submit();
		}
		function moveLogin(){
			location.href="/";
		}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section id=banner></section>
<div align="center">
<div>
	<c:if test="${userinfo == null}">
			<br>
			<h3>로그인이 필요한 서비스 입니다.</h3>
			<button type="button"  onclick="javascript:moveLogin();">로그인 창으로 돌아가기</button>
			<br>
	</c:if>
	<c:if test="${userinfo != null}">
	<br>
	<h3> Happy House</h3>
	<h4>행복한 우리집</h4>
	<div class="getdeal" align="center">
	<form id="searchform" method="post" class="form-inline" action="">
		<input type="hidden" name="act" value="list">
		<table class="table table-borderless">
			<tr>
				<td align="center">
					<select name="key" id="key" style="width:10%; float: left; margin-left: 30%; margin-right: -20%;">
						<option value="all">all</option>
						<option value="apt">아파트별</option>
						<option value="dong">동별</option>
					</select> 
					<input type="text" style="width:35%" placeholder="검색어 입력." name="word" id="word">
					<button type="button" style="margin-top: 10px" onclick="javascript:getDealInfo();">검색</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<img alt="house_image" src="${houseInfo.img}" onError="this.onerror=null; this.src ='../../resources/img/다세대주택.jpg'"
	width="800" height="400" align="center"/>
	
	<div style="width:80%">
		<table class="table table-active">
			<tbody>
				<tr class="table-info" align="center">
					<td width="10%"><strong>등록 번호</strong></td>
					<td width="20%"><strong>동</strong></td>
					<td width="40%"><strong>아파트명</strong></td>
					<td width="10%"><strong>지번</strong></td>
					<td width="10%"><strong>건축년도</strong></td>
					<td width="10%"><strong>법정동코드</strong></td>
				</tr>
				<tr class="table-success" align="center">
					<td width="10%"><strong>${houseInfo.no}</strong></td>
					<td width="20%"><strong>${houseInfo.dong}</strong></td>						
					<td width="40%"><strong>${houseInfo.aptName}</strong></td>
					<td width="10%"><strong>${houseInfo.jibun}</strong></td>	
					<td width="10%"><strong>${houseInfo.buildYear}</strong></td>	
					<td width="10%"><strong>${houseInfo.code}</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
	</c:if>
</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>