<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 후기 상세보기입니다.</title>
<style type="text/css">
	fieldset input[type=radio]{display: none;}
	fieldset input[type=radio]:checked~label{text-shadow: 0 0 0 #EB5353;}
	fieldset{display: inline-block; direction: rtl; border: 0;}
	
	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
/* 	.star:hover{text-shadow: 0 0 0 #EB5353;} */
/* 	.star:hover~label{text-shadow: 0 0 0 #EB5353;} */
	
	textarea{width:100%; height:6.25em; resize:none;}
</style>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	alert($("#reviewId").val());
	
	
	$("#deleteBtn").on("click",function(){
		var result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			$.ajax({
				url:"/main/board/review/delete",
				data:{reviewId : $("#reviewId").val(),
					  "${_csrf.parameterName}" : "${_csrf.token}"
				},
				type:"post",
				success: function(){
					 alert("삭제되었습니다.")
				},
				error: function(err){
					alert(err + "에러 발생")
				}
			})
		}else{
			
		}
	})
	
	$("#updateBtn").on("click",function(){
		$("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/review/updateForm");
		$("#requestForm").submit();
	})
	
// 	$("#updateBtn").on("click",function(){
// 		alert(${review.reviewId} + "번 게시물 수정 페이지로 이동합니다.")
		
// 		$.ajax({
// 			url:"/main/board/review/updateForm",
// 			data:{reviewId : $("#reviewId").val(),
// 				"${_csrf.parameterName}" : "${_csrf.token}"	
// 			},
// 			type:"post",
// 			success: function(){
// 				alert("수정페이지로 이동하는 데 성공하였습니다.")
// 			},
// 			error: function(err){
// 				alert(err + "에러 발생")
// 			}
// 		})
// 	})
})
</script>
</head>
<body>

<div class="main-content">
메인페이지용 클래스 후기 상세보기입니다
      
	        <table>
				<tr>
			    	<th>글번호</th>
			    	<td>${review.reviewId}</td>
			  	</tr>
			  	<tr>
			    	<th>작성자</th>
			    	<td>${review.student.studentId}</td>
			  	</tr>
			  	<tr>
			    	<th>별점</th>
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
			  	</tr>
			  	<tr>
			    	<th>작성 날짜</th>
			    	<td>
			    		<fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="insertDate"/>
			    		<fmt:formatDate value="${insertDate}" pattern="yyyy-mm-dd"/>
			    	</td>
			  	</tr>
			  	<tr>
			    	<th>수정 날짜</th>
			    	<td>
			    		<fmt:parseDate value="${review.reviewUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/>
			    		<fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/>
			    	</td>
			  	</tr>
			  	<tr>
				     <td colspan="2" style="text-align: center;">
						<img alt="" src="${pageContext.request.contextPath}/img/classReview/${requestScope.review.reviewImg}">
			<%-- 			<span style="font-size:9pt;"><b><pre>${requestScope.review.reviewContent}</pre></b></span> --%>
				     </td>
				</tr>
			  	<tr>
			    	<th>내용</th>
			    	<td>${review.reviewContent}</td>
			  	</tr>
			
			
			</table>
			<form id="requestForm">
			  	  <input type="hidden" id=reviewId name=reviewId value="${review.reviewId }">
				  	<input type="button" id="cancelBtn" value="취소" onclick="location.href='${pageContext.request.contextPath}/main/board/review/list'">
				</form>




<!--   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 	<div class="modal-dialog modal-dialog-centered"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<h5 class="modal-title" id="exampleModalLabel">클래스 후기</h5> -->
<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body"> -->
<!-- 				<form id="reviewForm" enctype="multipart/form-data" method="post" action=""> -->
<%-- 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
<!-- 				<input type="hidden" name="classId" value="1"> -->
					
<%-- 					<c:if test="${review.reviewImg != null}"> --%>
<%-- 					  <c:forEach items = "${review.reviewImg}" var="reviewImg" }> --%>
<%-- 					    <img alt="" src="${pageContext.request.contextPath}/img/classReview/${reviewImg}"> --%>
<%-- 					  </c:forEach> --%>
<%-- 					</c:if> --%>
<!-- 					<div class="mb-3"> -->
<%-- 						${review.student.studentId} --%>
<%-- 						 <input type="radio" name="reviewRate" value="${review.reviewRate}" id="rate" checked onclick="return(false)"><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label> --%>
<%-- 						${review.reviewContent} --%>
<%--                         ${review.reviewImg} --%>
<!--                     </div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<input type="button" class="btn btn-primary" id="updateReview" value="수정하기"> -->
<!-- 						<input type="button" class="btn btn-primary" id="deleteReview" value="삭제하기"> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!--   </div> -->



</div>
</body>
</html>