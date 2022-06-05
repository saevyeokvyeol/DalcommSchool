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
								text += `<input type="radio" class="btn-check" name="placeRegion" id="\${item.regionName}" value="\${item.regionId}"><label class="btn btn-outline-primary" for="\${item.regionName}">\${item.regionName}</label>`;
							})
							$("#placeRegion").append(text);
						},
						error: function(err){
							alert("지역정보를 가져올 수 없습니다.")
						}
					})
				}
				
				function selectClassCategory(){
					$.ajax({
						url: "${pageContext.request.contextPath}/teacher/class/selectAllCategory",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}"},
						dataType: "json",
						success: function(result){
							text = ""
							$.each(result, function(index, item){
								text += `<input type="radio" class="btn-check" name="classCategory" id="\${item.categoryName}" value="\${item.categoryId}"><label class="btn btn-outline-primary" for="\${item.categoryName}">\${item.categoryName}</label>`;
								
							})
							text += ""
							$("#classCategory").append(text);
							search();
						},
						error: function(err){
							alert("클래스 카테고리를 가져올 수 없습니다.")
						}
					})
				}
				
				function search() {
					var query = window.location.search;
					var param = new URLSearchParams(query);
					$("#keyword").val(param.get('keyword'));
					$("[value="+param.get('placeRegion')+"]").prop("checked", true)
					$("[value="+param.get('classCategory')+"]").prop("checked", true)
					$("[value="+param.get('sort')+"]").prop("checked", true)
				}

				selectClassCategory();
				selectPlaceRegion();
			})
		
			
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/main/class/classSearch">
			<input type="text" name="keyword" id="keyword"><br>
			
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="placeRegion">
			</div><br>
			
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="classCategory">
			</div><br>
			
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="sort">
				<input type="radio" class="btn-check" name="sort" id="new" value="new">
				<label class="btn btn-outline-primary" for="new">최근 등록</label>
				<input type="radio" class="btn-check" name="sort" id="review" value="review">
				<label class="btn btn-outline-primary" for="review">후기 많은 순</label>
				<input type="radio" class="btn-check" name="sort" id="likes" value="likes">
				<label class="btn btn-outline-primary" for="likes">인기순</label>
				<input type="radio" class="btn-check" name="sort" id="low" value="low">
				<label class="btn btn-outline-primary" for="low">낮은 가격순</label>
				<input type="radio" class="btn-check" name="sort" id="high" value="high">
				<label class="btn btn-outline-primary" for="high">높은 가격순</label>
			</div><br>
			<input type="reset" value="초기화">
			<input type="submit" value="검색">
		</form>
	
		<c:choose>
			<c:when test="${empty list}">
				클래스가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
			<c:forEach items="${list}" var="schedule"><p>
					${schedule.classes.classId}
					 | <a href="${pageContext.request.contextPath}/main/class/${schedule.classes.classId}">${schedule.classes.className}</a>
					 | ${schedule.classes.classInfo}
					 | ${schedule.classes.classPrice}
					 | ${schedule.classes.classOpenDate}
					 | ${schedule.classes.classCategory.categoryName}
					 | ${schedule.classes.teacher.teacherNickname}
					 | ${schedule.classes.classState.stateName}
					<div class="like_box">
						<i class="fa-solid fa-heart"></i>
					</div>
					<c:if test="${schedule.classes.classImages != null}">
						<c:forEach items="${schedule.classes.classImages}" var="classImage">
							<img alt="" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>