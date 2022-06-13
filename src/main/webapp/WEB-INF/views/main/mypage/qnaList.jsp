<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생(자신)이 작성한 QnA 글 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<style type="text/css">
	
	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}
	table{
		width: 1500px;
	}
	.pagination{
		display: block;
		text-align: center;
	}

</style>


</head>
<body>
		<section>
			<form>

				<h1>QnA 글 조회 </h1>
				
				<table class="table" id="qnaTable">
					<thead>
						<tr>
							<th>Q&A글번호</th>
							<th>클래스명</th>
							<th>제목</th>
							<th>등록일자</th>
							<th>수정일자</th>
							<th>답변완료여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.pageList.content}">
		                        <tr>
		                            <th colspan="6">
		                                <span> 작성한 글이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.pageList.content}" var="qna">
		                            <tr>
		                                <td>${qna.qnaId}</td>
		                                <td>${qna.classes.className}</td>
		                                <td>
		                                <a href="${pageContext.request.contextPath}/main/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a>
		                                </td>
		                                <td>
				                        	<span><fmt:parseDate value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
				                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
				                        </td>
				                        <td>
				                        	<span><fmt:parseDate value="${qna.qnaUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
				                        	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
				                        </td>
				                        <td>${qna.qnaComplete}</td>
		                            </tr>
		                        </c:forEach>
		                    </c:otherwise>
		                </c:choose>
						
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
				<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
				<div style="text-align: center">
					
						<!--  블럭당  -->
				 <nav class="pagination-container">
					<div class="pagination">
					<c:set var="doneLoop" value="false"/>
						
						  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
						      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${startPage-1}">PREV</a>
						  </c:if>
						  
								<span class="pagination-inner"> 
								  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
								  
									<c:if test="${(i-1)>=pageList.getTotalPages()}">
									       <c:set var="doneLoop" value="true"/>
									</c:if> 
								     
								    <c:if test="${not doneLoop}" >
								         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${i}">${i}</a> 
								    </c:if>
								   
								  </c:forEach>
								</span> 
								<!-- 
								[다음]
				 
									  if( (시작페이지+한블록당뿌려질[]개수)<= 총페이지수){
									      [다음]출력;
									  }  
									
									  ex)if( (startPage+blockCount) <= pageCount){
									
									      }
								 -->
								 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
								     <a class="pagination-older" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${startPage+blockCount}">NEXT</a>
								 </c:if>
								 
							
						
						</div>
					</nav>  
				   </div>
				
			</form>
		</section>
		
</body>
</html>