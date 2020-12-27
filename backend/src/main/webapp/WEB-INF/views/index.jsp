<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Modern Business - Start Bootstrap Template</title>
<link rel="stylesheet"
	href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


<style>
#search {
	width: 1000px;
	height: 50px;
	margin: 50px;
}

#searchdiv {
	position: relative;
	width: 1000px;
	height: 100px;
	top: 110%;
	left: 20%;
	display: inline;
}

.imgsize {
	width: 300px;
	height: 200px;
}
</style>
</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index">Happy House</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
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

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('https://i.imgur.com/hBCf72p.jpg/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Happy House</h3>
						<p>내 집 마련의 시작</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://i.imgur.com/UXv5kdH.jpg/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Happy House</h3>
						<p>이사를 준비하고 계신다면 Happy House로 원하는 매물을 쉽고 편리하게 찾아보세요</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://i.imgur.com/JFRDJQP.jpg/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Happy House</h3>
						<p>내게 꼭 맞는 조건의 매물을 찾아보세요</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<div id="searchdiv">
		<button onclick="location.href='search'" id="search" value="검색"
			class="btn" style="background-color: #f1f1f1">>>원하는 지역 매물
			검색하러 가기<<</button>
		<!--
		<button onclick="location.href='corona.cor'" id="search" value="검색"
			class="btn" style="background-color: #f1f1f1">>>국민안심병원 검색<<</button>
		-->
			

	</div>
	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">Today Tip</h1>

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">서울 재건축 이슈</h4>
					<div class="card-body">
						<p class="card-text">광진구 공공재건축 나오나…중곡아파트, 컨설팅 신청</p>

						<img class="imgsize"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTrE6EVaLdIaqhRuEBixRS7qQ92tKjzY-xEAA&usqp=CAU">
					</div>
					<div class="card-footer">
						<a
							href="https://land.naver.com/news/newsRead.nhn?type=issueView&isu_no=101772&prsco_id=008&arti_id=0004473850"
							class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">입대차 3법 이슈</h4>
					<div class="card-body">
						<p class="card-text">임대차법으로 전셋값 급등?.."8월 서울 전셋값 떨어졌다"</p>
						<img class="imgsize"
							src="data:image/jpeg;base64,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">
					</div>
					<div class="card-footer">
						<a
							href="https://land.naver.com/news/newsRead.nhn?type=issueView&isu_no=102072&prsco_id=008&arti_id=0004473837"
							class="btn btn-primary">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">8.4 공급대책 이슈</h4>
					<div class="card-body">
						<p class="card-text">7·10, 8·4 부동산 대책 전문가 심의도 안 거치고 밀어붙였다</p>
						<img class="imgsize"
							src="https://img.sbs.co.kr/newimg/news/20200804/201457654_1280.jpg">
					</div>
					<div class="card-footer">
						<a
							href="https://land.naver.com/news/newsRead.nhn?type=issueView&isu_no=102092&prsco_id=005&arti_id=0001362489"
							class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; HappyHouse
				박성원 이석재</p>
		</div>
		<!-- /.container -->
	</footer>



</body>

</html>