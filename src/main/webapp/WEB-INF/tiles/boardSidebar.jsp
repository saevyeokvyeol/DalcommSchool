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
		<div id="inner-sidebar">
			<h4>고객센터</h4>
			<a href="${pageContext.request.contextPath}/main/board/Notice/noticeList"><h5>공지사항</h5></a>
			<a href="${pageContext.request.contextPath}/main/board/FAQ/faqList"><h5>자주 묻는 질문</h5></a>
			<a href="${pageContext.request.contextPath}/main/board/event/eventList"><h5>이벤트</h5></a>
		</div>
	</body>
</html>