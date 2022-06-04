<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/main/class/classSearch">
			<input type="text" name="keyword"><br>
			
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="placeRegion" id="btnradio1" autocomplete="off" checked>
				<label class="btn btn-outline-primary" for="btnradio1">Radio 1</label>
				
				<input type="radio" class="btn-check" name="placeRegion" id="btnradio2" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio2">Radio 2</label>
				
				<input type="radio" class="btn-check" name="placeRegion" id="btnradio3" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio3">Radio 3</label>
			</div>
			
			<select name="classCategory">
				<option></option>
			</select>
			<br>
			
			<input type="radio" class="btn-check" id="review" name="sort" value="review">
			<label class="btn btn-outline-primary" for="review">후기 많은 순</label>
			<input type="radio" class="btn-check" id="likes" name="sort" value="likes">
			<label class="btn btn-outline-primary" for="likes">찜 많은 순</label>
			<input type="radio" class="btn-check" id="rate" name="sort" value="rate">
			<label class="btn btn-outline-primary" for="rate">별점 순</label>
			
			<input type="submit" value="검색">
		</form>
	
		<c:choose>
			<c:when test="${empty list}">
				클래스가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
			<c:forEach items="${list}" var="classes"><p>
					${classes.classId}
					 | <a href="${pageContext.request.contextPath}/main/class/${classes.classId}">${classes.className}</a>
					 | ${classes.classInfo}
					 | ${classes.classOpenDate}
					 | ${classes.classCategory.categoryName}
					 | ${classes.teacher.teacherNickname}
					 | ${classes.classState.stateName}
					<div class="like_box">
						<i class="fa-solid fa-heart"></i>
					</div>
					<c:if test="${classes.classImages != null}">
						<c:forEach items="${classes.classImages}" var="classImage">
							<img alt="" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>