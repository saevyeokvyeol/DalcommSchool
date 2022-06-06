<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이벤트 리스트 페이지 입니다</h1>
	
	 <table>
        <thead>
            <tr>
             <th>글번호</th>
             <th>작성자</th>
             <th>글제목</th>
             <th>작성일</th>
             <th>조회수</th>
            </tr>
        </thead>
	
	<tbody>
	<c:choose>
	<c:when test=""></c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.eventList}" var="event">
			<tr>
				<td>
					${event.eventNo}
				</td>
				<td>
					관리자
				</td>
				<td>
				<a href="${pageContext.request.contextPath}/admin/board/event/eventRead/${event.eventNo}">
					${event.eventTitle} <p>
				</a>
				</td>
				<td>
					<fmt:parseDate value="${event.eventInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
				</td>
				<td>
					${event.eventViews}
				</td>
			</tr>		
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>
</body>
</html>