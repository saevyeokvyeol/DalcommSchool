<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="main-content">
			<h2 class="title">
				예약 완료
			</h2>
			<div id="bookComplete">
				<i class="fa-regular fa-circle-check fa-2xl text-primary"></i>
				<h4>클래스 예약이 완료되었습니다</h4>
				<a class="btn btn-primary bookComplete-btn btn-lg" href="${pageContext.request.contextPath}/main/mypage/bookList">예약 목록 보기</a>
				<a class="btn btn-primary bookComplete-btn btn-lg" href="${pageContext.request.contextPath}/main/class/classList">다른 클래스 둘러보기</a>
			</div>
		</div>
	</body>
</html>