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
	
	<form action="${pageContext.request.contextPath}/admin/eventSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div class="row g-3">
		<div class="col-md-8">
		</div>	
		<div class="col-md-3">
      		<input type="text" class="form-control" id="keyword" name="keyword">
		</div>
		<div class="col-md-1">
			<input type="submit" class="btn btn-primary" id="search" value="검색">
		</div>
	</div>
    </form>
    
    <hr><!-- 구분선 -->

	
	 <table class="table">
        <thead>
            <tr>
             <th>글번호</th>
             <th>작성자</th>
             <th>글제목</th>
             <th>작성일</th>
             <th>조회수</th>
            </tr>
        </thead>
	
	<tbody>
	<c:choose>
	<c:when test="${empty requestScope.list}">
		<tr>
          <th colspan="10">
          <span> 조회가능한 이벤트가 없습니다.</span>
          </th>
       </tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.list.content}" var="event">
			<tr>
				<td>
					${event.eventNo}
				</td>
				<td>
					관리자
				</td>
				<td>
				<a href="${pageContext.request.contextPath}/admin/board/event/eventRead/${event.eventNo}">
					${event.eventTitle}
				</a>
				</td>
				<td>
					<fmt:parseDate value="${event.eventInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
				</td>
				<td>
					${event.eventViews}
				</td>
			</tr>		
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>
</table>

<!--  페이징처리  -->
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:set var="doneLoop" value="false" />
		<c:if test="${(startPage-blockCount) > 0}">
			<li class="page-item disabled">
				<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
			</li>
		</c:if>
			<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
				<c:if test="${(i-1)>=pageList.getTotalPages()}">
					<c:set var="doneLoop" value="true" />
				</c:if>
				<c:if test="${not doneLoop}">
					<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${pageContext.request.contextPath}/admin/board/event/eventList?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
		<c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
			<li class="page-item">
				<a class="page-link" href="${URL}?page=${startPage+blockCount}">다음</a>
			</li>
		</c:if>
	</ul>
</nav>

	<div align=right>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/event/eventWrite" role="button">글쓰기</a>
	</div>

</body>
</html>