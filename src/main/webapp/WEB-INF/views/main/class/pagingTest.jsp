<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 <table>
		  <thead>
		    <tr>
		      <th>아이디</th>
		      <th>별점</th>
		      <th>내용</th>
		      <th>작성 날짜</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:choose>
		      <c:when test="${requestScope.classReviews.content==null}">
		        <tr>
		          <th colspan="4">
		            <span>등록된 후기가 없습니다.</span>
		          </th>
		        </tr>
		      </c:when>
		      <c:otherwise>
		        <c:forEach items="${classReviews.content}" var="review">
		          <div id="review">
		          <tr>
		            <td><span>${review.student.studentId}</span></td>
		            <td><span>${review.reviewRate}</span></td>
		            <td><span>${review.reviewContent}</span></td>
		            <td><span>${review.reviewInsertDate}</span></td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		  <tfoot>
		    <input type="button" value="후기 남기기" onclick="location.href='${pageContext.request.contextPath}/main/board/review/insertForm'">
		  </tfoot>
		</table>
		
		<!-- 페이징 처리 -->
		<div>
		  <nav class="pagination-container">
		    <div class="pagination">
		      <c:set var="doneLoop" value="false"/>
		      		<c:if test="${(startPage-blockCount)>0 }">
		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/review/reviewList/{classId}?nowPage=${startPage-1}">이전</a>	      		
		      		</c:if>
		      		
		      		<span class="pagination-inner">
		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
		      		    
		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
		      		      <c:set var="doneLoop" value="true"/>
		      		    </c:if>
		      		    <c:if test="${not doneLoop}">
		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/review/reviewList/${classId}?nowPage=${i}">${i}</a>
		      		    </c:if>
		      		    
		      		  </c:forEach>
		      		</span>
		      		
		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/review/reviewList/${classId}?nowPage=${startPage+blockCount}">다음</a>
		      		</c:if>
		    </div>
		  
		  </nav>
		</div>

</body>
</html>