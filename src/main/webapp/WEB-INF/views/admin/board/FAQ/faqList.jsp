<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<head>
<c:choose>
	<c:when test=""></c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.faqList}" var="faq">
			<tr>
				<td>
					${faqList.faqNo}<p>
				</td>
				<td>
					${faqList.faqTitle}<p>
				</td>
			</tr>		
		</c:forEach>
	</c:otherwise>
</c:choose>

</body>

</html>