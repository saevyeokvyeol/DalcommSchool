<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		냠냠
		<c:choose>
			<c:when test="${loginUser!=null}">
				<h3> ${loginUser}님 로그인 중입니다 </h3>
				<li><a href="">로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/main/login/loginForm">로그인</a></li>
			</c:otherwise>
		</c:choose>
	</body>
</html>