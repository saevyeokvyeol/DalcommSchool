<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
$(function(){
	   //alert(1)
	 /*   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/askanswer/updateFormStudent?${_csrf.parameterName}=${_csrf.token}");
		   $("#requestForm").submit();
	   })
	    */
	   
	 /*    $("input[value=삭제하기]").click(function(){
		   
		   
	          
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/askanswer/deleteStudent?${_csrf.parameterName}=${_csrf.token}");
			   $("#requestForm").submit();
			   alert("삭제되었습니다.")
		   
	   })  */
	   
	   
})

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
		        	문의 ID : ${ask.student.studentId}<p>
		        </td>
		        <td>
		        	카테고리 : ${ask.askCategory.askCategoryName}<p>
		        </td>
		        <td>
		        	문의제목 : ${ask.askTitle}<p>
		        </td>
		        <td>
		        	<span class="d-inline-block text-truncate" style="max-width: 150px;">
		        		문의 내용 : ${ask.askContent}<p>
		        	</span> 
		        </td>
		        <td>
		        	첨부 파일 : ${ask.askImg}<p>
		        </td> 
		        <td>
		        	문의 일자 : ${ask.askInsertDate}<p>
		        </td>
		        <td>
		        	답변 유무 : ${ask.askComplete}<p>
		        </td>
		    </tr>
		    
		 <tr>
        	<td >
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				 	<%-- <input type=hidden name="askNo" value="${askSelectByIdList.askNo}">
					<input type=button value="수정하기" > --%>
					
					<a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/updateFormStudent?askNo=${ask.askNo}">수정하기</a>
					<a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/deleteStudent?askNo=${ask.askNo}">삭제하기</a>				
				
			</td>
    	</tr>
		    <hr>
		    <c:choose>
		    	<c:when test="${empty ask.answer}">
				<span>답변 내용이 없습니다.</span>
		    	
		    	</c:when>
		    	<c:otherwise>
				 답변 내용 : ${ask.answer.answerContent}<p>
				 답변 일자 : ${ask.answer.answerInsertDate}</c:otherwise>
		    </c:choose>
			<hr>
    </c:forEach>
	</c:otherwise> 
	
	
	 
    </c:choose>
   

</body>
</html>