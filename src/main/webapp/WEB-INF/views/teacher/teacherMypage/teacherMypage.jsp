<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>선생님 마이페이지입니다.</title>
</head>
<body>
<div class="main-content">

<div>
  <aside id="side-menu" class="side-menu" data-bg-class="bg-menu-theme">

	<!-- 프로필 사진이랑 이름 뜨는 부분 -->
    <div class="teacher-profile"></div>
	<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="teacher"/>
    
	<!-- 사이드바 메뉴 -->
	<form>
	<input type="hidden" name="request" value="principal">
	<div>
		<ul>
		  <li><a href="${pageContext.request.contextPath}/main/teacher/teacherId">프로필 보기</a></li>
		  <li><a href ="${pageContext.request.contextPath}/teacher/teacherMypage/updateForm">내 정보 수정</a></li>
		  <li><a href ="updatePwd">비밀번호 수정</a></li>
		  <li>클래스 관리</li>
		  <li><a href ="">수강 신청 조회</a></li>
		  <li><a href ="">내 클래스 조회</a></li>
		  <li><a href ="">내 클래스 관리</a></li>
		  <li><a href ="${pageContext.request.contextPath}/main/board/review/teacher">내 클래스 후기 관리</a></li>
		  <li>수익 관리</li>
		  <li><a href ="">정산 신청</a></li>
		  <li><a href ="">정산 내역</a></li>
		  <li><a href="${pageContext.request.contextPath}/main/mypage/deleteUserForm"><i class="fa fa-times-circle" aria-hidden="true"></i>&nbsp;회원 탈퇴</a></li>
		</ul>
	</div>
	</form>
	</sec:authorize>
  </aside>
  
  <div>
    <!-- 검색창 -->
  	<nav></nav>
  </div>
</div>
</div>
</body>
</html>