<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<head>

<c:choose>
	<c:when test=""></c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.nolist}" var="notice">
			<tr>
				<td>
					${notice.noticeNo}
				</td>
				<td>
				<a href="${pageContext.request.contextPath}/admin/board/Notice/noticeRead/${notice.noticeNo}">
					${notice.noticeTitle} <p>
				</a>
				</td>
			</tr>		
		</c:forEach>
	</c:otherwise>
</c:choose>

<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/board/Notice/write'">등록하기</button>
<button type="button" class="btn btn-danger" onclick="">삭제</button>

</head>
</body>

</html>