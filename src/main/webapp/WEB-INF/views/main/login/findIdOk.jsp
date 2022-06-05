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

	<div>
	 회원님의 아이디는 <span id="userId"> ${userId} </span>   입니다.
	</div>
	<input type="button" class="Btn" id="findPwdBtn" onclick="location.href='/main/login/findPwdForm'" value="비밀번호 찾기">
	<input type="button" class="Btn" id="loginBtn" onclick="location.href='/main/login/loginForm'" value="로그인하기">
	<input type="button" class="Btn" id="indexBtn" onclick="location.href='/'" value="메인화면으로 가기">

</body>
</html>