<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : QnA 전체보기</title>
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

</head>
<body>

<div class="teacher-main-content">
	<section>
    <div>
        <table>
            <thead>
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
                    <c:when test ="${empty requestScope.list}">
                        <tr>
                            <th colspan="6">
                                <span> 등록된 Q&A가 없습니다.</span>
                            </th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.list}" var="qna">
                            <tr>
                                <td><span>${qna.qnaId}</span></td>
                                <td><span>${qna.student.studentId}</span></td>
                                <td>
                                    <c:choose>
                                    	<c:when test="${qna.blindState eq 'T'}">
	                                        <a>이 글은 관리자의 권한으로 블라인드처리가 되었습니다.</a>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<a href="${pageContext.request.contextPath}/teacher/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a>
	                                    </c:otherwise>
                                    </c:choose>
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
    </div>
    </section>
</div>


</body>
</html>