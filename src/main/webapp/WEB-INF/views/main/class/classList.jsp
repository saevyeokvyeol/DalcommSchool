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
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
	</head>
	<body>
		<c:choose>
			<c:when test="${empty list}">
				클래스가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
			<c:forEach items="${list}" var="classes">
					${classes.classId}
					 | ${classes.className}
					 | ${classes.classInfo}
					 | ${classes.classInsertDate}
					 | ${classes.classUpdateDate}
					 | ${classes.classOpenDate}
					 | ${classes.classCategory}
					 | ${classes.teacher.teacherId}
					 | ${classes.classState.stateId}
					 | ${classes.className}<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>