<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert index-title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>
		<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
		<style type="text/css">
			#placeRegion {display: flex; justify-content: space-between; padding: 40px 0 0;}
			#placeRegion a {font-size: 30px; font-weight: 700; border-radius: 50px; width: 100px; height: 100px; line-height: 80px; border-width: 2.5px;}
			#placeRegion > a:nth-child(1) {color: #0d6efd; border-color: #0d6efd;}
			#placeRegion > a:nth-child(1):hover {color: #fff; background-color: #0d6efd;}
			#placeRegion > a:nth-child(2) {color: #6610f2; border-color: #6610f2;}
			#placeRegion > a:nth-child(2):hover {color: #fff; background-color: #6610f2;}
			#placeRegion > a:nth-child(3) {color: #6f42c1; border-color: #6f42c1;}
			#placeRegion > a:nth-child(3):hover {color: #fff; background-color: #6f42c1;}
			#placeRegion > a:nth-child(4) {color: #d63384; border-color: #d63384;}
			#placeRegion > a:nth-child(4):hover {color: #fff; background-color: #d63384;}
			#placeRegion > a:nth-child(5) {color: #dc3545; border-color: #dc3545;}
			#placeRegion > a:nth-child(5):hover {color: #fff; background-color: #dc3545;}
			#placeRegion > a:nth-child(6) {color: #fd7e14; border-color: #fd7e14;}
			#placeRegion > a:nth-child(6):hover {color: #fff; background-color: #fd7e14;}
			#placeRegion > a:nth-child(7) {color: #ffc107; border-color: #ffc107;}
			#placeRegion > a:nth-child(7):hover {color: #fff; background-color: #ffc107;}
			#placeRegion > a:nth-child(8) {color: #198754; border-color: #198754;}
			#placeRegion > a:nth-child(8):hover {color: #fff; background-color: #198754;}
			
		</style>
		<script type="text/javascript">
			$(function() {
				function selectPlaceRegion(){
					$.ajax({
						url: "${pageContext.request.contextPath}/place/selectPlaceRegion",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}"},
						dataType: "json",
						success: function(result){
							text = ""
							$.each(result, function(index, item){
								text += `<a href="${pageContext.request.contextPath}/main/class/classSearch?placeRegion=\${item.regionId}" class="btn btn-outline-primary btn-lg">\${item.regionName}</a>`;
							})
							$("#placeRegion").append(text);
						},
						error: function(err){
							alert("지역정보를 가져올 수 없습니다.")
						}
					})
				}
				
				$(document).on("click", "button[name=none-like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/insert",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-solid fa-heart fa-lg"></i>');
							$(this).attr("name", "like");
							$(this).attr("value", `\${result.likeId}`);
						},
						error: function(err){
						}
					})
				})

				$(document).on("click", "button[name=like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/deleteByLikeId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "likeId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-regular fa-heart fa-lg"></i>');
							$(this).attr("name", "none-like")
							$(this).attr("value", `\${result}`);
						},
						error: function(err){
							alert(123)
						}
					})
				})
				
				selectPlaceRegion()
			})
		</script>
	</head>
	<body>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/img/main/banner_1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/main/banner_2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/main/banner_3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<!--  -->
		<div class="main-body">
			<div id="placeRegionBox">
				<h4 class="index-title">우리 집 근처 클래스 찾기</h4>
				<div id="placeRegion">
				</div>
			</div>
			<div class="classesList">
				<h4 class="index-title">요즘 많이 찾는 클래스</h4>
				<div class="classList">
					<c:forEach items="${popularList.content}" var="classes">
						<div class="classBox">
							<c:if test="${classes.classImages != null}">
								<c:forEach items="${classes.classImages}" var="classImage">
									<div class="classBoxImg">
										<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
											<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
										</a>
									</div>
									<div class="classBoxContent">
										<h5 class="classBoxName">
											<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
												<span>${classes.className}</span>
											</a>
											<c:choose>
												<c:when test="${classes.likeId != null}">
													<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="like" value="${classes.likeId}">
														<i class="fa-solid fa-heart fa-lg"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="none-like" value="${classes.classId}">
														<i class="fa-regular fa-heart fa-lg"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</h5>
										<div class="classBoxInfo">
											<h6>${classes.teacher.teacherNickname} 선생님</h6>
											<div class="classBoxLocation"><i class="fa-solid fa-cookie-bite"></i><span>${classes.classCategory.categoryName}</span><i class="fa-solid fa-location-dot"></i>${classes.teacher.place.placeRegion.regionName}서울</div>
										</div>
										<h5 class="classBoxPrice"><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</h5>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</c:forEach>
				</div>
					<h5 class="classMore"><a href="${pageContext.request.contextPath}/main/class/classSearch?keyword=&sort=like"><i class="fa-solid fa-angles-right"></i> 클래스 더보기</a></h5>
			</div>
			<div class="classesList">
				<h4 class="index-title">따끈따끈! 갓 나온 클래스</h4>
				<div class="classList">
					<c:forEach items="${newList.content}" var="classes">
						<div class="classBox">
							<c:if test="${classes.classImages != null}">
								<c:forEach items="${classes.classImages}" var="classImage">
									<div class="classBoxImg">
										<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
											<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
										</a>
									</div>
									<div class="classBoxContent">
										<h5 class="classBoxName">
											<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
												<span>${classes.className}</span>
											</a>
											<c:choose>
												<c:when test="${classes.likeId != null}">
													<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="like" value="${classes.likeId}">
														<i class="fa-solid fa-heart fa-lg"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="none-like" value="${classes.classId}">
														<i class="fa-regular fa-heart fa-lg"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</h5>
										<div class="classBoxInfo">
											<h6>${classes.teacher.teacherNickname} 선생님</h6>
											<div class="classBoxLocation"><i class="fa-solid fa-cookie-bite"></i><span>${classes.classCategory.categoryName}</span><i class="fa-solid fa-location-dot"></i>${classes.teacher.place.placeRegion.regionName}서울</div>
										</div>
										<h5 class="classBoxPrice"><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</h5>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<h5 class="classMore"><a href="${pageContext.request.contextPath}/main/class/newClass"><i class="fa-solid fa-angles-right"></i> 클래스 더보기</a></h5>
			</div>
		</div>
	</body>
</html>