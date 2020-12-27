<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  123, 166 Google API Key 입력후 테스트 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BackEnd Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index">Happy House</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"	aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" id="login"
						href="management.mem">회원관리</a></li>
					<li class="nav-item"><a class="nav-link" href="signup.mem">회원가입</a>
					</li>
					<li class="nav-item"><jsp:include page="loginCheck.jsp" /></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- 상단 contents end -->

<div class="container" style="width: 100%;">
	<!-- tmp -->
	<header>
	<hr>
	<hr>
	</header>
	<!-- tmp -->
	<!-- 중앙 contents start -->
	<div class="row">
		<!-- 중앙 left contents start -->
		<div style="float:left; width: 30%;">
			<table class="table mt-2">
				<thead>
					<tr>
						<th>법정동</th>
						<th>아파트이름</th>
					</tr>
				</thead>
				<tbody id="searchResult">
				</tbody>
			</table>
			
		</div>
		<!-- 중앙 left contents end -->
	
		<div style="width: 70%;">
		<section id="index_section">
			<div class="card col-sm-12 mt-1"> <!-- style="min-height: 60px;"> -->
				<div class="card-body">
				<script>
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){
					$.get("${pageContext.request.contextPath}/map/sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
							});//each
						}//function
						, "json"
					);//get
				});//ready
				$(document).ready(function(){
					$("#sido").change(function() {
						$.get("${pageContext.request.contextPath}/map/gugun/" + $("#sido").val()
								,function(data, status){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#gugun").change(function() {
						$.get("${pageContext.request.contextPath}/map/dong/" + $("#gugun").val()
								,function(data, status){
									$("#dong").empty();
									$("#dong").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#dong").change(function() {
						initMap();
						$.get("${pageContext.request.contextPath}/map/apt/" +$("#dong").val()
								,function(data, status){
									$("#searchResult").empty();
									$("#searchDetailResult").empty();
									$.each(data, function(index, vo) {
										let str = "<tr>"
										+ "<td onClick=\"listDealInDong('"
										+ vo.dong + "')\">" + vo.dong + "</td>"
										+ "<td onClick=\"listDealInApt('"
										+ vo.dong + "', '" + vo.aptName +"')\">" + vo.aptName + "</td></tr>";
										$("#searchResult").append(str);
									});//each
									geocode(data);
								}//function
								, "json"
						);//get
					});//change
				});//ready
				function listDealInDong(dong) {
					$.get("${pageContext.request.contextPath}/map/deal/dong/" + dong
							,function(data, status){
								$("#searchDetailResult").empty();
								$.each(data, function(index, vo) {
									let str = "<tr>"
									+ "<td>" + vo.no + "</td>"
									+ "<td>" + vo.aptName + "</td>"
									+ "<td>" + vo.dealAmount + "</td>"
									+ "<td>" + vo.area + "</td>"
									+ "<td>" + vo.dealYear + "."+ vo.dealMonth
									+ "." + vo.dealDay + "."+"</td></tr>";
									$("#searchDetailResult").append(str);
								});//each
							}//function
							, "json"
					);//get
				}
				function listDealInApt(dong, apt) {
					$.get("${pageContext.request.contextPath}/map/deal/dong/" + dong+ "/apt/" + apt
							,function(data, status){
								$("#searchDetailResult").empty();
								$.each(data, function(index, vo) {
									let str = "<tr>"
									+ "<td>" + vo.no + "</td>"
									+ "<td>" + vo.aptName + "</td>"
									+ "<td>" + vo.dealAmount + "</td>"
									+ "<td>" + vo.area + "</td>"
									+ "<td>" + vo.dealYear + "."+ vo.dealMonth
									+ "." + vo.dealDay + "."+"</td></tr>";
									$("#searchDetailResult").append(str);
								});//each
							}//function
							, "json"
					);//get
				}
				function geocode(jsonData) {
					let idx = 0;
					$.each(jsonData, function(index, vo) {
						let tmpLat;
						let tmpLng;
						$.get("https://maps.googleapis.com/maps/api/geocode/json"
								,{	key:'AIzaSyCoCKddu6mtYaf4MJGtUwKVU_Uu7s9_gwM'
									, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
								}
								, function(data, status) {
									console.log(data);
									if (data.results.length == 0)
										return;
									//alert(data.results[0].geometry.location.lat);
									tmpLat = data.results[0].geometry.location.lat;
									tmpLng = data.results[0].geometry.location.lng;
									$("#lat_"+index).text(tmpLat);
									$("#lng_"+index).text(tmpLng);
									
									addMarker(tmpLat, tmpLng, vo.aptName);
								}
								, "json"
						);//get
					});//each
				}
				</script>
				
				<div style="text-align:center;">
					시도 : <select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : <select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : <select id="dong">
						<option value="0">선택</option>
					</select>
					<hr>
				</div>
				
				<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
				<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoCKddu6mtYaf4MJGtUwKVU_Uu7s9_gwM&callback=initMap"></script>
				<hr>
				
				<table class="table mt-2" style="width: 100%;">
					<thead>
						<tr>
							<th>번호</th>
							<th>아파트이름</th>
							<th>가격</th>
							<th>면적</th>
							<th>거래일</th>
						</tr>
					</thead>
					<tbody id="searchDetailResult">
					</tbody>
				</table>
				</div>
				
				<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					
					function initMap() {
						map = new google.maps.Map(document.getElementById('map'), {
							center: multi, zoom: 12
						});
					}
					
					function addMarker(tmpLat, tmpLng, aptName) {
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
							label: aptName,
							title: aptName
						});
						marker.addListener('click', function() {
							map.setZoom(16);
							map.setCenter(marker.getPosition());
						});
						map.setZoom(14);
						map.setCenter(marker.getPosition());
						marker.setMap(map);
					}
				</script>
				</div>
			</section>
		</div>
	</div>
</div>
</body>
</html>