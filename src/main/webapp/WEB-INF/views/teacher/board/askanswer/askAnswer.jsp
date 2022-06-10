<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose> 
    <c:when test="${empty requestScope.askSelectByIdList}">
	<tr>
        <td colspan="5">
            <span style="font-size:9pt;">등록된 문의가 없습니다.</span></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.askSelectByIdList}" var="askList">
		     <tr>  
		        <td>
		           글 번호 : ${askList.askNo}<p>
		        </td>
		        <td>
		        	문의 ID : ${askList.student.studentId}<p>
		        </td>
		        <td>
		        	문의제목 : ${askList.askTitle}<p>
		        </td>
		        <td>
				    카테고리 : ${askList.askCategory.askCategoryName}<p>
		        </td>
		        <td>
		            문의 내용 : ${askList.askContent}<p>
		        </td>
		        <td>
		        	문의 일자 : ${askList.askInsertDate}<p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>

</body>
</html>