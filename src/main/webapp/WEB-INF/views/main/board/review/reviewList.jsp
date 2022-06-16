<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#reviewDetail-form fieldset{display: inline-block; border: 0;}
	 	
	.fa-star{font-size: 10px; color: #b3b3b3; text-shadow: 0 0 0 #b3b3b3;}
	.checked {color: #ffab00;}
	
 	.modal img{ 
		width: 100px; 
 		height:100px; 
 	} 
	
 	
/* 수정하기 모달 폼 */

/* 	#reviewUpdate-form .fa-star{font-size: 10px; color: #b3b3b3; text-shadow: 0 0 0 #b3b3b3;} */

 	#reviewUpdate-form fieldset{ 
 		display: inline-block;
/*     		direction: rtl; */
 		border: 0;
 	}
 	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
 	
 	#reviewUpdate-form label:hover{
 		color: #ffab00;
 	}
 	
 	#reviewUpdate-form label~label:hover i{
 		color: #ffab00;
 	}
 	
 	#reviewUpdate-form [type=radio]{ 
 		display: none;
 	}
 	
 	#reviewUpdate-form label~[type=radio]:checked i{ 
 		color: #ffab00;
 	}
 	
 	
</style>
<meta charset="UTF-8">
<title>메인페이지용 리뷰 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">

$(function(){
	
	$(".list-reviewContent").click(function(){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/review/read",
			type: "post",
			data:{"${_csrf.parameterName}": "${_csrf.token}",
				  "reviewId" : $(this).val()	
			},
			dataType:"json",
// 				alert(result.reviewImg.toString());
			success:function(result){
				let text = "";
				let rate = result.reviewRate;
				if(rate==1) {
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text +=	'<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
				}else if(rate==2){
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
				}else if(rate==3){
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
				}else if(rate==4){
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm"></i>';
				}else if(rate==5){
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
					text += '<i class="fa-solid fa-star fa-sm checked"></i>';
				}
				
				let str="";
				let image = `\${result.reviewImg}`;
								
				if(image!='null'){
					str += `<img class="reviewImg" src="${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}">`;
				}
								
				$(".imgDiv").html(str);
				
				$("#reviewDetail-form .reviewRate").html(text);
				
				$("#reviewDetail-form .reviewId").val(`\${result.reviewId}`); //span, div 같은 태그에는 .html 속성으로 부여.
				$("#reviewDetail-form .studentId").val(`\${result.studentId}`);
				$("#reviewDetail-form .reviewInsertDate").val(`\${result.reviewInsertDate.toString().substring(0, 10)}`);
				$("#reviewDetail-form .reviewUpdateDate").val(`\${result.reviewUpdateDate.toString().substring(0, 10)}`);
				$("#reviewDetail-form .className").val(`\${result.className}`);
				$("#reviewDetail-form .reviewContent").html(`\${result.reviewContent}`);
			},
			error: function(err){
				alert(err + "에러 발생. - 상세보기");
			}
		})
	})
	
	/*
	수정 폼 불러오기
	*/
	$("#updateBtn").click(function(){
		
		$.ajax({
			url: "${pageContext.request.contextPath}/review/updateForm",
			type: "post",
			data:{"${_csrf.parameterName}": "${_csrf.token}",
				  "reviewId" : $("#reviewDetail-form .reviewId").val()	
			},
			dataType:"json",
			success:function(result){
				$("#exampleModal").modal("hide");

				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();
				
// 				alert(result);
				$("#reviewUpdate-form .reviewId").val(`\${result.reviewId}`);
				$("#reviewUpdate-form .studentId").val(`\${result.studentId}`);
				$("#reviewUpdate-form .className").val(`\${result.className}`);
				$("#reviewUpdate-form .reviewContent").html(`\${result.reviewContent}`);

				//별점 불러오기
				let text = "";
				let rate = result.reviewRate;
				if(rate==1){
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate1" checked><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate2"><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3"><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate4"><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate5"><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label>';
				}else if(rate==2){
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate1"><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate2" checked><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3"><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate4"><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate5"><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label>';
				}else if(rate==3){
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate1"><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate2"><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3" checked><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate4"><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate5"><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label>';
				}else if(rate==4){
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate1"><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate2"><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3"><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate4" checked><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate5"><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label>';
				}else if(rate==5){
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate1"><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate2"><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3"><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate4"><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label>';
					text+= '<input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate5" checked><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label>';
				}
				$("#update-star").html(text);
				
				//이미지 불러오기
				let image = `\${result.reviewImg}`;
				if(image!='null'){
					$("#reviewUpdate-form .reviewImg").attr("src",`${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}`);
				}else {
					$("#reviewUpdate-form .reviewImg").attr("src","");
				}
				$("#updateModal").modal("show");
			},
			error:function(err){
				alert(err + "에러 발생 - 수정 폼 불러오기");
			}
		})
	})
	
	/*
	삭제하기
	*/
	$("#deleteBtn").click(function(){
		$("#deleteModal").modal("hide");
		$.ajax({
			url: "${pageContext.request.contextPath}/review/delete",
			type: "post",
			data: {"${_csrf.parameterName}": "${_csrf.token}",
				  "reviewId" : $("#reviewDetail-form .reviewId").html()	
			},
			success: function(){
				document.location.reload(true);
			},
			error:function(err){
				alert(err + "에러 발생 - 삭제하기");
			}
		})
	})
	
	/*
	정보 수정하기
	*/
	$("#updateOkBtn").click(function(){
		$("#reviewUpdate-form").ajaxForm({
			url: "${pageContext.request.contextPath}/review/update?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			enctype: "multipart/form-data",
			contentType: false,
			processData: false,
			success: function(){
				alert("수정 성공")
			},
			error:function(xhr, status, error){
				alert(eval("(" + xhr.responseText + ")").message);
			}
		}).submit();
	})
	
	/*
	복붙 파트(수정폼에 이미지 바꾼거 바로 띄우기)
	*/
