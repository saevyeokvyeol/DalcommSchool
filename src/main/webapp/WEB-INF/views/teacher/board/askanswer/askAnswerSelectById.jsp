<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
$(function(){
	   //alert(1)
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/askanswer/updateFormTeacher?${_csrf.parameterName}=${_csrf.token}");
		   $("#requestForm").submit();
	   })
	   
	   
	    $("input[value=삭제하기]").click(function(){
		   
		   
	          
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/askanswer/deleteTeacher?${_csrf.parameterName}=${_csrf.token}");
			   $("#requestForm").submit();
			   alert("삭제되었습니다.")
		   
	   }) 
	   
	   
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
	<c:forEach items="${requestScope.askSelectByIdList}" var="askSelectByIdList">
		     <tr>  
		        <td>
		           글 번호 : ${askSelectByIdList.askNo}<p>  
		        </td>
		        <td>
		        	문의 ID : ${askSelectByIdList.teacher.teacherId}<p>
		        </td>
		        <td>
		        	카테고리 : ${askSelectByIdList.askCategory.askCategoryName}<p>
		        </td>
		        <td>
		        	문의제목 : ${askSelectByIdList.askTitle}<p>
		        </td>
		        <td>
		            문의 내용 : ${askSelectByIdList.askContent}<p> 
		        </td>
		        <td>
		        	첨부 파일 : ${askSelectByIdList.askImg}<p>
		        </td>
		        <td>
		        	문의 일자 : ${askSelectByIdList.askInsertDate}<p>
		        </td>
		    </tr>
		    
		 <tr>
        	<td >
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
			 	<form name="requestForm" method="post" id="requestForm">
				 	<input type=hidden name="askNo" value="${askSelectByIdList.askNo}">
					<input type=button value="수정하기" >
					<input type=button value="삭제하기" >
				</form> 
			</td>
    	</tr>
		    <hr>
		    
		    <hr>
    </c:forEach>
	</c:otherwise> 
	
	
	 
    </c:choose>
   

</body>
</html>