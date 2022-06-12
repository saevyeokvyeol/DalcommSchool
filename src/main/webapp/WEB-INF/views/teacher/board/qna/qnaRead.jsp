<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : Q&A 상세보기</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script type="text/javascript">
	$(function() {
		//alert(1);
		
		// 선택한 QnA글 가지고 수정폼으로 가기
		$(".updateForm").click(function() {
			alert(${replyId});
			$.ajax({
				url : "${pageContext.request.contextPath}/qnaReplyUpdateForm",
				type : "post",
				data: {
					"${_csrf.parameterName}":"${_csrf.token}",
					"replyId" : ${replyId}
				},
				success : function(result) {
					//alert(result)
					//$("#reply-teacher-insert .replyId").val(`\${result.replyId}`);
					$("#reply-teacher-insert .replyContent").val(`\${result.replyContent}`);
				},
				error : function(error) {
					alert("QnA의 답변 글을 가져올 수 없습니다.");
				}
			}); // 아작스 종료
		})//$(".updateForm").click 끝
		
	   
		
	});
</script>
</head>
<body>

<div class="main-content">
	
	<div>
        <table>
        
            <tr>
            	<th>클래스 ID</th>
                <td>${qna.classes.classId}</td>
            </tr>
        	<tr>
                <th>작성자</th>
                <td>${qna.student.studentId}</td>
                <th>등록일자</th>
                <td>
                	<span><fmt:parseDate value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
                	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
                </td>
                <th>수정일자</th>
                <td>
                	<span><fmt:parseDate value="${qna.qnaUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
                	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${qna.qnaTitle}</td>
                <th>답변완료</th>
                <td>${qna.qnaComplete}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${qna.qnaContent}</td>
            </tr>
        </table>
        
        <!-- 답변시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<!-- <form name="requestForm" method="post" id="requestForm"> -->
			<%-- <input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type=hidden name="qnaId" value="${qna.qnaId}">
			<input type=hidden name="classId" value="${qna.classes.classId}" id="classId">
			<input type=hidden name="studentId" value="${qna.student.studentId}" id="studentId">
			<input type=hidden name="qnaComplete" value="${qna.qnaComplete}" id="qnaComplete"> --%>
			<c:choose>
				<c:when test="${qna.qnaComplete eq 'T'}">
					<input type=hidden value="답변하기" >
				</c:when>
				<c:otherwise>
					<!-- <input class="btn btn-outline-primary"  type=button value="답변하기" > -->
					<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  답변하기
					</button>
				</c:otherwise>
			</c:choose>
		 <!-- </form> -->
        
    </div>
    
    <hr>
    <div>
        <table>
            <c:choose>
            	<c:when test="${qna.qnaComplete eq 'T' }">
            		<tr>
		                <th>작성자</th>
		                <td>${qnaReply.teacher.teacherId}</td>
		                <th>등록일자</th>
		              	<td>
		              	<span><fmt:parseDate value="${qnaReply.replyInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		              	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		              	</td>
		              	<th>수정일자</th>
		              	<td>
		              	<span><fmt:parseDate value="${qnaReply.replyUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
		              	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
		              	</td>
				    </tr>
		            <tr>
		                <th>내용</th>
		                <td>${qnaReply.replyContent}</td>
		            </tr>
		            <tr>
		            	<td>
		            		<button type="button" class="btn btn-outline-primary updateForm" data-bs-toggle="modal" data-bs-target="#exampleModal2">
							  답글 수정하기
							</button>
		            		<%-- <a class="btn btn-outline-primary"  href="${pageContext.request.contextPath}/qnaReplyUpdateForm/${qnaReply.replyId}">답글 수정하기</a> --%>
		            		<a class="btn btn-outline-primary"  href="${pageContext.request.contextPath}/qnaReplyDelete/${qnaReply.replyId}">답글 삭제하기</a>
		            	<td>
		            </tr>
            	</c:when>
            </c:choose>
        	
            
        </table>
        
    	
    </div>
    
    <hr>
    
   
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/teacher/teacherMypage/qnaListAll">목록으로 돌아가기</a>&gt;</span></div>
	
    
</div>

<!-- Button trigger modal QnA 답변하기 -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">QnA 답변하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form name="reply-teacher-insert" method="post" id="reply-teacher-insert" action="${pageContext.request.contextPath}/qnaReplyInsert">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
       		<b>${qnaId}번 Q&A글에  답변 등록 </b>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
              <%-- <input type=hidden name="qnaId" value="${classQna.qnaId}" id="qnaId">
			  <input type=hidden name="teacherId" value="${teacher.teacherId}" id="teacherId">
              <input type="hidden" name="replyId" value="${replyId}"> --%>
              <input type=hidden name="qnaId" value="${qnaId}" id="qnaId">
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
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="reply-teacher-update" method="post" id="reply-teacher-update" action="${pageContext.request.contextPath}/qnaReplyUpdate">
       		<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
       		<b>${qnaReply.replyId}번 답글 수정 </b>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent">${qnaReply.replyContent}</textarea>
            <%-- <input type=hidden name="qnaId" value="${classQna.qnaId}" id="qnaId">
			<input type=hidden name="teacherId" value="${teacher.teacherId}" id="teacherId">
            <input type="hidden" name="replyId" value="${replyId}"> --%>
            <input type=hidden name="replyId" value="${qnaReply.replyId}" id="replyId">
            <div class="modal-footer">
	      		<input type="submit" class="btn btn-primary" id="reply-insert-btn" value="답변수정하기">
	        	<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
	        </div>
       	 </form>
      </div>
      
    </div>
  </div>
</div>


</body>
</html>