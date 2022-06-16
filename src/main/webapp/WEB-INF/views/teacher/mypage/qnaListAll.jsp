<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : QnA 전체보기</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style type="text/css">
a {
	text-decoration: none;
}

table, th, td {
	text-align: center;
}

table {
	width: 1200px;
}

.pagination {
	display: block;
	text-align: center;
}
</style>

<script type="text/javascript">
$(function() {
	
	$(".qnaTitle").click(function(){
			//alert($(this).val());
			
			$.ajax({
				url:"${pageContext.request.contextPath}/main/board/qna/qnaRead",
				type: "post",
				data:{"${_csrf.parameterName}": "${_csrf.token}",
					  "qnaId" : $(this).val()	
				},
				dataType:"json",
				success : function(result) {
				
					$("#qnaDetail-form #qnaId").html(`\${result.qnaId}`); //span, div 같은 태그에는 .html 속성으로 부여.
					$("#qnaDetail-form #studentId").html(`\${result.studentId}`);
					$("#qnaDetail-form #className").html(`\${result.className}`);
					$("#qnaDetail-form #qnaInsertDate").html(`\${result.qnaInsertDate.toString().substring(0, 10)}`);
					$("#qnaDetail-form #qnaTitle").html(`\${result.qnaTitle}`);
					$("#qnaDetail-form #qnaComplete").html(`\${result.qnaComplete}`);
					$("#qnaDetail-form #qnaContent").html(`\${result.qnaContent}`);
					$("#insert-qnaId").val(`\${result.qnaId}`);
					
					$("#reply-teacher-insert #qnaId").html(`\${result.qnaId}`);
					
					
					
					let complete = result.qnaComplete;
					if(complete == "T"){
						
						$("#replyId").html(`\${result.replyId}`);
						$("#teacherNickname").html(`\${result.teacherNickname}`);
						$("#replyInsertDate").html(`\${result.replyInsertDate.toString().substring(0, 10)}`);
						$("#replyContent").html(`\${result.replyContent}`);
						
						
						$("#replyRequestForm #replyId").val(`\${result.replyId}`);
						$("#reply-teacher-update #replyId").val(`\${result.replyId}`);
						$(".replyUpdateForm").val(`\${result.replyId}`);
						
						
						$("#requestForm").remove();
						
					} else {
						$("#replyDetail-form").text("")
						$("#replyDetail-Card-body").remove();
						$("#replyRequestForm").remove();
					}
					
				},
				error: function(err){
					alert(err + "에러 발생");
				}
			})//ajax 끝
		})// $(".qnaTitle").click 끝
		
		// 선택한 QnA글 가지고 수정폼으로 가기
		$(".replyUpdateForm").click(function() {
			//alert($(this).val());
			$.ajax({
				url : "${pageContext.request.contextPath}/qnaReplyUpdateForm",
				type : "post",
				data: {
					"${_csrf.parameterName}":"${_csrf.token}",
					"replyId" : $(this).val()
				},
				success : function(result) {
					//alert(result)
					$("#reply-teacher-update #replyId").html(`\${result.replyId}`);
					$("#reply-teacher-update .replyContent").val(`\${result.replyContent}`);
				},
				error : function(error) {
					alert("QnA의 답변 글을 가져올 수 없습니다.");
				}
			}); // 아작스 종료
		})//$(".updateForm").click 끝
	   
		//답글 삭제하기
		 $(".deleteBtn").click(function(){
			   //alert(111);
			   $("#replyRequestForm").attr("action", "${pageContext.request.contextPath}/qnaReplyDelete");
			   $("#replyRequestForm").submit();
		   
	   })
	   
	   
	
}); //ready 끝


</script>


</head>
<body>

	<div class="teacher-main-content">
		<section>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>클래스명</th>
							<th>제목</th>
							<th>등록일자</th>
							<th>답변완료</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty requestScope.pageList.content}">
								<tr>
									<th colspan="6"><span> 등록된 Q&A가 없습니다.</span></th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.pageList.content}" var="qna">
									<tr>
										<td><span>${qna.qnaId}</span></td>
										<td><span>${qna.student.studentId}</span></td>
										<td>${qna.classes.className}</td>
										<td><c:choose>
												<c:when test="${qna.blindState eq 'T'}">
													<a>이 글은 관리자의 권한으로 블라인드처리가 되었습니다.</a>
												</c:when>
												<c:otherwise>
													<%-- <a href="${pageContext.request.contextPath}/teacher/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a> --%>
													<button class="btn btn-light qnaTitle" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${qna.qnaId}">${qna.qnaTitle}</button>
												</c:otherwise>
											</c:choose></td>
										<td><span><fmt:parseDate
													value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd"
													var="parseDate" /></span> <span><fmt:formatDate
													value="${parseDate}" pattern="yyyy-mm-dd" /></span></td>
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

				<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
				<div style="text-align: center">

					<!--  블럭당  -->
					<nav class="pagination-container">
						<div class="pagination">
							<c:set var="doneLoop" value="false" />

							<c:if test="${(startPage-blockCount) > 0}">
								<!-- (-2) > 0  -->
								<a class="pagination-newer"
									href="${pageContext.request.contextPath}/teacher/mypage/qnaListAll?nowPage=${startPage-1}">PREV</a>
							</c:if>

							<span class="pagination-inner"> <c:forEach var='i'
									begin='${startPage}' end='${(startPage-1)+blockCount}'>

									<c:if test="${(i-1)>=pageList.getTotalPages()}">
										<c:set var="doneLoop" value="true" />
									</c:if>

									<c:if test="${not doneLoop}">
										<a class="${i==nowPage?'pagination-active':page}"
											href="${pageContext.request.contextPath}/teacher/mypage/qnaListAll?nowPage=${i}">${i}</a>
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
								<a class="pagination-older"
									href="${pageContext.request.contextPath}/teacher/mypage/qnaListAll?nowPage=${startPage+blockCount}">NEXT</a>
							</c:if>



						</div>
					</nav>
				</div>

			</div>
		</section>
	</div>

