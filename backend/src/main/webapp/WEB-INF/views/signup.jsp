<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container1 {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
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

	<center>
		<form action="signup.mem" id="f" method="post">
			<div class="container1">
				<label for="uname"><br>
				<b>이름</b></label> <br>
				<input type="text" placeholder="Enter Username" name="name"
					required> <br>
				<label for="psw"><b>아이디</b></label> <br>
				<input type="text" placeholder="Enter id" name="id" required><br>
				<label for="psw"><b>패스워드</b></label><br> <input type="password"
					placeholder="Enter Password" name="pass" required><br>
				<label for="psw"><br>
				<b>패스워드 확인</b></label> <br>
				<input type="password" placeholder="Enter Password" name="pswc"
					required><br> <label for="psw"><b>핸드폰 번호</b></label><br>
				<input type="text" placeholder="Enter tel" name="tel" required><br>
				<br>

				<!--     <button  type="button" onclick="location.href='index.html'" class="btn" style="background-color:#f1f1f1">회원가입</button> -->
				<input type="submit" value="회원가입">

			</div>
		</form>
	</center>
</body>
</html>