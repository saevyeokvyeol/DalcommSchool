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
													<a href="${pageContext.request.contextPath}/teacher/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a>
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

	


</body>
</html>