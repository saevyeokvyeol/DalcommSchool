<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<style type="text/css">

	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}

</style>
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

<div class="main-content">

		 <table class="table">
        <thead>
            <tr>
             <th>글번호</th>
             <th>문의 ID</th>
             <th>카테고리</th>
             <th>문의제목</th>
             <th>문의내용</th>
             <th>첨부파일명</th>
             <th>문의일자</th>
             <th>답변유무</th>
            </tr>
        </thead>
		
			<tbody>
		
					<c:choose>
					 
						    <c:when test="${empty requestScope.askSelectByIdList}">
							<tr>
						        <td colspan="5">
						            <span style="font-size:9pt;"><h3>등록된 문의가 없습니다.</h3></span></p>
						        </td>
						    </tr>
						    </c:when>
					    
						    <c:otherwise>
							<c:forEach items="${requestScope.askSelectByIdList.content}" var="ask">
								     <tr>  
								        <td>
								           ${ask.askNo} 
								        </td>
								        <td>
								        	${ask.student.studentId}
								        </td>
								        <td>
								            ${ask.askCategory.askCategoryName}
								        </td>
								        <td>
								        	<a href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerDetailStudent/${ask.askNo}">
								        	${ask.askTitle}
								        	</a>
								        </td>
								        <td>
								        	<span class="d-inline-block text-truncate" style="max-width: 150px;">
								        		${ask.askContent}
								        	</span> 
								        </td>  
								        <td>
								        	${ask.askImg}
								        </td> 
								        <td>
								        	<fmt:parseDate value="${ask.askInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
											<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
								        </td>
								        <td>
								        	${ask.askComplete}
								        </td>
								    </tr>
								
						    </c:forEach>
							</c:otherwise> 
							
					
				    </c:choose>
			</tbody>
   		</table>
   		
   		<hr>
   		<div style="text-align: center">
		<!--  블럭당  -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerStudent?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=pageList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerStudent?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerStudent?nowPage=${startPage+blockCount}">NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>
   		
	</div>
	
</body>
</html>