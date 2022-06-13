<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 클래스 QnA: 전체보기</title>
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

<div class="main-content">
	<section>
	    <div>
	    	<h1>QnA</h1>
	    	
	        <table class="table">
	            <thead>
	            	<tr>
	            		<th colspan="6">
	            			<p align="right">
		            			<!-- Button trigger modal -->
								<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
								  문의글 작성하기
								</button>
							</p>
	            		</th>
	            	</tr>
	                <tr>
		                <th>번호</th>
		                <th>작성자</th>
		                <th>제목</th>
		                <th>등록일자</th>
		                <th>수정일자</th>
		                <th>답변완료</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test ="${empty requestScope.pageList.content}">
	                        <tr>
	                            <th colspan="6">
	                                <span> 등록된 Q&A가 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.pageList.content}" var="qna">
	                            <tr>
	                                <td><span>${qna.qnaId}</span></td>
	                                <td><span>${qna.student.studentId.substring(0,4)}****</span></td>
	                                <td>
	                                    <%-- <c:choose>
	                                    	<c:when test="${qna.blindState eq 'T'}">
		                                        <a>이 글은 관리자의 권한으로 블라인드처리가 되었습니다.</a>
		                                    </c:when>
		                                    <c:when test="${qna.secretState eq 'T'}">
		                                        <a href="${pageContext.request.contextPath}/main/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a> 
		                                    </c:when>
		                                    <c:when test="${qna.secretState eq 'F'}">
		                                        <a>비밀글입니다</a>
		                                    </c:when>    
	                                    </c:choose> --%>
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
	                                <td><span>${qna.qnaComplete}</span></td>
	                            </tr>
	                        </c:forEach>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	        
	        <%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
				<div style="text-align: center">
					
						<!--  블럭당  -->
				 <nav class="pagination-container">
					<div class="pagination">
					<c:set var="doneLoop" value="false"/>
						
						  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
						      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/qna/qnaList?nowPage=${startPage-1}">PREV</a>
						  </c:if>
						  
								<span class="pagination-inner"> 
								  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
								  
									<c:if test="${(i-1)>=pageList.getTotalPages()}">
									       <c:set var="doneLoop" value="true"/>
									</c:if> 
								     
								    <c:if test="${not doneLoop}" >
								         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/qna/qnaList?nowPage=${i}">${i}</a> 
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
								     <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/qna/qnaList?nowPage=${startPage+blockCount}">NEXT</a>
								 </c:if>
								 
							
						
						</div>
					</nav>  
				   </div>
	        
	        
	    </div>
	</section>
</div>	


<!-- QnA 문의글 작성하기  모달-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">문의글 작성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!--QnA 등록하기-->
          <div class="card" style="width: 29rem;">
            <div class="card-body">
              <form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/qna/qnaInsert" >
                <input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
                <%-- <input type="hidden" name="classId" value="${qna.classes.classId}">
                <input type="hidden" name="studentId" value="${qna.student.studentId}">
                --%>
                <input type="hidden" name="classId" value="2">
                <input type="hidden" name="studentId" value="lee1234">
                <div>
				  제목
				  <input class="form-control" type=text name="qnaTitle" size="30" id="qnaTitle">
				</div>
				<div>
				  내용 
				  <textarea class="form-control" name="qnaContent" id="qnaContent" rows="10" cols="33"></textarea>	
				</div>
				<div>
				  비밀글 체크
				  <!-- <input class="form-check-input" type="checkbox" id="inlineFormCheck" name="secretState" value="T">공개 --> 
				  <input class="form-check-input" type="checkbox" id="inlineFormCheck" name="secretState" value="F">비공개
				</div>
				<div class="modal-footer">
			      <input type="submit" class="btn btn-primary" id="qna-insert-btn" value="등록하기">
			      <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
		      	</div>
              </form>
            </div>
         </div>
       </div>
      
    </div>
  </div>
</div>

	

</body>
</html>