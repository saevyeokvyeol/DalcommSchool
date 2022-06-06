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
<script type="text/javascript">

</script>
<title>Insert title here</title>
<head>
<h1>FAQ 리스트</h1>

<c:choose>
	<c:when test=""></c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.faqlist}" var="faq">
			<tr>
				<td>
					${faq.faqNo}
				</td>
				<td>
					${faq.faqCategory.faqCategoryName}
				</td>
				<td>
				<a href="${pageContext.request.contextPath}/admin/board/FAQ/faqRead/${faq.faqNo}">
					${faq.faqTitle}<p>
					</a>
				</td>
			</tr>		
		</c:forEach>
	</c:otherwise>
</c:choose>


<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/board/FAQ/write'">등록하기</button>
<button type="button" class="btn btn-danger" onclick="">삭제</button>
</head>
</body>

</html>