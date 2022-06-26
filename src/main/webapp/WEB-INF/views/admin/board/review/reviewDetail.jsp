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

	fieldset{display: inline-block; border: 0;}
	
	.fa-star{font-size: 10px; color: #b3b3b3; text-shadow: 0 0 0 #b3b3b3;}	
	.checked {color: #EB5353;}

	
	textarea{width:100%; height:6.25em; resize:none;}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
// 	swal($("#reviewId").val());

	/*
	블라인드 처리
	*/
	$("button").click(function(){
			var target =$(this).attr("name")
			
			$.ajax({
	        url: "${pageContext.request.contextPath}/main/board/review/blind" , //서버요청주소
	        type: "post" , //요청방식 (get,post...)
	        data: {"${_csrf.parameterName}": "${_csrf.token}", reviewId: target, reviewBlindState: 'true'} , //서버에게 보낼 데이터정보(parameter정보)
	        
	        success: function(result){
	            swal("블라인드 처리되었습니다.")
	            location.reload()
	        },
	
	        error: function(err){//실패했을 때 콜백함수
	            swal(err+"오류가 발생했습니다.")
	        } 
	
	        })
		})
	
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
					 swal("삭제되었습니다.")
				},
				error: function(err){
					swal(err + "에러 발생")
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
// 		swal(${review.reviewId} + "번 게시물 수정 페이지로 이동합니다.")
		
// 		$.ajax({
// 			url:"/main/board/review/updateForm",
// 			data:{reviewId : $("#reviewId").val(),
// 				"${_csrf.parameterName}" : "${_csrf.token}"	
// 			},
// 			type:"post",
// 			success: function(){
// 				swal("수정페이지로 이동하는 데 성공하였습니다.")
// 			},
// 			error: function(err){
// 				swal(err + "에러 발생")
// 			}
// 		})
// 	})
})
</script>
</head>
<body>
관리자용 클래스 후기 상세보기
      
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
			<%-- 		<span style="font-size:9pt;"><b><pre>${requestScope.review.reviewContent}</pre></b></span> --%>
				     </td>
				</tr>
				
			  	<tr>
			    	<th>내용</th>
			    	<td>${review.reviewContent}</td>
			  	</tr>
			
			</table>
			<form id="requestForm">
			  	  <input type="hidden" id=reviewId name=reviewId value="${review.reviewId }">
<%-- 			  	  <td><span>${review.reviewBlindState}</span></td> --%>
		            <td>
                   	  <c:choose>
                         <c:when test="${review.reviewBlindState eq 'false'}">
                             <button type="button" class="btn btn-danger" name="${review.reviewId}" value="false">게시글 숨기기</button>
                         </c:when>
                         <c:when test="${review.reviewBlindState eq 'true'}">
                             <button type="button" class="btn btn-secondary" name="${review.reviewId}" value="true">블라인드 처리됨</button>
                         </c:when>
                      </c:choose>
	                </td>
				  	<input type="button" id="cancelBtn" onclick="location.href='${pageContext.request.contextPath}/admin/board/review/list'" value="취소">
				</form>


</body>
</html>