<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="main-content">

	<h2> 마이페이지 </h2><br><hr>
	

    <div class="view-account">
        <section class="module">
          <sec:authorize access="isAuthenticated()">
        	<sec:authentication property="principal" var="student"/>
            <div class="module-inner">
                <div class="side-bar">
                    <div class="user-info">
                        <ul class="meta list list-unstyled">
                            <span class="fa fa-user"> &nbsp;${student.studentId} 님 로그인 </span>
                            <input type="hidden" name="studentId" value="${studentId}">
                        </ul>
                    </div>
                    <nav class="side-menu">
                        <ul class="nav">
                            <li><a href="${pageContext.request.contextPath}/main/mypage/modifyForm"><span class="fa fa-cog"></span>&nbsp;회원 정보 수정</a></li>
                            <li><a href="${pageContext.request.contextPath}/main/mypage/modifyPwd"><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;비밀 번호 수정</a></li>
                            <br>
                            <li class="active"><a href="#"><span class="fa fa-calendar"></span>&nbsp;예약 조회</a></li>
                            <li><a href="#"><i class="fa fa-ticket" aria-hidden="true"></i>&nbsp;내 쿠폰 조회</a></li>
                            <li><a href="${pageContext.request.contextPath}/main/mypage/reviewList"><i class="fa fa-star" aria-hidden="true"></i>&nbsp;내 리뷰 관리</a></li>
                            <li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp;클래스 문의 조회</a></li>
                            <li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp;1대1 문의 조회</a></li>
                            <br>
                            <li><a href="${pageContext.request.contextPath}/main/mypage/deleteUserForm"><i class="fa fa-times-circle" aria-hidden="true"></i>&nbsp;회원 탈퇴</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            </sec:authorize>
        </section>
    </div>
</div>
</body>
</html>