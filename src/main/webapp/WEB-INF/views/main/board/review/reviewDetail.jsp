<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	.star:hover{text-shadow: 0 0 0 #EB5353;}
	.star:hover~label{text-shadow: 0 0 0 #EB5353;}
	
	textarea{width:100%; height:6.25em; resize:none;}
</style>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	$("#updateReview").click(function(){
		$("#reviewForm").attr("action","${pageContext.request.contextPath}/main/board/review/updateForm" )
		$("#reviewForm").submit();
	})
	
	$("#deleteReview").click(function(){
		$("#reviewForm").attr("action","${pageContext.request.contextPath}/main/board/review/delete" )
		$("#reviewForm").submit();
	})
})
</script>
</head>
<body>
클래스 후기 상세보기입니다
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">클래스 후기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="reviewForm" enctype="multipart/form-data" method="post" action="">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="classId" value="1">
					
<%-- 					<c:if test="${review.reviewImg != null}"> --%>
<%-- 					  <c:forEach items = "${review.reviewImg}" var="reviewImg" }> --%>
<%-- 					    <img alt="" src="${pageContext.request.contextPath}/img/classReview/${reviewImg}"> --%>
<%-- 					  </c:forEach> --%>
<%-- 					</c:if> --%>
					<div class="mb-3">
						${review.student.studentId}
						 <input type="radio" name="reviewRate" value="${review.reviewRate}" id="rate" checked onclick="return(false)"><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
						${review.reviewContent}
                        ${review.reviewImg}
                    </div>
					<div class="modal-footer">
						<input type="button" class="btn btn-primary" id="updateReview" value="수정하기">
						<input type="button" class="btn btn-primary" id="deleteReview" value="삭제하기">
					</div>
				</form>
			</div>
		</div>
	</div>
  </div>


</body>
</html>