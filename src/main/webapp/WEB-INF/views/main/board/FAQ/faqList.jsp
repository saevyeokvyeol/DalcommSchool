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
<div class="main-content">
<h1>FAQ 리스트</h1>



<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/main/board/FAQ/faqList">전체보기</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/main/board/FAQ/faqCategoryId/1">예약</a>
          
        </li>
        <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/main/board/FAQ/faqCategoryId/2">결제</a>
        </li>
      </ul>
      <form class="d-flex" action="${pageContext.request.contextPath}/main/board/FAQ/userfaqSearch" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="keyword" name="keyword">
        <button class="btn btn-outline-success" type="submit" id="search">Search</button>
      </form>
    </div>
  </div>
</nav>

<hr>

<div class="accordion accordion-flush" id="accordionFlushExample">

	<c:forEach items="${requestScope.faqlist.content}" var="faq">
		<c:choose>

			<c:when test="${faq.faqCategory.faqCategoryId eq 1}">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faqNo}" aria-expanded="false" aria-controls="flush-collapseOne">
							${faq.faqTitle}
							 &nbsp;
							<c:set var="today" value="<%=LocalDateTime.now().minusDays(1)%>"/>
				  <c:if test="${faq.faqInsertDate >= today}">
				  	<span class="badge rounded-pill bg-primary">new</span>
				  </c:if>
				  &nbsp;
				  <c:if test="${faq.faqImg != null}">
					<i class="fa fa-file-image-o" aria-hidden="true"></i>
				</c:if>
							</button>
					</h2>
					<div id="flush-collapseOne${faq.faqNo}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<a href="${pageContext.request.contextPath}/main/board/FAQ/faqRead/${faq.faqNo}">
								${faq.faqContent}
							</a>
							<img alt="" src="${pageContext.request.contextPath}/img/faq/${faq.faqImg}">
						</div>

					</div>
				</div>
			</c:when>
			<c:when test="${faq.faqCategory.faqCategoryId eq 2}">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faqNo}" aria-expanded="false" aria-controls="flush-collapseOne">
							${faq.faqTitle}
							</button>
					</h2>
					<div id="flush-collapseOne${faq.faqNo}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							<a href="${pageContext.request.contextPath}/main/board/FAQ/faqRead/${faq.faqNo}">
								${faq.faqContent}
								<img alt="" src="${pageContext.request.contextPath}/img/faq/${requestScope.faq.faqImg}">
							</a>
						</div>

					</div>
				</div>
			</c:when>

			
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>

	</c:forEach>

<div style="text-align: center">
		<!--  블럭당  -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/FAQ/faqList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=faqlist.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/FAQ/faqList?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=faqlist.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/FAQ/faqList?nowPage=${startPage+blockCount}">&nbsp;NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>


</div>

</div>
</body>

</html>