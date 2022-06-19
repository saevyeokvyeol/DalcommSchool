<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자신이 쓴 QnA 글 전체 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

</style>

<script type="text/javascript">
$(function() {
	
	//상세보기 모달
	$(".qna-Title").click(function(){
			//swal($(this).val());
			
			$.ajax({
				url:"${pageContext.request.contextPath}/main/board/qna/qnaRead",
				type: "post",
				data:{"${_csrf.parameterName}": "${_csrf.token}",
					  "qnaId" : $(this).val()	
				},
				dataType:"json",
				success : function(result) {
				
					$(".studentId").html(`\${result.studentId}`);
					$(".className").html(`\${result.className}`);
					$(".qnaInsertDate").html(`\${result.qnaInsertDate.toString().substring(0, 10)}`);
					$(".qnaTitle").html(`\${result.qnaTitle}`);
					$(".qnaContent").html(`\${result.qnaContent}`);
					
					let complete = result.qnaComplete;
					if(complete == "T"){
						$(".teacherNickname").html(`\${result.teacherNickname}`);
						$(".replyInsertDate").html(`\${result.replyInsertDate.toString().substring(0, 10)}`);
						$(".replyContent").html(`\${result.replyContent}`);

						$(".answerModalTable").show();
						
					} else {
						
						$(".answerModalTable").hide();
						
					}
					
				},
				error: function(err){
					swal(err + "에러 발생");
				}
			})//ajax 끝
		})// $(".qnaTitle").click 끝
	
	   
	
}); //ready 끝


</script>


</head>
<body>


	<section>
	    <div>
	    	
<div id="sidebarHeader"><h3>내가 쓴 Q&A 글</h3></div>
	        <table class="table qnaTable">
	            <thead>
	                <tr>
		                <th>번호</th>
		                <th>작성자</th>
		                <th>제목</th>
		                <th>등록일자</th>
		                <th>답변완료</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test ="${empty requestScope.list.content}">
	                        <tr>
	                            <th colspan="6">
	                                <span> 등록된 Q&A가 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.list.content}" var="qna">
	                            <tr>
	                                <td><span>${qna.qnaId}</span></td>
	                                <td><span>${qna.student.studentId}</span></td>
	                                <td>
	                                    <c:choose>
	                                    	<c:when test="${qna.blindState eq 'T'}">
		                                        <a>이 글은 관리자의 권한으로 블라인드처리가 되었습니다.</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<button class="btn btn-light qna-Title" data-bs-toggle="modal" data-bs-target="#exampleModal2" value="${qna.qnaId}">${qna.qnaTitle}</button>
		                                    </c:otherwise>   
	                                    </c:choose>
	                                    <%-- <a href="${pageContext.request.contextPath}/main/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a> --%>
	                                </td>
			                        <td>
			                        	<span><fmt:parseDate value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
	                                <td>
				                        <c:choose>
				                        	<c:when test="${qna.qnaComplete == 'F'}">
				                        		<span class="badge bg-secondary">미답변</span>
				                        	</c:when>
				                        	<c:when test="${qna.qnaComplete == 'T'}">
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
       
	        <!--  페이징처리  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:set var="doneLoop" value="false" />
					<c:if test="${(startPage-blockCount) > 0 and list.content.size() != 0}">
						<li class="page-item">
							<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
						</li>
					</c:if>
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
							<c:if test="${(i-1)>=list.getTotalPages()}">
								<c:set var="doneLoop" value="true" />
							</c:if>
							<c:if test="${not doneLoop}">
								<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
					<c:if test="${(startPage+blockCount) <= list.getTotalPages()}">
						<li class="page-item">
							<a class="page-link" href="${URL}?${location.search}page=${startPage+blockCount}">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
	        
	        
	    </div>
	</section>

<!-- QnA 상세보기 모달 -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Q&A 글 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-borderless questionModalTable">
			<tr>
				<td class="className" colspan="2"></td>
			</tr>
			<tr>
				<td class="studentId"></td>
				<td class="qnaInsertDate"></td>
			</tr>
			<tr>
				<td class="qnaTitle" colspan="2"></td>
			</tr>
			<tr>
				<td class="qnaContent" colspan="2"></td>
			</tr>
		</table>
        
		<hr>
		
		<table class="table table-borderless answerModalTable">
			<tr>
				<td class="teacherNickname"></td>
				<td class="replyInsertDate"></td>
			</tr>
			<tr>
				<td class="replyContent" colspan="2"></td>
			</tr>
		</table>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
 </div>
</div>






	

</body>
</html>