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

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
/* 	
$(function(){
	   //alert(1)
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/teacher/board/askanswer/updateFormTeacher?${_csrf.parameterName}=${_csrf.token}");
		   $("#requestForm").submit();
	   })
	   
	   
	    $("input[value=삭제하기]").click(function(){
		   
		   
	          
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/teacher/board/askanswer/deleteTeacher?${_csrf.parameterName}=${_csrf.token}");
			   $("#requestForm").submit();
			   alert("삭제되었습니다.")
		   
	   }) 
	   
	   
}) */

</script>
</head>
<body>


<c:choose>
	 
	    <c:when test="${empty requestScope.askSelectByIdList}">
		<tr>
	        <td colspan="5">
	            <span style="font-size:9pt;"><h3>등록된 문의가 없습니다.</h3></span></p>
	        </td>
	    </tr>
	    </c:when>
	    
    <c:otherwise>
	<c:forEach items="${requestScope.askSelectByIdList}" var="ask">
		     <tr>  
		        <td>
		           글 번호 : ${ask.askNo}<p>  
		        </td>
		        <td>
		        	문의 ID : ${ask.teacher.teacherId}<p>
		        </td>
		        <td>
		        	카테고리 : ${ask.askCategory.askCategoryName}<p>
		        </td>
		        <td>
		        	문의제목 : ${ask.askTitle}<p>
		        </td>
		        <td>
		            문의 내용 : ${ask.askContent}<p> 
		        </td>
		        <td>
		        	첨부 파일 : ${ask.askImg}<p>
		        </td>
		        <td>
		        	문의 일자 : ${ask.askInsertDate}<p>
		        </td>
		    </tr>
		    
		 <tr>
        	<td >
			
			 	<a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/teacher/board/askanswer/updateFormTeacher?askNo=${ask.askNo}">수정하기</a>
					<a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/teacher/board/askanswer/deleteTeacher?askNo=${ask.askNo}">삭제하기</a>
			</td>
    	</tr>
		    <hr>
		    
		    <hr>
    </c:forEach>
	</c:otherwise> 
	
	
	 
    </c:choose>
   

</body>
</html>