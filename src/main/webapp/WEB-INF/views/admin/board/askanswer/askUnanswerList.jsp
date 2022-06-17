<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</head>
<body>
	

	<div class="main-content">
			
	        
	        
	      <div class="alert alert-dark" role="alert">
		     <span>
				<h1>미답변 1대1 문의목록</h1>
			</span> 
		</div>   
		<table class="table"> 
			<thead>
			
			<tr>
				<td>
					<div align="right">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/askAnswerList" role="button" >목록으로</a>
					</div>
				</td>
			</tr>
			
	            <tr>
	             <th>글번호</th>
	             <th>문의 USER</th>
	             <th>글 제목</th>
	             <th>카테고리</th>
	             <th>문의 내용</th>
	             <th>첨부 파일명</th>
	             <th>문의 일자</th>
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
				<c:forEach items="${requestScope.askList.content}" var="askList">
				
					     <tr>  
					        <td>
					         	${askList.askNo}
					        </td>
					        <td>
					        	
					        	<c:choose>
							    	<c:when test="${empty askList.student.studentId}">
										<span>(선생님) <%-- ${askList.teacher.teacherId} --%></span>
							    	
							    	</c:when>
							    	
							    	<c:when test="${empty askList.teacher.teacherId}">
							    			<span>(학생 ) <%-- ${askList.student.studentId} --%></span>
							    	</c:when>
			    				</c:choose>
					        	
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
						        <span class="d-inline-block text-truncate" style="max-width: 150px;">
						            ${askList.askContent}<p>
						        </span>
						        
					        </td>
					        <td>
					         	${askList.askImg}<p>
					        </td>
					        <td>
					        	<fmt:parseDate value="${askList.askInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
								<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
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
			<div class="pagination justify-content-center">
			<c:set var="doneLoop" value="false"/>
				
				  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
				      <li class="page-item">
				      	<a class="pagination-newer" href="${pageContext.request.contextPath}/admin/board/askUnanswerList?nowPage=${startPage-1}">PREV</a>
				  	  </li>
				  </c:if>
				  
				<span class="pagination-inner"> 
				  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					    <c:if test="${(i-1)>=askList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				    
				  <c:if test="${not doneLoop}" >
				         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/board/askUnanswerList?nowPage=${i}">${i}</a> 
				  </c:if>
				   
				</c:forEach>
				</span> 
						
				 <c:if test="${(startPage+blockCount)<=askList.getTotalPages()}">
				     <li class="page-item">
				     	<a class="pagination-older" href="${pageContext.request.contextPath}/admin/board/askAnswerList?nowPage=${startPage+blockCount}">NEXT</a>
				 	 </li>
				 </c:if>
				</div>
			</nav>  
		</div>	 

				
	</div>	

</body>
</html>