<!-- QnA 상세보기 모달 -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Q&A 글 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="card" style="width: 29rem;" id="qnaDtail-Card-body">
          <div class="card-body">
			<form id="qnaDetail-form">
				<div>답변완료&nbsp;&nbsp;<span id="qnaComplete"></span></div>
			    <div>글번호&nbsp;&nbsp;<span id="qnaId"></span></div>
			    <div>작성자&nbsp;&nbsp;<span id="studentId"></span></div>
			    <div>클래스 이름&nbsp;&nbsp;<span id="className"></span></div>
			    <div>작성 날짜&nbsp;&nbsp;<span id=qnaInsertDate></span></div>
			    <div>제목&nbsp;&nbsp;<span id="qnaTitle"></span></div>
			    <div>내용&nbsp;&nbsp;</div>
			    <div id="qnaContent"></div>
			</form>

		  </div>
        </div>
        
		<!-- 답변시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<form name="requestForm" method="post" id="requestForm" >
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-primary reply" data-bs-toggle="modal" data-bs-target="#replyModal">
			  답변하기
			</button>

		</form>
		
		<!-- 강사 답변글 -->
		<div class="modal-body">
        <div class="card" style="width: 27rem;" id="replyDetail-Card-body">
          <div class="card-body">
			<form id="replyDetail-form">
			    <div>글번호&nbsp;&nbsp;<span id="replyId"></span></div>
			    <div>작성자&nbsp;&nbsp;<span id="teacherNickname"></span></div>
			    <div>작성 날짜&nbsp;&nbsp;<span id="replyInsertDate"></span></div>
			    <div>내용&nbsp;&nbsp;</div>
			    <div id="replyContent"></div>	
			</form>
		  </div>
        </div>
        
        <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<form name="replyRequestForm" method="post" id="replyRequestForm" >
			<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type=hidden name="replyId" id="replyId" value="${qnaReply.replyId}">
		
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-primary replyUpdateForm" data-bs-toggle="modal" data-bs-target="#replyUpdateModal" value="${qnaReply.replyId}">
			  답글 수정하기
			</button>
			<input class="btn btn-outline-primary deleteBtn" type="button" value="답글 삭제하기" >

		</form>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
 </div>
</div>

<!-- Button trigger modal QnA 답변하기 -->

<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">QnA 답변하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form name="reply-teacher-insert" method="post" id="reply-teacher-insert" action="${pageContext.request.contextPath}/qnaReplyInsert">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
       		<input type=hidden name="qnaId" id="insert-qnaId" value="${qna.qnaId}">
       		<div><span id="qnaId"></span>번 Q&A글에  답변 등록 </div>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
              
              <%-- <input type=hidden name="teacherId" value="${teacherId}" id="teacherId"> --%>
			  <input type=hidden name="teacherId" value="Tann1234" id="teacherId">
              
              <div class="modal-footer">
		      	<input type="submit" class="btn btn-primary" id="reply-insert-btn" value="답변등록하기">
		        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button> 
		      </div>
       	 </form>
      </div>
      
    </div>
  </div>
</div>	


<!-- Button trigger modal QnA 답글 수정하기-->

<!-- Modal -->
<div class="modal fade" id="replyUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">QnA 답글 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="reply-teacher-update" method="post" id="reply-teacher-update" action="${pageContext.request.contextPath}/qnaReplyUpdate">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
       		<input type=hidden name="replyId" value="${qnaReply.replyId}" id="replyId">
       		<div><span id="replyId"></span>번 답글 수정</div>
            <textarea class="form-control replyContent" id="exampleFormControlTextarea1" rows="3" name="replyContent">${qnaReply.replyContent}</textarea>
            <%-- <input type=hidden name="qnaId" value="${classQna.qnaId}" id="qnaId">
			<input type=hidden name="teacherId" value="${teacher.teacherId}" id="teacherId">
            <input type="hidden" name="replyId" value="${replyId}"> --%>
            
            <div class="modal-footer">
	      		<input type="submit" class="btn btn-primary" id="reply-update-btn" value="답변수정하기">
	        	<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
	        </div>
       	 </form>
      </div>
      
    </div>
  </div>
</div>

</body>
</html>