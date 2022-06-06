<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기 오류 페이지입니다.</title>
</head>
<body>

<h1>입력하신 정보와 일치하는 계정이 없습니다~</h1>

<input type="button" id="joinStudentBtn" onclick="location.href='/main/login/joinStudent'" value="수강생으로 가입하기">
<input type="button" id="joinTeacherBtn" onclick="location.href='/main/login/joinTeacher'" value="선생님으로 가입하기">
<input type="button" class="Btn" id="indexBtn" onclick="location.href='/'" value="메인화면으로 가기">

</body>
</html>