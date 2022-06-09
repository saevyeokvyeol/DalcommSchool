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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<style type="text/css">
	section {width: 1200px; margin: auto;}
	table {width: 1200px;}
	th, td {border: 1px solid black;}
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
							<th>클래스ID</th>
							<th>제목</th>
							<th>등록일자</th>
							<th>수정일자</th>
							<th>답변완료여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.list}">
		                        <tr>
		                            <th colspan="6">
		                                <span> 작성한 글이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.list}" var="qna">
		                            <tr>
		                                <td>${qna.qnaId}</td>
		                                <td>${qna.classes.classId}</td>
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
				
			</form>
		</section>
		
</body>
</html>