// 	$(".mainFileBtn").click(function() {
// 			$("#input-image").click()
// 		})
		
// 		$("img").click(function() {
// 		    $(".mainImgCon").css("display", "none")
// 		    $("#preview-image").attr("src", "")
// 		    $(".mainFileBtn").css("display", "block")
// 		    $("#input-image").val("")
// 		})
		
// 		function readImage(input) {
// 		    // 인풋 태그에 파일이 있는 경우
// 		    if(input.files && input.files[0]) {
// 		        // FileReader 인스턴스 생성
// 		        var reader = new FileReader()
// 		        // 이미지가 로드가 된 경우
// 		        reader.onload = e => {
// 		        	var previewImage = document.getElementById("preview-image")
// 		            previewImage.src = e.target.result
// 		        }
// 		        // reader가 이미지 읽도록 하기
// 		        reader.readAsDataURL(input.files[0])
// 		    }
// 		}
// 		// input file에 change 이벤트 부여
// 		var inputImage = document.getElementById("input-image")
// 		inputImage.addEventListener("change", e => {
// 		    readImage(e.target)
// 		    $(".mainImgCon").css("display", "block")
// 		    $(".mainFileBtn").css("display", "none")
// 		})
	
})
</script>
<script type="text/javascript">

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
		            <td><span>${review.classes.className}</span></td>
		            <td>
		            	<c:choose>
		            		<c:when test="${review.reviewBlindState eq 'true'}">
		            			<a>이 후기는 비공개 상태입니다.</a>
		            		</c:when>
		            		<c:when test="${review.reviewBlindState eq 'false'}">
		            			<button id="list-reviewContent" class="list-reviewContent" data-bs-toggle="modal" data-bs-target="#exampleModal" value="${review.reviewId}">${review.reviewContent}</button>
		            		</c:when>
		            	</c:choose>
		            </td>
		            <td>
		            	<span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		            	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		            </td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		</table>
	
		
	<!---------------------상세보기 모달 ------------------------------->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">후기 상세보기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		      	<form id="reviewDetail-form">
			        <table id="table">
						<tr>
					    	<th>글번호</th>
					    	<td>
					    	  <div><input type="text" class="reviewId" readonly></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th>작성자</th>
					    	<td>
					    	  <div><input type="text" class="studentId" readonly></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th>클래스 이름</th>
					    	<td>
					    	  <div><input type="text" class="className" readonly></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th>작성 날짜</th>
					    	<td>
					    	  <div><input type="text" class="reviewInsertDate" readonly></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th>수정 날짜</th>
					    	<td>
					    	  <div><input type="text" class="reviewUpdateDate" readonly></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th>별점</th>
					    	<td>
					    	  <div class="reviewRate"></div>
					    	</td>
					  	</tr>
					  	<tr>
					    	<th rowspan="2">후기</th>
					    	<td>
					    	  <div class="imgDiv"></div>
					    	</td>
					    </tr>
					    <tr>
					    	<td>
					    	  <div><textarea class="reviewContent" readonly></textarea></div>
					    	</td>
					  	</tr>
					</table>
				</form>
		      </div> <!-- modal body 끝 -->
