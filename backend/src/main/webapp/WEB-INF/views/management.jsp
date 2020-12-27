<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 35%;
	height: 7%;
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

	<br>
	<h2 style="text-align: center">회원정보</h2>
	<br>
	<center>
		<form method="post" action="search.mem">
			검색: <select name="condition">
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select> <input type="text" name="word" width="100" height="5"> <input
				type="submit" value="검색">
		</form>
	</center>
	<br>
	<form action="delete.mem" id="f" method="post">
		<table class="table">
			<tr bgcolor=pink>
			<thead align=center>
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>TEL</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="row">
				<tr>
					<td align=center bgcolor=pink>&nbsp;<font size=2><a
							href="update.jsp?id=${row.id}&name=${row.name}&tel=${row.tel}&pass=${row.pass}">${row.id}</a></td>
					<td align=center bgcolor=pink>&nbsp;<font size=2>${row.name}</td>
					<td align=center bgcolor=pink>&nbsp;<font size=2>${row.tel}</td>
					<td align=center bgcolor=pink><a href="read.mem?id=${row.id}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>