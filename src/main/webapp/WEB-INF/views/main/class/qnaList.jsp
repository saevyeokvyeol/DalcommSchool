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

<title>QnA: 전체보기</title>
</head>
<body>

    <div>
        <table>
            <thead>
            	<tr>
            		<th colspan="6">
            			<p align="right"><a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/main/class/qnaWrite">문의글 작성하기</a></p>
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
                                <td><span>${qna.student.studentId.substring(0,4)}****</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/main/class/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a>   
                                </td>
                                <td><span>${qna.qnaInsertDate}</span></td>
                                <td><span>${qna.qnaUpdateDate}</span></td>
                                <td><span>${qna.qnaComplete}</span></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>


</body>
</html>