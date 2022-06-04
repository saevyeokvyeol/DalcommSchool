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
				
				// 클래스 삭제
				$(".delete").on("click", function() {
					alert($(this).val());
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/delete",
						type : "post",
						data : {"classId" : $(this).attr("name")},
						success : function() {
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					}); // 아작스 종료
				}) // delete 버튼 클릭
				
				// 클래스 공개 수락
				$(".class_open").on("click", function() {
					alert($(this).attr("name"))
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/class/updateStateOpen",
						type : "post",
						data : {"classId" : $(this).attr("name")},
						success : function() {
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					}); // 아작스 종료 */
				}) // classOpen 버튼 클릭
				
				// 클래스 상태 변경
				$(".state_update").on("click", function() {
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/updateState",
						type : "post",
						data : {"classId" : $(this).attr("name"), "stateId" : $(this).val()},
						success : function() {
							location.reload()
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					}); // 아작스 종료
				}) // update 버튼 클릭
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
							<button class="state_update" value="2" name="${classes.classId}">클래스 공개 신청</button>
						</c:when>
						<c:when test="${classes.classState.stateId == 2}">
							<button class="state_update" value="1" name="${classes.classId}">클래스 공개 신청 취소</button>
						</c:when>
						<c:when test="${classes.classState.stateId == 3}">
							<button class="state_update" value="4" name="${classes.classId}">클래스 비공개</button>
						</c:when>
						<c:when test="${classes.classState.stateId == 4}">
							<button class="state_update" value="3" name="${classes.classId}">클래스 공개</button>
						</c:when>
					</c:choose>
					<c:if test="${classes.classImages != null}">
						<c:forEach items="${classes.classImages}" var="classImage">
							<img alt="" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
						</c:forEach>
					</c:if>
					<c:choose>
						<c:when test="${classes.classState.stateId == 2}">
							<button class="class_open" name="${classes.classId}">클래스 공개 수락</button>
						</c:when>
						<c:when test="${classes.classState.stateId != 3 && classes.classState.stateId != 5}">
							<button class="delete" name="${classes.classId}">클래스 삭제</button>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>