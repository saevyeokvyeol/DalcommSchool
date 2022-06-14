<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>아이디, 비밀번호 찾기 오류 페이지입니다.</title>
</head>
<body>

<div class="main-content">
<br><br>
	<div class="text-center">
	<br><br><br>
		<h1><i class="fa fa-frown-o" aria-hidden="true"></i></h1><br>
		<h4>입력하신 정보와 일치하는 계정이 없습니다.</h4>
	</div>
	<br><br><br>
	<div class="text-center">
		<input type="button" id="joinStudentBtn" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/main/login/joinStudent'" value="수강생으로 가입하기">
		<input type="button" id="joinTeacherBtn" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/main/login/joinTeacher'" value="선생님으로 가입하기">
	</div>

</div>
</body>
</html>