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
		<script type="text/javascript">
			$(function() {
				$(".delete").on("click", function() {
					alert($(this).val());
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/delete",
						type : "post",
						data : {"classId" : $(this).val()},
						success : function(result) {
							location.reload();
						},
						error : function(error) {
							alert("클래스를 삭제할 수 없습니다.");
						}
					}); // 아작스 종료
				})
			})
		</script>
	</head>
	<body>
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
					 <c:choose>
					 	<c:when test="${classes.classState.stateId == 1}">
					 		<button class="state_update" value="${classes.classId}">클래스 공개 신청</button>
					 	</c:when>
					 	<c:when test="${classes.classState.stateId == 2}">
					 		<button class="state_update" value="${classes.classId}">클래스 공개 신청 취소</button>
					 	</c:when>
					 	<c:when test="${classes.classState.stateId == 3}">
					 		<button class="state_update" value="${classes.classId}">클래스 비공개</button>
					 	</c:when>
					 	<c:when test="${classes.classState.stateId == 4}">
					 		<button class="state_update" value="${classes.classId}">클래스 공개</button>
					 	</c:when>
					 </c:choose>
					 <c:if test="${classes.classImages != null}">
					 	<c:forEach items="${classes.classImages}" var="classImage">
					 		<img alt="" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
					 	</c:forEach>
					 </c:if>
					 <c:choose>
					 	<c:when test="${classes.classState.stateId != 3}">
							<button class="delete" value="${classes.classId}">클래스 삭제</button>
					 	</c:when>
					 </c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>