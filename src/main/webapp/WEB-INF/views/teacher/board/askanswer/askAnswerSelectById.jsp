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

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
				<h1>1대1 문의목록</h1>
			</span> 
	</div>
	
	
	
	
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
									        	${ask.teacher.teacherId}
									        </td>
									        <td>
									            ${ask.askCategory.askCategoryName}
									        </td>
									        <td>
									        	<a href="${pageContext.request.contextPath}/teacher/board/askanswer/askAnswerDetailTeacher/${ask.askNo}">
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
									        	<c:choose>
						                        	<c:when test="${ask.askComplete == 'F'}">
						                        		<span class="badge bg-secondary">미답변</span>
						                        	</c:when>
						                        	<c:when test="${ask.askComplete == 'T'}">
						                        		<span class="badge bg-primary">답변 완료</span>
						                        	</c:when>
						                       	</c:choose>
									        </td>
									    </tr>
									
							    </c:forEach>
								</c:otherwise> 
								
						
					    </c:choose>
					    		
							    
				</tbody>
	   		</table>
	   		
	   		<hr>
			
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:set var="doneLoop" value="false" />
						<c:if test="${(startPage-blockCount) > 0 and askSelectByIdList.content.size() != 0}">
							<li class="page-item">
								<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
							</li>
						</c:if>
							<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<askSelectByIdList.totalPages?(startPage-1)+blockCount:askSelectByIdList.totalPages}'>
								<c:if test="${(i-1)>=askSelectByIdList.getTotalPages()}">
									<c:set var="doneLoop" value="true" />
								</c:if>
								<c:if test="${not doneLoop}">
									<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
						<c:if test="${(startPage+blockCount) <= askSelectByIdList.getTotalPages()}">
							<li class="page-item">
								<a class="page-link" href="${URL}?page=${startPage+blockCount}">다음</a>
							</li>
						</c:if>
					</ul>
				</nav>
			
			<div align=right>
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/teacher/board/askanswer/askAnswerWriteTeacher" role="button">문의하기</a>
			</div>
		<!-- </div>	
	</section>	 -->   		
</div>

















</body>
</html>