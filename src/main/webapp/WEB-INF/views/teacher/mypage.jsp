<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 마이페이지입니다.</title>
</head>
<body>
<div>
  <aside id="side-menu" class="side-menu" data-bg-class="bg-menu-theme">

	<!-- 프로필 사진이랑 이름 뜨는 부분 -->
    <div class="teacher-profile"></div>
	
	<!-- 사이드바 메뉴 -->
	<div>
		<ul>
		  <li><a href="mypage">프로필 보기</a></li>
		  <li><a href ="updateProfile">내 정보 수정</a></li>
		  <li><a href ="updatePwd">비밀번호 수정</a></li>
		  <li>클래스 관리</li>
		  <li><a href ="">수강 신청 조회</a></li>
		  <li><a href ="">내 클래스 조회</a></li>
		  <li><a href ="">내 클래스 관리</a></li>
		  <li>수익 관리</li>
		  <li><a href ="">정산 신청</a></li>
		  <li><a href ="">정산 내역</a></li>
		</ul>
	</div>
  </aside>
  
  <div>
    <!-- 검색창 -->
  	<nav></nav>
  </div>
  
</div>
</body>
</html>