<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
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

<div class="main-content">
	
	<h5> 고객센터 > 공지사항 </h5>
	
	
	<form action="${pageContext.request.contextPath}/admin/board/Notice/noticeSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="text" id="keyword" name="keyword">
   	  <input type="submit" id="search" value="검색">
    </form>
    
    <hr><!-- 구분선 -->

	
	 <table class="table">
        <thead>
            <tr>
             <th>글번호</th>
             <th>작성자</th>
             <th>글제목</th>
             <th>작성일</th>
             <th>첨부파일</th>
             <th>조회수</th>
            </tr>
        </thead>
	
	<tbody>
	<c:choose>
	<c:when test="${empty requestScope.noList}">
		<tr>
          <th colspan="10">
          <span> 조회가능한 이벤트가 없습니다.</span>
          </th>
       </tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.noList.content}" var="notice">
			<tr>
				<td>
					${notice.noticeNo}
				</td>
				<td>
					관리자
				</td>
				<td>
				<a href="${pageContext.request.contextPath}/admin/board/Notice/noticeRead/${notice.noticeNo}">
				   ${notice.noticeTitle}
				   <c:set var="today" value="<%=LocalDateTime.now().minusDays(1)%>"/>
				  <c:if test="${notice.noticeInsertDate >= today}">
				  	<span class="badge rounded-pill bg-primary">new</span>
				  </c:if>
				</a>
				</td>
				<td>
					<fmt:parseDate value="${notice.noticeInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
				</td>
				<td>
				<c:if test="${notice.noticeImg != null}">
					<i class="fa fa-file-image-o" aria-hidden="true"></i>
				</c:if>
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

<hr>
<div style="text-align: center">
		<!--  블럭당  -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/board/Notice/noticeList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=noList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/board/Notice/noticeList?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=noList.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/board/Notice/noticeList?nowPage=${startPage+blockCount}">&nbsp;NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>

	<div align=right>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/Notice/write" role="button">글쓰기</a></div>
	</div>
	

</body>

</html>