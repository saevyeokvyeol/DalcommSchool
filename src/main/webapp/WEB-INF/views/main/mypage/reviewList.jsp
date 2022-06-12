<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 마이페이지용 후기 리스트</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<style type="text/css">
	fieldset input[type=radio]{display: none;}
	fieldset input[type=radio]:checked~label{text-shadow: 0 0 0 #EB5353;}
	fieldset{display: inline-block; direction: rtl; border: 0;}
	
	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
/* 	.star:hover{text-shadow: 0 0 0 #EB5353;} */
/* 	.star:hover~label{text-shadow: 0 0 0 #EB5353;} */
	
	textarea{width:100%; height:6.25em; resize:none;}
</style>


<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
<h2>내가 쓴 후기</h2>
	 <table>
	  <thead>
	    <tr>
<!-- 	      <th>아이디</th> -->
		  <th>클래스 이름</th>
	      <th>별점</th>
	      <th>내용</th>
	      <th>작성 날짜</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:choose>
	      <c:when test="${empty requestScope.classReviews.content}">
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
<%-- 	            <td><span>${review.student.studentId}</span></td> --%>
				<td><span>${review.classes.className}</span>
	            <td>
			    	<fieldset>
					  <c:choose>
					  	<c:when test="${review.reviewRate==1}">
					  		<input type="radio" name="reviewRate" value="5" id="rate1" disabled><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  		<input type="radio" name="reviewRate" value="4" id="rate2" disabled><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="3" id="rate3" disabled><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="2" id="rate4" disabled><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="1" id="rate5" disabled checked><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  	</c:when>
					  	<c:when test="${review.reviewRate==2}">
					  		<input type="radio" name="reviewRate" value="5" id="rate1" disabled><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  		<input type="radio" name="reviewRate" value="4" id="rate2" disabled><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="3" id="rate3" disabled><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="2" id="rate4" disabled checked><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="1" id="rate5" disabled><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  	</c:when>
					  	<c:when test="${review.reviewRate==3}">
					  		<input type="radio" name="reviewRate" value="5" id="rate1" disabled><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  		<input type="radio" name="reviewRate" value="4" id="rate2" disabled><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="3" id="rate3" disabled checked><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="2" id="rate4" disabled><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="1" id="rate5" disabled><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  	</c:when>
					  	<c:when test="${review.reviewRate==4}">
					  		<input type="radio" name="reviewRate" value="5" id="rate1" disabled><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  		<input type="radio" name="reviewRate" value="4" id="rate2" disabled checked><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="3" id="rate3" disabled><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="2" id="rate4" disabled><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="1" id="rate5" disabled><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  	</c:when>
					  	<c:when test="${review.reviewRate==5}">
					  		<input type="radio" name="reviewRate" value="5" id="rate1" disabled checked><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  		<input type="radio" name="reviewRate" value="4" id="rate2" disabled><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="3" id="rate3" disabled><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="2" id="rate4" disabled><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					        <input type="radio" name="reviewRate" value="1" id="rate5" disabled><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					  	</c:when>
					  </c:choose>
					</fieldset>
				</td>
	            <td>
	            	<c:choose>
	            		<c:when test="${review.reviewBlindState eq 'true'}">
	            			<a>이 후기는 비공개 상태입니다.</a>
	            		</c:when>
	            		<c:when test="${review.reviewBlindState eq 'false'}">
	            			<a href="${pageContext.request.contextPath}/main/mypage/review/read/${review.reviewId}" id="readReview" >${review.reviewContent}</a>
	            		</c:when>
	            	</c:choose>
	            </td>
<%-- 	            <td><a href="${pageContext.request.contextPath}/main/mypage/review/read/${review.reviewId}" id="readReview" >${review.reviewContent}</a></td> --%>
	            <input type="hidden" name="reviewId" value="${reviewId}">
	            <td><span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span></td>
	            <td><span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span></td>
	          </tr>
			  </div>
	        </c:forEach>
	      </c:otherwise>
	    </c:choose>
	  </tbody>
	  <tfoot>
		<input type="button" value="후기 남기기" onclick="location.href='${pageContext.request.contextPath}/main/mypage/review/writeForm'">
	  </tfoot>
	</table>
	
	<!-- 페이징 처리 -->
	<div>
	  <nav class="pagination-container">
	    <div class="pagination">
	      <c:set var="doneLoop" value="false"/>
	      		<c:if test="${(startPage-blockCount)>0 }">
	      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/mypage/reviewList?nowPage=${startPage-1}">이전</a>	      		
	      		</c:if>
	      		
	      		<span class="pagination-inner">
	      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
	      		    
	      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
	      		      <c:set var="doneLoop" value="true"/>
	      		    </c:if>
	      		    <c:if test="${not doneLoop}">
	      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/mypage/reviewList?nowPage=${i}">${i}</a>
	      		    </c:if>
	      		    
	      		  </c:forEach>
	      		</span>
	      		
	      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
	      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/mypage/reviewList?nowPage=${startPage+blockCount}">다음</a>
	      		</c:if>
	    </div>
	  
	  </nav>
	</div>
	
</body>
</html>