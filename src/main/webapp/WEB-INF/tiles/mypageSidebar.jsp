<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
	</head>
	<body>
		<div id="inner-sidebar">
			<h4>마이페이지</h4>
			<h5>나의 예약 내역</h5>
			<ul>
				<li><a href="">예약 목록</a></li>
				<li><a href="">취소된 예약 목록</a></li>
			</ul>
			<h5>쿠폰 관리</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath}/main/mypage/couponList">나의 쿠폰 목록</a></li>
			</ul>
			<h5>나의 글 관리</h5>
			<ul>
				<li><a href="">1:1 문의</a></li>
				<li><a href="">클래스 후기</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/qnaList">클래스 Q&A</a></li>
			</ul>
			<h5>회원 정보</h5>
			<ul>
				<li><a href="">회원정보 수정</a></li>
				<li><a href="">비밀번호 수정</a></li>
				<li><a href="">회원 탈퇴</a></li>
			</ul>
		</div>
	</body>
</html>