<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<body>
<c:if test="${empty id}">
	<a href="login.mem" class="nav-link">로그인</a>
</c:if>

<c:if test="${!empty id}">
	<li  class="nav-link">Welcome, ${id}!!!</li>
	<a href="logout.mem" class="nav-link">로그아웃</a>
</c:if>

</body>
</html>