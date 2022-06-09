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
	<table> 
		<thead>
            <tr>
             <th>글번호</th>
             <th>문의 ID</th>
             <th>글 제목</th>
             <th>카테고리</th>
             <th>문의 내용</th>
             <th>첨부 파일명</th>
             <th>문의 일자</th>
             <th>답변 유무</th>
            </tr>
        </thead>
	<tbody>
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
				         	${askList.askNo}
				        </td>
				        <td>
				        	${askList.student.studentId}<p>
				        </td>
				        <td>
				        	 <a href="${pageContext.request.contextPath}/admin/board/askAnswerDetail/${askList.askNo}">
				        	     ${askList.askTitle}<p>
				        	</a>
				        </td>
				        <td>
						   	${askList.askCategory.askCategoryName}<p>
				        </td>
				        <td>
				            ${askList.askContent}<p>
				        </td>
				        <td>
				         	${askList.askImg}<p>
				        </td>
				        <td>
				        	${askList.askInsertDate}<p>
				        </td>
				        <td>
				        	${askList.askComplete}<p>
				        </td>
				       <%-- 	<td>
				       		<span>
				       			<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/board/askanswer/askAnswerDetail">답변하기</a>
				       		</span>
				       	</td> --%>
				    </tr>
		    </c:forEach>
		</c:otherwise>
    </c:choose>
   </tbody>
	</table>
</body>
</html>