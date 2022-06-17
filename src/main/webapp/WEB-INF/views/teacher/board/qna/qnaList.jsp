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
</style>

<script type="text/javascript">
$(function() {
	
	$(".qnaDetail").click(function(){
		//alert($(this).val());
		
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
				$(".insert-qnaId").val(`\${result.qnaId}`);
				
				$("#reply-teacher-insert #qnaId").html(`\${result.qnaId}`);
				
				let complete = result.qnaComplete;
				if(complete == "T"){
					$(".teacherNickname").html(`\${result.teacherNickname}`);
					$(".replyInsertDate").html(`\${result.replyInsertDate.toString().substring(0, 10)}`);
					$(".replyContent").html(`\${result.replyContent}`);
					
					$("#replyRequestForm #replyId").val(`\${result.replyId}`);
					$("#reply-teacher-update #replyId").val(`\${result.replyId}`);
					$(".replyUpdateForm").val(`\${result.replyId}`);

					$("#replyRequestForm").show();
					$(".answerModalTable").show();
					$(".reply").hide();
					$("#reply-teacher-insert").hide();
				} else {
					$("#replyDetail-form").text("")
					
					$("#replyRequestForm").hide();
					$(".answerModalTable").hide();
					$(".reply").show();
					$("#reply-teacher-insert").show();
				}
			},
			error: function(err){
				alert(err + "에러 발생");
			}
		})//ajax 끝
	})// $(".qnaTitle").click 끝
		
// 선택한 QnA글 가지고 수정폼으로 가기
$(".replyUpdateForm").click(function() {
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
		$("#replyRequestForm").attr("action", "${pageContext.request.contextPath}/qnaReplyDelete");
		$("#replyRequestForm").submit();
	 })
	   

		$(".reply").click(function() {
			$("#reply-teacher-insert").submit();
		})	
}); //ready 끝


</script>


</head>
<body>

	<div class="teacher-main-content">
		<section>
			<div id="allBookList">
				<table class="table qnaTable">
					<thead>
						<tr>
							<th>답변여부</th>
							<th>클래스명</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
							<th>답변일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty requestScope.list.content}">
								<tr>
									<th colspan="6"><span> 등록된 Q&A가 없습니다.</span></th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.list.content}" var="qna">
									<tr>
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
										<td>${qna.classes.className}</td>
										<td>
											<c:choose>
												<c:when test="${qna.blindState eq 'T'}">
													블라인드된 글입니다
												</c:when>
												<c:otherwise>
													<button class="btn btn-light qnaDetail" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${qna.qnaId}">${qna.qnaTitle}</button>
												</c:otherwise>
											</c:choose>
										</td>
										<td><span>${qna.student.studentId}</span></td>
										<td>
											${qna.qnaInsertDate.toString().substring(0, 10)}
										</td>
										<td>
				                        	<c:if test="${qna.qnaComplete == 'T'}">
				                        		${qna.classReply.replyInsertDate.toString().substring(0, 10)}
				                        	</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

				
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
		
		<!-- 답변시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<!-- Button trigger modal -->
		<form name="reply-teacher-insert" method="post" id="reply-teacher-insert" action="${pageContext.request.contextPath}/qnaReplyInsert">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="form-floating mb-3">
				<textarea class="form-control" placeholder="내용" id="replyContent" style="height: 100px" name="replyContent"></textarea>
				<label for="replyContent">내용</label>
			</div>
              
			<input type=hidden name="qnaId" class="insert-qnaId">
              
       	 </form>
		<!-- 강사 답변글 -->
        
        <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		
		
      <div class="modal-footer"><form name="replyRequestForm" method="post" id="replyRequestForm" >
			<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type=hidden name="replyId" id="replyId" value="${qnaReply.replyId}">
			
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary replyUpdateForm" data-bs-toggle="modal" data-bs-target="#replyUpdateModal" value="${qnaReply.replyId}">
			  답변 수정
			</button>
			<input class="btn btn-primary deleteBtn" type="button" value="답변 삭제" >
		</form>
        
		<button type="button" class="btn btn-primary reply">
		  답변하기
		</button><button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
      </div>
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
        <form name="reply-teacher-update" method="post" id="reply-teacher-update" action="${pageContext.request.contextPath}/qnaReplyUpdate">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
       		<input type=hidden name="replyId" value="${qnaReply.replyId}" id="replyId">
            <textarea class="form-control replyContent" id="exampleFormControlTextarea1" rows="3" name="replyContent">${qnaReply.replyContent}</textarea>
            <div class="modal-footer">
	      		<input type="submit" class="btn btn-primary" id="reply-update-btn" value="답변수정하기">
	        	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
	        </div>
       	 </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>