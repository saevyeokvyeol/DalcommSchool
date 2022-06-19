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
	 	
	.checked {color: #ffab00;}
</style>
<meta charset="UTF-8">
<title>관리자용 리뷰 리스트</title>
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
					str += `<img class="modalReviewImage" src="${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}">`;
				}
								
				$(".imgDiv").html(str);
				$("#reviewDetail-form .reviewRate").html(text);
				
				$("#reviewId").val(`\${result.reviewId}`); //span, div 같은 태그에는 .html 속성으로 부여.
				$("#reviewDetail-form .studentId").html(`\${result.studentId}`);
				$("#reviewDetail-form .reviewInsertDate").html(`\${result.reviewInsertDate.toString().substring(0, 10)}`);
				$("#reviewDetail-form .className").html(`\${result.className}`);
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
	$("#blindBtn").click(function(){
		$("#blindModal").modal("hide");
		
		var target = $("#reviewId").val()
		
		$.ajax({
        url: "${pageContext.request.contextPath}/review/blind" , //서버요청주소
        type: "post" , //요청방식 (get,post...)
        data: {"${_csrf.parameterName}": "${_csrf.token}",
        	reviewId: target,
        	reviewBlindState: 'T'
        } , //서버에게 보낼 데이터정보(parameter정보)
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
	<div id="allBookList">
		<table class="table reviewTable">
			  <thead>
			    <tr>
			      <th>클래스 이름</th>
			      <th>별점</th>
			      <th>내용</th>
			      <th>아이디</th>
			      <th>작성 날짜</th>
			      <th>블라인드</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:choose>
			      <c:when test="${requestScope.list.content==null}">
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
	            			<button class="btn btn-light list-reviewContent" data-bs-toggle="modal" data-bs-target="#detailModal" value="${review.reviewId}">${review.reviewContent.length() >= 30 ? review.reviewContent.substring(0, 30).concat("...") : review.reviewContent}</button>
	            			<c:if test="${review.reviewImg != null}">
								<i class="fa-solid fa-image"></i>
							</c:if>
			            </td>
			            <td><span>${review.student.studentId}</span></td>
			            <td>
			            	${review.reviewInsertDate.toString().substring(0, 10)}
			            </td>
			            <td>
			            	<c:if test="${review.reviewBlindState == 'T'}">
			            		<span class="badge bg-danger">블라인드</span>
			            	</c:if>
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
			        <table class="table table-borderless">
					  	<tr>
					    	<td class="className">
					    	</td>
					  	</tr>
					  	<tr>
					    	<td class="reviewRate">
					    	</td>
					    	<td class="studentId">
					    	</td>
					    	<td class="reviewInsertDate">
					    	</td>
					  	</tr>
					  	<tr>
					    	<td colspan="3">
					    	  <div class="imgDiv"></div>
					    	</td>
					    </tr>
					    <tr>
					    	<td colspan="3" class="reviewContent">
					    	</td>
					  	</tr>
					</table>
				</form>
				
		      </div>

		      <div class="modal-footer">
		      	<form id="requestForm">
		  	    <input type="hidden" id="reviewId" name="reviewId" value="${review.reviewId}">
		            <td>
		            	<div class="blindBtnDiv">
                             <button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#blindModal" name="${review.reviewId}" value="false">게시글 숨기기</button>
                             <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">닫기</button>
                      	</div>
	                </td>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	

<!---------------------------------- 블라인드 확인 모달 -------------------------------------->

	<div class="modal fade" id="blindModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">후기 블라인드 처리</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       블라인드 처리하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="blindBtn">예</button>
		        <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">아니오</button>
		      </form>
		      </div>
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