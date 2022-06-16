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
	
 	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}

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
			url:"${pageContext.request.contextPath}/admin/board/review/read",
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
				
				let image = `\${result.reviewImg}`;
				
				if(image!='null'){
					$("#reviewDetail-form .reviewImg").attr("src",`${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}`);
				} else {
					$("#reviewDetail-form .reviewImg").attr("src","");
				}
				
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
	블라인드 처리
	*/
	$("blindBtn").click(function(){
			var target =$(this).attr("name")
			
			$.ajax({
	        url: "${pageContext.request.contextPath}/main/board/review/blind" , //서버요청주소
	        type: "post" , //요청방식 (get,post...)
	        data: {"${_csrf.parameterName}": "${_csrf.token}", reviewId: target, reviewBlindState: 'true'} , //서버에게 보낼 데이터정보(parameter정보)
	        
	        success: function(result){
	            alert("블라인드 처리되었습니다.")
	            location.reload()
	        },
	
	        error: function(err){//실패했을 때 콜백함수
	            alert(err+"오류가 발생했습니다.")
	        } 
	
	        })
	})
})
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
		            			<button id="list-reviewContent" class="list-reviewContent" data-bs-toggle="modal" data-bs-target="#detailModal" value="${review.reviewId}">${review.reviewContent}</button>
		            		</c:when>
		            	</c:choose>
		            </td>
		            <td>
		            	<span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		            	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		            </td>
		           	<td>
		            	<c:choose>
		            		<c:when test="${review.reviewBlindState eq 'true'}">
		            			<b>T</b>
		            		</c:when>
		            		<c:when test="${review.reviewBlindState eq 'false'}">
		            			<b>F</b>
		            		</c:when>
		            	</c:choose>
		            </td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		</table>
	
		
	<!---------------------상세보기 모달 ------------------------------->
		<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
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
					    	  <div><img class="reviewImg" alt=""></div>
					    	</td>
					    </tr>
					    <tr>
					    	<td>
					    	  <div><textarea class="reviewContent" readonly></textarea></div>
					    	</td>
					  	</tr>
					</table>
				</form>
		      </div>

		      <div class="modal-footer">
		      	<form id="requestForm">
		  	    <input type="hidden" id=reviewId name=reviewId value="${review.reviewId }">
		            <td>
                   	  <c:choose>
                         <c:when test="${review.reviewBlindState eq 'false'}">
                             <button type="blindBtn" class="btn btn-danger" name="${review.reviewId}" value="false">게시글 숨기기</button>
                         </c:when>
                         <c:when test="${review.reviewBlindState eq 'true'}">
                             <input type="text" class="blinded" value="블라인드 처리됨" readonly>
                         </c:when>
                      </c:choose>
	                </td>
			  	<input type="button" id="cancelBtn" onclick="location.href='${pageContext.request.contextPath}/admin/board/review/list'" value="취소">
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	

<!---------------------------------- 블라인드 확인 모달 -------------------------------------->

	<div class="modal fade" id="deleteModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">후기 블라인드 처리</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       블라인드 처리하시겠습니까?
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
		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/review/list?nowPage=${startPage-1}">이전</a>	      		
		      		</c:if>
		      		
		      		<span class="pagination-inner">
		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
		      		    
		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
		      		      <c:set var="doneLoop" value="true"/>
		      		    </c:if>
		      		    <c:if test="${not doneLoop}">
		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/review/list?nowPage=${i}">${i}</a>
		      		    </c:if>
		      		    
		      		  </c:forEach>
		      		</span>
		      		
		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/admin/review/list?nowPage=${startPage+blockCount}">다음</a>
		      		</c:if>
		    </div>
		  
		  </nav>
		</div>
	

</body>
</html>