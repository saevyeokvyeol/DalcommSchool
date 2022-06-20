<%@page import="java.time.LocalDateTime"%>
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
	th,td{
		text-align: center; height: 55px;
	}
	
	td:nth-child(3){
	text-align: left;
	}
	.askSearch{
		width: 150px;
		height: 40px;
	}
	#askCategoryId{
		width: 150px;
		height: 40px;
	}

</style>

</head>
<body>
	
		<table class="table"> 
			<thead>
			
			
	            <tr>
	             <th>글번호</th>
	             <th>문의 USER</th>
	             <th>글 제목</th>
	             <th>카테고리</th>
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
									<span>${askList.teacher.teacherId}</span>
						    	
						    	</c:when>
						    	
						    	<c:when test="${empty askList.teacher.teacherId}">
						    			<span>${askList.student.studentId}</span>
						    	</c:when>
		    				</c:choose>
					        	
					        </td>
					        <td>
					        	 <a href="${pageContext.request.contextPath}/admin/board/askAnswerDetail/${askList.askNo}">
					        	     ${askList.askTitle}
				        	     <c:set var="today" value="<%=LocalDateTime.now().minusDays(1)%>"/>
								  <c:if test="${askList.askInsertDate >= today}">
								  	<span class="badge rounded-pill bg-primary">new</span>
								  </c:if>
					        	</a>
					        </td>
					        <td>
							   	${askList.askCategory.askCategoryName}
					        </td>
					        <td>
					        	<fmt:parseDate value="${askList.askInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
								<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
					        </td>
					      
					       
					    </tr>
			    </c:forEach>
			</c:otherwise>
	    </c:choose>
	    
			<tr>
				<td colspan="5">
					<div align="right">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/askAnswerList" role="button" >목록으로</a>
					</div>
				</td>
			</tr>
	   </tbody>
		</table>
		
			 <div>
		
		<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
	<c:set var="doneLoop" value="false"/>
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
	      	<li class="page-item">
		      <a class="page-link" href="${pageContext.request.contextPath}/admin/board/askAnswerList?nowPage=${startPage-1}">이전</a>
		  	</li>
		  </c:if>
		
	  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		    <c:if test="${(i-1)>=askList.getTotalPages()}">
		       <c:set var="doneLoop" value="true"/>
		    </c:if> 
			  <c:if test="${not doneLoop}" >
			  <li class="page-item">
			         <a class="page-link ${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/board/askAnswerList?nowPage=${i}">${i}</a> 
			  </li>
			  </c:if>
		</c:forEach>
				
		 <c:if test="${(startPage+blockCount)<=askList.getTotalPages()}">
	     <li class="page-item">
		     <a class="page-link" href="${pageContext.request.contextPath}/admin/board/askAnswerList?nowPage=${startPage+blockCount}">다음</a>
		 </li>
		 </c:if>
		</ul>
	</nav> 		
		

</body>
</html>