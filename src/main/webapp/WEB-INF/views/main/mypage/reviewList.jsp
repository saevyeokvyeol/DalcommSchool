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
		width: 100%; 
 		height:100%; 
 	} 
	
 	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}

</style>
<meta charset="UTF-8">
<title>학생 마이페이지용 리뷰 리스트</title>
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
			success:function(result){
				let text = "";
				let rate = result.reviewRate;
				for(var i = 1; i <= rate; i++){
					text += `<i class="fa-solid fa-star text-warning"></i>`
				}
				for(var i = 5; i > rate; i--){
					text += `<i class="fa-solid fa-star text-black text-opacity-25"></i>`
				}
				
				let str="";
				let image = `\${result.reviewImg}`;
								
				if(image!='null'){
					str += `<img class="reviewImg" src="${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}">`;
				}
								
				$(".imgDiv").html(str);
				$("#reviewDetail-form .reviewRate").html(text);
				
				
				$("#reviewDetail-form .reviewId").val(`\${result.reviewId}`); //span, div 같은 태그에는 .html 속성으로 부여.
				$("#reviewDetail-form .reviewInsertDate").html(`\${result.reviewInsertDate.toString().substring(0, 10)}`);
				$("#reviewDetail-form .className").html(`\${result.className}`);
				$("#reviewDetail-form .reviewContent").html(`\${result.reviewContent}`);
			},
			error: function(err){
				alert(err + "에러 발생. - 상세보기");
			}
		})
	})

})
</script>	

</head>
<h3>내가 쓴 후기</h3>
<body>
<div id="allBookList">
	<table class="table reviewTable">
		  <thead>
		    <tr>
		    	<th>클래스 이름</th>
		    	<th>별점</th>
			    <th>내용</th>
			    <th>작성 날짜</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:choose>
		      <c:when test="${empty requestScope.list.content}">
		        <tr>
		          <th colspan="7">
		            <span>등록된 후기가 없습니다.</span>
		          </th>
		        </tr>
		      </c:when>
		      <c:otherwise>
		        <c:forEach items="${list.content}" var="review">
		          <div id="review">
		          <tr>
		          	<td><span>${review.classes.className}</span></td>
		          	<td>
			    		<c:forEach begin="1" end="${review.reviewRate}" var="i">
			    			<i class="fa-solid fa-star text-warning"></i>
			    		</c:forEach>
			    		<c:forEach begin="${review.reviewRate}" end="4" var="j">
			    			<i class="fa-solid fa-star text-black text-opacity-25"></i>
			    		</c:forEach>
					</td>
		            <td>
		            	<c:choose>
		            		<c:when test="${review.reviewBlindState eq 'T'}">
		            			<a>이 후기는 비공개 상태입니다.</a>
		            		</c:when>
		            		<c:when test="${review.reviewBlindState eq 'F'}">
		            			<button class="btn btn-light list-reviewContent" data-bs-toggle="modal" data-bs-target="#detailModal" value="${review.reviewId}">${review.reviewContent.length() >= 30 ? review.reviewContent.substring(0, 30).concat("...") : review.reviewContent}</button>
		            			<c:if test="${review.reviewImg != null}">
									<i class="fa fa-file-image-o" aria-hidden="true"></i>
								</c:if>
		            		</c:when>
		            	</c:choose>
		            </td>
		            <td>
		            	${review.reviewInsertDate.toString().substring(0, 10)}
		            </td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
	</table>
</div>
		
	<!---------------------상세보기 모달 ------------------------------->
		<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">후기 상세보기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		      	<form id="reviewDetail-form">
			        <table id="table" class="table table-borderless">
					  	<tr>
					    	<td class="className"></td>
					  	</tr>
					  	<tr>
					    	<td class="reviewRate"></td>
					    	<td class="reviewInsertDate"></td>
					  	</tr>
					  	<tr>
					    	<td colspan="3">
					    	  <div class="imgDiv"></div>
					    	</td>
					    </tr>
					    <tr>
					    	<td colspan="3" class="reviewContent"></td>
					  	</tr>
					</table>
				</form>
				
		      </div>
			</form>
		      </div>
		    </div>
		  </div>

	<!-- 페이징 처리 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:set var="doneLoop" value="false" />
			<c:if test="${(startPage-blockCount) > 0 and list.content.size() != 0}">
				<li class="page-item">
					<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
				</li>
			</c:if>
				<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
					<c:if test="${(i-1)>=list.getTotalPages()}">
						<c:set var="doneLoop" value="true" />
					</c:if>
					<c:if test="${not doneLoop}">
						<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
			<c:if test="${(startPage+blockCount) <= list.getTotalPages()}">
				<li class="page-item">
					<a class="page-link" href="${URL}?${location.search}page=${startPage+blockCount}">다음</a>
				</li>
			</c:if>
		</ul>
	</nav>
	

</body>
</html>