<%@page import="java.time.LocalDateTime"%>
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
<script type="text/javascript">

</script>
<title>Insert title here</title>
</head>
<body>

	<div id="sidebarHeader">
<h3>FAQ 리스트</h3>



<div>
    <a href="${pageContext.request.contextPath}/main/board/FAQ/faqList">전체보기</a>

          <a href="${pageContext.request.contextPath}/main/board/FAQ/faqCategoryId/1">예약</a>

           <a href="${pageContext.request.contextPath}/main/board/FAQ/faqCategoryId/2">결제</a>
</div>
      <form action="${pageContext.request.contextPath}/main/board/FAQ/userfaqSearch" method="get">
        <div id="boardSearchBox">
      		<input type="text" class="form-control me-2" id="keyword" name="keyword">
			<input type="submit" class="btn btn-primary" id="search" value="검색">
        </div>
      </form>
</div>

<div class="accordion" id="faq-accordion">
	<c:forEach items="${requestScope.list.content}" var="faq">
		<div class="accordion-item">
			<h2 class="accordion-header" id="heading-${faq.faqNo}">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${faq.faqNo}" aria-expanded="false" aria-controls="collapse-${faq.faqNo}">
					${faq.faqTitle}
					&nbsp;
					<c:if test="${faq.faqImg != null}">
						<i class="fa fa-file-image-o" aria-hidden="true"></i>
					</c:if>
					&nbsp;
					<c:set var="today" value="<%=LocalDateTime.now().minusDays(1)%>"/>
					<c:if test="${faq.faqInsertDate >= today}">
						<span class="badge rounded-pill bg-primary">new</span>
					</c:if>
				</button>
			</h2>
			
			<div id="collapse-${faq.faqNo}" class="accordion-collapse collapse" aria-labelledby="heading-${faq.faqNo}" data-bs-parent="#faq-accordion">
				<div class="accordion-body">
			     	<c:if test="${faq.faqImg != null}">
					<img alt="" src="${pageContext.request.contextPath}/img/faq/${faq.faqImg}">
			     	</c:if>
					${faq.faqContent}
				</div>
			</div>
		</div>
	</c:forEach>
</div>


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
					<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
		<c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
			<li class="page-item">
				<a class="page-link" href="${URL}?page=${startPage+blockCount}">다음</a>
			</li>
		</c:if>
	</ul>
</nav>



</body>

</html>