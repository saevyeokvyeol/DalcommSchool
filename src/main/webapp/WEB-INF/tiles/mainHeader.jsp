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
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel">찜 목록</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    ...
  </div>
</div>
		<div id="main-header">
			<div id="inner-main-header">
				<div id="logo_menu">
					<h1><a href="${pageContext.request.contextPath}/"><img alt="달콤스쿨 로고" src="${pageContext.request.contextPath}/img/main/mainLogoBlack.png"></a></h1>
					<ul>
						<li><a href="${pageContext.request.contextPath}/main/class/classList">전체 클래스</a></li>
						<li><a href="${pageContext.request.contextPath}/main/class/newClass">신규 클래스</a></li>
						<li><a href="${pageContext.request.contextPath}/main/class/nearClass">바로 수강 클래스</a></li>
						<li><a href="">고객센터</a></li><div class="btn-group">
					</ul>
				
				</div>
				<ul>
					<li><a href=""><i class="fa-solid fa-magnifying-glass fa-xl"></i></a></li>
					<li><a data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="fa-solid fa-heart fa-xl"></i></a></li>
					<li><a href=""><i class="fa-solid fa-circle-user fa-xl"></i></a></li>
				</ul>
			</div>
		</div>
	</body>
</html>