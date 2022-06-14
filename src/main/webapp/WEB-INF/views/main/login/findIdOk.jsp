<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#userId{color: blue; font-weight: bold;}
</style>
</head>
<body>
<div class="main-content">
	<br><br><br><br><br>
	<div class="text-center">
	<h1><i class="fa fa-id-card fa-3" aria-hidden="true"></i></h1><br>
	 <h3>회원님의 아이디는 <span id="userId"> ${userId} </span>   입니다.</h3>
	</div>
	<br><br><br><br><br>
	<div class="text-center">
	<input type="button" class="btn btn-primary" id="findPwdBtn" onclick="location.href='/main/login/findPwdForm'" value="비밀번호 찾기">
	<input type="button" class="btn btn-primary" id="loginBtn" onclick="location.href='/main/login/login'" value="로그인하기">
	</div>

</div>
</body>
</html>