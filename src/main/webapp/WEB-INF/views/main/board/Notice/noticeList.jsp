<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}
</style>

</head>
<body>
		<div id="boardHeader">
	<h3>
		공지사항
	</h3>
		<form action="${pageContext.request.contextPath}/main/board/Notice/noticeSearch" method="get">
			<div id="boardSearchBox">
		      <input class="form-control" type="text" id="keyword" name="keyword">
		   	  <input class="btn btn-primary" type="submit" id="search" value="검색">
		    </div>
	    </form>
</div>
	

	<div id="boardListBox">
		 <table class="table">
	        <thead>
	            <tr>
	             <th>글번호</th>
	             <th>제목</th>
	             <th>작성일</th>
	             <th>조회수</th>
	            </tr>
	        </thead>
			
			<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
			          <th colspan="5">
			          <span>공지사항이 없습니다</span>
			          </th>
			       </tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.list.content}" var="notice">
						<tr>
							<td>
								${notice.noticeNo}
							</td>
							<td>
							<a href="${pageContext.request.contextPath}/main/board/Notice/noticeRead/${notice.noticeNo}">
							   ${notice.noticeTitle}
							</a>
							</td>
							<td>
								<fmt:parseDate value="${notice.noticeInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
								<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
							</td>
							<td>
								${notice.noticeViews}
							</td>
						</tr>		
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

<div style="text-align: center">
		<!--  블럭당  -->
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

</body>

</html>