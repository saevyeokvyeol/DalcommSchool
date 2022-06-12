<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지용 리뷰 리스트</title>
<style type="text/css">
	fieldset input[type=radio]{display: none;}
	fieldset input[type=radio]:checked~label{text-shadow: 0 0 0 #EB5353;}
	fieldset{display: inline-block; direction: rtl; border: 0;}
	
	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
//   $(function(){
	  
// 	  $("button").click(function(){
// 			var target =$(this).attr("name")
			
// 			$.ajax({
// 	        url: "${pageContext.request.contextPath}/main/board/review/blind" , //서버요청주소
// 	        type: "post" , //요청방식 (get,post...)
// 	        data: {"${_csrf.parameterName}": "${_csrf.token}", reviewId: target, reviewBlindState: 'true'} , //서버에게 보낼 데이터정보(parameter정보)
	        
// 	        success: function(result){
// 	            alert("블라인드 처리되었습니다.")
// 	            location.reload()
// 	        },
	
// 	        error: function(err){//실패했을 때 콜백함수
// 	            alert(err+"오류가 발생했습니다.")
// 	        } 
	
// 	        })
// 		})
//   })
</script>
</head>
<body>
	
	<table>
		  <thead>
		    <tr>
		      <th>아이디</th>
		      <th>별점</th>
		      <th>클래스 이름</th>
		      <th>내용</th>
		      <th>작성 날짜</th>
		      <th>블라인드 유무</th>
<!-- 		      <th>블라인드 처리</th> -->
		    </tr>
		  </thead>
		  <tbody>
		    <c:choose>
		      <c:when test="${requestScope.classReviews.content==null}">
		        <tr>
		          <th colspan="7">
		            <span>등록된 후기가 없습니다.</span>
		          </th>
		        </tr>
		      </c:when>
		      <c:otherwise>
		        <c:forEach items="${classReviews.content}" var="review">
		          <div id="review">
		          <tr>
		            <td><span>${review.student.studentId}</span></td>
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
		            <td><span>${review.classes.className}</span></td>
		            <td><a href="${pageContext.request.contextPath}/admin/board/review/read/${review.reviewId}">${review.reviewContent}</a></td>
		            <td>
		            	<span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		            	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		            </td>
		            <td><span>${review.reviewBlindState}</span></td>
<!-- 		            <td> -->
<%--                    	  <c:choose> --%>
<%--                          <c:when test="${review.reviewBlindState eq 'false'}"> --%>
<%--                              <input type="text" class="btn btn-danger" name="${review.reviewId}" readonly="readonly" value="false"> --%>
<%--                          </c:when> --%>
<%--                          <c:when test="${review.reviewBlindState eq 'true'}"> --%>
<%--                              <input type="text" class="btn btn-secondary" name="${review.reviewId}" readonly="readonly" value="true"> --%>
<%--                          </c:when> --%>
<%--                       </c:choose> --%>
<!-- 	                </td> -->
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		</table>
		
		<!-- 페이징 처리 -->
		<div>
		  <nav class="pagination-container">
		    <div class="pagination">
		      <c:set var="doneLoop" value="false"/>
		      		<c:if test="${(startPage-blockCount)>0 }">
		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/board/review/list?nowPage=${startPage-1}">이전</a>	      		
		      		</c:if>
		      		
		      		<span class="pagination-inner">
		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
		      		    
		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
		      		      <c:set var="doneLoop" value="true"/>
		      		    </c:if>
		      		    <c:if test="${not doneLoop}">
		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/board/review/list?nowPage=${i}">${i}</a>
		      		    </c:if>
		      		    
		      		  </c:forEach>
		      		</span>
		      		
		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/admin/board/review/list?nowPage=${startPage+blockCount}">다음</a>
		      		</c:if>
		    </div>
		  
		  </nav>
		</div>
	

</body>
</html>