<!-- 		      <input type="text" class="reviewContent" readonly> -->
		      <div class="modal-footer">
		      <form id="detail-requestForm">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" class="updateBtn" id="updateBtn" value="${review.reviewId}" >수정하기</button>
		      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal" class="deleteBtn" value="${review.reviewId}" >삭제하기</button>
		      </form>
		      </div>
		    </div>
		  </div>
		</div>
	
	<!--------------------- 수정하기 모달-------------------->
	
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">후기 수정하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	        <form id="reviewUpdate-form" enctype="multipart/form-data" method="post">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<input type="hidden" class="reviewId" >
				<table>
			  		<tr>
				    	<th>글번호</th>
				    	<td>
				    	  <div><input name="reviewId" type="text" class="reviewId" readonly></div>
				    	</td>
				  	</tr>
				  	<tr>
				    	<th>작성자</th>
				    	<td>
				    	  <div><input name="reviewId" type="text" class="studentId" readonly></div>
				    	</td>
				  	</tr>
				  	<tr>
				    	<th>클래스 이름</th>
				    	<td>
				    	  <div><input name="className" type="text" class="className" readonly></div>
				    	</td>
				  	</tr>
				  	<tr>
				    	<th>별점</th>
				    	<td>
				    		<fieldset id="update-star">
<!-- 						        <input type="radio" name="reviewRate" class="reviewRate" value="5" id="rate1"><label for="rate1"><i class="fa-solid fa-star fa-sm"></i></label> -->
<!-- 						        <input type="radio" name="reviewRate" class="reviewRate" value="4" id="rate2"><label for="rate2"><i class="fa-solid fa-star fa-sm"></i></label> -->
<!-- 						        <input type="radio" name="reviewRate" class="reviewRate" value="3" id="rate3"><label for="rate3"><i class="fa-solid fa-star fa-sm"></i></label> -->
<!-- 						        <input type="radio" name="reviewRate" class="reviewRate" value="2" id="rate4"><label for="rate4"><i class="fa-solid fa-star fa-sm"></i></label> -->
<!-- 						        <input type="radio" name="reviewRate" class="reviewRate" value="1" id="rate5"><label for="rate5"><i class="fa-solid fa-star fa-sm"></i></label> -->
							</fieldset>
				    	</td>
				  	</tr>
				  	<tr>
				  		<th>첨부 이미지</th>
				  		<td>
					  		<input type="file" name="file" id="file" class="upload-box upload-plus file" accept="image/*">
					  		<img class="reviewImg" />
				  		</td>
				  	</tr>
				  	<tr>
				    	<th>후기</th>
				    	<td>
				    		<textarea name="reviewContent" class="reviewContent" id="reviewContent" placeholder="후기를 자유롭게 입력해주세요. 욕설 / 비방은 관리자에 의한 비공개 처리 및 처벌될 수 있습니다."></textarea>
				    	</td>
				  	</tr>

				</table>

	       
		</form> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" id="updateOkBtn">저장하기</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>

<!---------------------------------- 삭제 확인 모달 -------------------------------------->

	<div class="modal fade" id="deleteModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">후기 삭제</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       정말 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="deleteBtn">아작스로 삭제</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </form>
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
		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/review/list?nowPage=${startPage-1}">이전</a>	      		
		      		</c:if>
		      		
		      		<span class="pagination-inner">
		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
		      		    
		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
		      		      <c:set var="doneLoop" value="true"/>
		      		    </c:if>
		      		    <c:if test="${not doneLoop}">
		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/review/list?nowPage=${i}">${i}</a>
		      		    </c:if>
		      		    
		      		  </c:forEach>
		      		</span>
		      		
		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/review/list?nowPage=${startPage+blockCount}">다음</a>
		      		</c:if>
		    </div>
		  
		  </nav>
		</div>
	

</body>
</html>