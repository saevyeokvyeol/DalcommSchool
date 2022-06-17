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
			<a href="${pageContext.request.contextPath}/main/mypage/myPage"><h4>마이페이지</h4></a>
			<h5>나의 예약 내역</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath}/main/mypage/bookCalendar">나의 예약 캘린더</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/bookList">예약 목록</a></li>
			</ul>
			<h5>쿠폰 관리</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath}/main/mypage/couponList">나의 쿠폰 목록</a></li>
			</ul>
			<h5>나의 글 관리</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath}/main/mypage/askAnswerSelectById">1:1 문의</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/reviewList">클래스 후기</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/qnaList">클래스 Q&A</a></li>
			</ul>
			<h5>회원 정보</h5>
			<ul>
				<li><a href="${pageContext.request.contextPath}/main/mypage/modifyForm">회원정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/modifyPwd">비밀번호 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/main/mypage/deleteUserForm">회원 탈퇴</a></li>
			</ul>
		</div>
	</body>
</html>