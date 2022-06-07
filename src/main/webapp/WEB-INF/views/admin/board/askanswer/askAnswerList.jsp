<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>


<c:choose>
    <c:when test="${empty requestScope.askList}">
	<tr>
        <td colspan="5">
            <span style="font-size:9pt;">등록된 문의가 없습니다.</span></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.askList}" var="askList">
	
		     <tr>  
		        <td>
		           글 번호 : ${askList.askNo}<p>
		        </td>
		        <td>
		        	문의 ID : ${askList.student.studentId}<p>
		        </td>
		        <td>
		        	<span>
		        	 <a href="${pageContext.request.contextPath}/admin/board/askAnswerDetail/${askList.askNo}">
		        	문의제목 : ${askList.askTitle}</a>
		        	</span><p>
		        </td>
		        <td>
				    카테고리 : ${askList.askCategory.askCategoryName}<p>
		        </td>
		        <td>
		            문의 내용 : ${askList.askContent}<p>
		        </td>
		        <td>
		         	첨부 파일명 : ${askList.askImg}<p>
		        </td>
		        <td>
		        	1문의 일자 : ${askList.askInsertDate}<p>
		        </td>
		       <%-- 	<td>
		       		<span>
		       			<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/board/askanswer/askAnswerDetail">답변하기</a>
		       		</span>
		       	</td> --%>
		    </tr>
		    	
    
		     <hr>
    </c:forEach>
   
	</c:otherwise>
    </c:choose>
   

</body>
</html>