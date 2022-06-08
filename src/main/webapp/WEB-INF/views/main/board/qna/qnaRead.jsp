<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>QnA :상세보기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
		$("input[value=수정하기]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/qna/qnaUpdateForm");
		   $("#requestForm").submit();
	   })
	   
	    $("input[value=삭제하기]").click(function(){
		   
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/qna/qnaDelete");
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
                <td>${qna.student.studentId.substring(0,4)}****</td>
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
            
		    <tr>
		        <td height="20" colspan="3" align="center" valign="middle">
					<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
					<form name="requestForm" method="post" id="requestForm">
						<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type=hidden name="qnaId" value="${qna.qnaId}">
						<input type=hidden name="classId" value="${qna.classes.classId}" id="classId">
						<input type=hidden name="studentId" value="${qna.student.studentId}" id="studentId">
						
						<c:choose>
							<c:when test="${qna.qnaComplete eq 'T'}">
			 					<input type=hidden value="수정하기" >
								<input type=hidden value="삭제하기" >
							</c:when>
							<c:otherwise>
								<input type=button value="수정하기" >
								<input type=button value="삭제하기" >
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
            	<c:when test="${qna.qnaComplete eq 'T'}">
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
            	</c:when>
            </c:choose>
        	
            
        </table>
    </div>
    
    <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/main/board/qna/qnaList">목록으로 돌아가기</a>&gt;</span></div>


</body>
</html>