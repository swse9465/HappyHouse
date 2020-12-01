<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>매매정보</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../resources/assets/css/main.css" />
	<script type="text/javascript">
			function getDealInfo() {
				if(document.getElementById("sword").value == "") {
					if(document.getElementById("skey").value != "all"){
					alert("검색어 입력!!!");
					return;
					}
				}
				document.getElementById("searchform").action = "${root}/getDeal";
				document.getElementById("searchform").submit();
			}
			function pageMove(pg) { 
				document.getElementById("pg").value=pg;
				document.getElementById("pageform").action = "${root}/getDeal";
				document.getElementById("pageform").submit();
			}
	</script>
	<style type="text/css">
  		.pagination{justify-content: center;}  
		.sidebar{float:right; margin-left: 2%; width: 18%; margin-top: 20px}
		#map{width: 75%; height: 800px; margin-left: 2.5%; float:right;}
		.title{margin-bottom: 15px;}
		.content{margin-bottom: 5px;}
		.line{margin: 1em 0;}
		#searchform{justify-content: center;}
		#skey{width: 10%; margin-right: 20px;}
		#sword{width: 25%; margin-right: 20px;}
	</style>
</head>
<body>
<%@ include file="../header.jsp" %>
	<section id="banner"></section>
		<form name="pageform" id="pageform" method="post" action="">
				<input type="hidden" name="pg" id="pg" value="">
				<input type="hidden" name="key" id="key" value="${key}">
				<input type="hidden" name="word" id="word" value="${word}">
		</form>
	<div align="center">
		<div class="getdeal" align="center">
			<form id="searchform" method="post" class="form-inline" action="">
			  	<input type="hidden" name="pg" id="pg" value="1"> 
			  	<select name="key" id="skey" style="">
					<option value="all" <c:if test="${key == 'all'}">selected</c:if>>all</option>
					<option value="apt" <c:if test="${key == 'apt'}">selected</c:if>>아파트별</option>
					<option value="dong" <c:if test="${key == 'dong'}">selected</c:if>>동별</option>
				</select> 
				<input type="text" placeholder="검색어 입력." name="word" id="sword" value="${word}" onkeydown="javascript:if(event.keyCode == 13) {getDealInfo();}">
				<button type="button" style="margin-left: 0" onclick="javascript:getDealInfo();">검색</button>
			</form>
		</div>
	</div>
	<section>
		<div>
			<div id="map"></div>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBa5AKjfGHNgd3Xob3lCO3VLBrs4ADb-k&callback=initMap"></script>
			<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
			<script>
				var locations = [];
				var apt = [];
				var price = [];
				<c:forEach items="${position}" var="pos">
					var num1 = ${pos.lat};
					var num2 = ${pos.lng};
					locations.push({lat : num1,	lng : num2});
				</c:forEach>
				
				console.log(Array.isArray(locations));
				console.log(Array.isArray(apt));
				
				<c:forEach items="${dealInfo}" var="d">
					var temp = '${d.aptName}';
					var num = '${d.dealAmount}'.trim();
					apt.push(temp);
					price.push(num);
				</c:forEach>
				
				console.log(apt);
				console.log(price);
				
				var map;
				function initMap() {
					var center = {lat : locations[0].lat, lng : locations[0].lng}
					map = new google.maps.Map(document.getElementById('map'), {
						zoom : 12, center : center
					});
					
					var infowindow = new google.maps.InfoWindow();
					var marker;
					for(var i=0; i<locations.length; i++){
						marker = new google.maps.Marker({
							position : locations[i],
							label : String(i + 1),
							title : name[i]
						});
						marker.addListener('click', (function(marker, i) {
							return function() {
								infowindow.setContent("<center>"+apt[i]+"<br>거래 금액: "+price[i]+"</center>");
								infowindow.open(map, marker);
							}
							
						}) (marker, i));
						if(marker){
							marker.addListener('click', function(){
								map.setZoom(15);
								map.setCenter(marker.getPosition());
							})
						}
						marker.setMap(map);
					}
				}
				
			</script>

		</div>
		<aside class="sidebar">
			<c:forEach var="deal" items="${dealInfo}" varStatus="status" >
			<div class="infoBox">
				<h4 class="title"><a href="/getInfo?dong=${deal.dong}&AptName=${deal.aptName}">${status.count}.${deal.aptName}</a></h4>
				<h5 class="content">${deal.dong}</h5>
				<h5 class="content">거래 금액 : ${deal.dealAmount}</h5>
				<h5 class="content">거래 종류 : ${deal.type}</h5>
			</div>
			<hr class="line">
			</c:forEach>
		</aside>
		<hr>
		<div class="text-center" style="clear: both;">${navigation.navigator}</div>
		<hr>
	</section>

	<%@ include file="../footer.jsp" %>
</body>
</html>