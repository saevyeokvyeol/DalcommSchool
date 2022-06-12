<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 마이페이지용 리뷰 리스트</title>

<style type="text/css">
fieldset{display: inline-block; border: 0;}

.fa-star{font-size: 2em; color: #b3b3b3; text-shadow: 0 0 0 #b3b3b3;}	
.checked {color: #EB5353;}
/* .star:hover{text-shadow: 0 0 0 #EB5353;}  */
/* .star:hover~label{text-shadow: 0 0 0 #EB5353;}  */
	
textarea{width:100%; height:6.25em; resize:none;} 

table{margin: auto; width: 1200px;}

</style>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">


$(function(){
	/*
	리뷰 상세보기
	*/
	
	$(".readReview").click(function(){
		alert("click");
		alert($(.readReview).val());
		$.ajax({
			url:"/main/board/review/read",
			type:"post",
			dataType: "json",
			data:{
				reviewId : "$(.readReview).val()",				
				"${_csrf.parameterName}":"${_csrf.token}"
				},
			success: function(result){
				alert(result.reviewId);
				alert(result.reviewRate);
				alert(result.reviewContent);
				$(".reviewDetailForm .reviewId").val(`\${result.reviewId}`);
				$(".reviewDetailForm .reviewRate").val(`\${result.reviewRate}`);
				$(".reviewDetailForm .reviewContent").val(`\${result.reviewContent}`);
			},
			error: function(err){
				alert("후기 정보를 가져올 수 없습니다.")
// 				alert(err);
			}
		})
	})
	
	/*
	리뷰 수정하기
	*/
	
	/*
	리뷰 삭제하기
	*/
		
	
})
</script>
</head>
<body>
<h2>강사 마이페이지 클래스 후기 리스트!</h2>
	 <table>
	  <thead>
	    <tr>
	      <th>글 번호</th>
		  <th>클래스 이름</th>
		  <th>아이디</th>
	      <th>내용</th>
	      <th>별점</th>
	      <th>작성 날짜</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:choose>
	      <c:when test="${empty requestScope.classReviews.content}" >
	        <tr>
	          <th>
	            <span>등록된 후기가 없습니다.</span>
	          </th>
	        </tr>
	      </c:when>
	      <c:otherwise>
	        <c:forEach items="${classReviews.content}" var="review">
	          <div id="review">
	          <tr>
	          	<td><span>${review.reviewId}</span></td>
	            <td><span>${review.classes.className}</span></td>
	            <td><span>${review.student.studentId}</span></td>
				<td><a data-bs-toggle="modal" data-bs-target="#readModal" class="readReview" value="${review.reviewId}  id="readReview">${review.reviewContent}</a></td>
	            <td>
			    	<fieldset>
					  <c:choose>
					  	<c:when test="${review.reviewRate==1}">
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					  		<i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					  	</c:when>
					  	<c:when test="${review.reviewRate==2}">
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					  	</c:when>
					  	<c:when test="${review.reviewRate==3}">
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					  	</c:when>
					  	<c:when test="${review.reviewRate==4}">
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm"></i>
					  	</c:when>
					  	<c:when test="${review.reviewRate==5}">
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					  		<i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					        <i class="fa-solid fa-star fa-sm checked"></i>
					  	</c:when>
					  </c:choose>
					</fieldset>
				</td>
<%-- 	            <input type="hidden" id="reviewId" class="reviewId" name="reviewId" value="${review.reviewId}"> --%>
	            <td><span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span></td>
	            <td><span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span></td>
	          </tr>
			  </div>
	        </c:forEach>
	      </c:otherwise>
	    </c:choose>
</tbody>
</table>
<%-- <jsp:include page="../../main/board/review/reviewDetail.jsp"/> --%>


	<!-- 리뷰 상세보기 모달 -->
	<div class="modal fade" id="readModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered"">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">후기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	        <form id="reviewDetailForm" class="reviewDetailForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/main/board/review/updateForm?${_csrf.parameterName}=${_csrf.token}">
	<!-- 			<input type="hidden" name="classId" value="1"> -->
				<div class="mb-3">
	                <label for="formFileMultiple" class="form-label">글 번호</label>
	                <div class="reviewId">${review.reviewId}</div>
	            </div>
	            <div class="mb-3">
	                <label for="formFileMultiple" class="form-label">별점</label>
	                <div class="reviewRate">${review.reviewRate}</div>
	            </div>
	<!-- 			<fieldset> -->
	<!-- 			  <label for="recipient-name" class="col-form-label">별점</label> -->
	<!-- 		        <input type="radio" name="reviewRate" value="5" id="rate1"><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label> -->
	<!-- 		        <input type="radio" name="reviewRate" value="4" id="rate2"><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label> -->
	<!-- 		        <input type="radio" name="reviewRate" value="3" id="rate3"><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label> -->
	<!-- 		        <input type="radio" name="reviewRate" value="2" id="rate4"><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label> -->
	<!-- 		        <input type="radio" name="reviewRate" value="1" id="rate5"><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label> -->
	<!-- 			</fieldset> -->
				<div class="mb-3">
	                <label for="formFileMultiple" class="form-label">이미지 첨부</label>
	                <input class="form-control" value="${review.reviewImg}" type="file" id="formFileMultiple" name="file" accept="image/*" multiple>
	            </div>
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">내용</label>
					<textarea name="reviewContent" placeholder="후기를 자유롭게 입력해주세요." class="reviewContent">${review.reviewContent}</textarea>
				</div>
				<div class="modal-footer">
<!-- 					<input type="submit" class="btn btn-primary" id="insertReview" value="후기 등록"> -->
				</div>
			</form>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 페이징 처리 -->
	<div>
	  <nav class="pagination-container">
	    <div class="pagination">
	      <c:set var="doneLoop" value="false"/>
	      		<c:if test="${(startPage-blockCount)>0 }">
	      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/review/teacher?nowPage=${startPage-1}">이전</a>	      		
	      		</c:if>
	      		
	      		<span class="pagination-inner">
	      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
	      		    
	      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
	      		      <c:set var="doneLoop" value="true"/>
	      		    </c:if>
	      		    <c:if test="${not doneLoop}">
	      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/review/teacher?nowPage=${i}">${i}</a>
	      		    </c:if>
	      		    
	      		  </c:forEach>
	      		</span>
	      		
	      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
	      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/review/teacher?nowPage=${startPage+blockCount}">다음</a>
	      		</c:if>
	    </div>
	  
	  </nav>
	</div>






</body>



<!-- 리뷰 수정하기 모달 -->

<!-- 리뷰 삭제 확인창 모달 -->
</html>