<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
	<h1>이벤트 리스트 페이지 입니다</h1>
	
	<form action="${pageContext.request.contextPath}/admin/board/event/eventSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="text" id="keyword" name="keyword">
   	  <input type="submit" id="search" value="검색">
    </form>
    
    <hr><!-- 구분선 -->

	
	 <table>
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
	<c:when test="${empty requestScope.eventList}">
		<tr>
          <th colspan="10">
          <span> 조회가능한 이벤트가 없습니다.</span>
          </th>
       </tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${requestScope.eventList.content}" var="event">
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

<hr>
<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
<div style="text-align: center">
		<!--  블럭당  -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/board/event/eventList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=pageList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/board/event/eventList?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/board/event/eventList?nowPage=${startPage+blockCount}">NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>

<div align=right>
<span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/board/event/eventWrite">글쓰기</a>&gt;</span></div>


</body>
</html>