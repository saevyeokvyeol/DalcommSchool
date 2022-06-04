<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>선생님 : Q&A 상세보기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
		
		$("input[value=답변하기]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/qnaReplyWriteForm");
		   $("#requestForm").submit();
	   })
		
		
	   
		
	});
</script>
</head>
<body>

    <div>
        <table>
            
        	<tr>
                <th>작성자</th>
                <td>${qna.student.studentId}</td>
                <th>등록일자</th>
                <td>${qna.qnaInsertDate}</td>
                <th>클래스 아이디</th>
                <td>${qna.classes.classId}</td>
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
            <tr>
		        <td height="20" colspan="3" align="center" valign="middle">
					<!-- 답변시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
					<form name="requestForm" method="post" id="requestForm">
						<input type=hidden name="qnaId" value="${qna.qnaId}">
						<input type=hidden name="classId" value="${qna.classes.classId}" id="classId">
						<input type=hidden name="studentId" value="${qna.student.studentId}" id="studentId">
						<input type=hidden name="qnaComplete" value="${qna.qnaComplete}" id="qnaComplete">
						<c:choose>
							<c:when test="${qna.qnaComplete eq 'T'}">
								<input type=hidden value="답변하기" >
							</c:when>
							<c:otherwise>
								<input type=button value="답변하기" >
							</c:otherwise>
						</c:choose>
						
					 </form>
				 </td>
		     </tr>
            
        </table>
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
		                <td>${qnaReply.replyInsertDate}</td>
		                <th>수정일자</th>
		                <td>${qnaReply.replyUpdateDate}</td>
				    </tr>
		            <tr>
		                <th>내용</th>
		                <td>${qnaReply.replyContent}</td>
		            </tr>
		            <tr>
		            	<td>
		            		<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/qnaReplyUpdateForm/${qnaReply.replyId}">답글 수정하기</a>
		            		<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/qnaReplyDelete/${qnaReply.replyId}">답글 삭제하기</a>
		            	<td>
		            </tr>
            	</c:when>
            </c:choose>
        	
            
        </table>
    </div>
    <hr>
    
   
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/teacher/board/qna/qnaList_th">목록으로 돌아가기</a>&gt;</span></div>


</body>
</html>