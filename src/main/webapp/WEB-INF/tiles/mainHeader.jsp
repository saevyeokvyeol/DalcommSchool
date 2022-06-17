<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(function() {
				//$("#form").hide();
				$(".logout").click(function name() {
					document.getElementById('logout').submit();
				})
				
				$(".like").click(function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/selectByStudentId",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}"},
						success: function(result){
							text = ""
							if(result.length == 0) {
								text += "<h2>찜한 클래스가 없습니다</h2>"
							} else {
								text += '<div class="likeBox">'
								$.each(result, function(index, item) {
									text += "<div>"
									text += `<div class="likeBoxImg">`
									text += `<a href="${pageContext.request.contextPath}/main/class/\${item.classId}">`
									text += `<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/\${item.classImage}">`
									text += `</a>`
									text += `</div>`
									text += `<div class="classBoxContent">`
									text += `<a href="${pageContext.request.contextPath}/main/class/\${item.classId}">`
									text += `<h6 class="classBoxName">`
									text += `\${item.className}<br>`
									text += `\${item.classPrice}원`
									text += `</h6>`
									text += `</a>`
									text += `<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="likeBtn" value="\${item.likeId}">`
									text += `<i class="fa-solid fa-heart"></i>`
									text += `</button>`
									text += `</div>`
									text += "</div>"
								})
								text += `</div>`
							}
							$(".offcanvas-body").html(text);
						},
						error:function(request, status, error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				})

				$(document).on("click", "button[name=likeBtn]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/deleteByLikeId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "likeId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).parent().parent().remove();
						},
						error: function(err){
							alert(123)
						}
					})
				})
			})
		</script>
		
		<style type="text/css">
			.modal-dialog-centered {
				text-align: center;
			}
		</style>
		
	</head>
	<body>
		<div class="form">	
			<form action="${pageContext.request.contextPath}/logout" method="post" id="logout">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
			</form>
		</div>	
		
		
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasRightLabel">찜 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body"></div>
		</div>
				
		<!-- 로그인 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
              		<h5 class="modal-title modal-title-centered"></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body"><!-- 모달 본문 -->
		      <jsp:include page="/WEB-INF/views/main/login/login.jsp"/>
		      </div>
		    </div>
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
						<li><a href="${pageContext.request.contextPath}/main/board/Notice/noticeList">고객센터</a></li><div class="btn-group">
					</ul>
				
				</div>
				<ul>
					<li><a href=""><i class="fa-solid fa-magnifying-glass fa-xl"></i></a></li>
					<li><a class="like" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="fa-solid fa-heart fa-xl"></i></a></li>
					<sec:authorize access="isAnonymous()">
						<li><a data-bs-toggle="modal" data-bs-target="#myModal"><i class="fa-solid fa-circle-user fa-xl"></i></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_STUDENT')">
						<li><a href="${pageContext.request.contextPath}/main/mypage/myPage"><i class="fa-solid fa-circle-user fa-xl"></i></a></li>
						<li><a class="logout"><i class="fa-solid fa-right-to-bracket fa-xl"></i></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_TEACHER')">
						<li><a href="${pageContext.request.contextPath}/teacher"><i class="fa-solid fa-circle-user fa-xl"></i></a></li>
						<li><a class="logout"><i class="fa-solid fa-right-to-bracket fa-xl"></i></a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
		
		
	
	</body>
</html>