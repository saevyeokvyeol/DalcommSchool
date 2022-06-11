<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 QnA :상세보기</title>
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
	

</style>

<script type="text/javascript">
	$(function() {
		//alert(1);
	   
		
	});
</script>
</head>
<body>

<div class="main-content">
	<section>
    
    <div class="card" style="width: 70rem;">
		<div class="card-body">
		
        <table>
        	<tr>
                <th>작성자</th>
                <td><span>${qna.student.studentId}</span></td>
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
            	</c:when>
            </c:choose>
        	
        </table>
        
    	</div>
    </div>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/admin/board/qna/qnaListBlind">목록으로 돌아가기</a>&gt;</span></div>

	</section>
</div>

</body>
</html>