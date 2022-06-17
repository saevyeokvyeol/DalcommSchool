<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


	#span{
	    width: 100%;
	}

	#answerArea{
	    margin-bottom: 10px; 
	    height: 150px;
	    width: 500px;
	    
	}

	.mainImgCon,#input-image {
				display: none;
			}
			
		#preview-image{
			width: 350px;
			height: 350px;
			/* object-fit:cover; */
			background-size: contain;
		
		}

</style>

<script type="text/javascript">
	
	function clickDel(askInfo) {
	 	askInfo.action = "${pageContext.request.contextPath}/main/board/askanswer/deleteStudent";
	 	askInfo.method = "post";
	 	askInfo.submit();
	}

</script>

</head>
<body>
		

<div class="main-content">
	<table align="center" class="table">
			
			<tr> 
				<td> 
			    	문의 제목
			    </td>
			    <td> 
			    	${askAnswerDetail.askTitle}
			    </td>
			</tr>
			<tr> 
				 <td> 
			    	문의 ID
			    </td>
			    <td> 
			    	${askAnswerDetail.teacher.teacherId}
			    </td>
			</tr>
			<tr> 
				 <td> 
			    	카테고리명
			    </td>
			    <td> 
			    	${askAnswerDetail.askCategory.askCategoryName}
			    </td>
			</tr>
			<tr> 
				 <td> 
			    	답변 유무
			    </td>
			    <td> 
			    	
			    	<c:choose>
                       	<c:when test="${askAnswerDetail.askComplete == 'F'}">
                       		<span class="badge bg-secondary">미답변</span>
                       	</c:when>
                       	<c:when test="${askAnswerDetail.askComplete == 'T'}">
                       		<span class="badge bg-primary">답변 완료</span>
                       	</c:when>
                     </c:choose>
			    	
			    </td>
			</tr>
			<tr> 
				 <td> 
			    	문의 일자
			    </td>
				<td>
					<fmt:parseDate value="${askAnswerDetail.askInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
				</td>
			</tr>
			<tr>
				
			     <td colspan="2" style="text-align: center;" align="left">
					<img id="preview-image" alt="" src="${pageContext.request.contextPath}/img/ask/${askAnswerDetail.askImg}">
					<span style="font-size:9pt;"><b><pre>${askAnswerDetail.askContent}</pre></b></span>
			     </td>
    		</tr>
	
											
			    <hr>
	</table>
	
	<div class="card" style="width: 18rem;">
  		<div class="card-body">
			    <c:choose>
			    	<c:when test="${empty askAnswerDetail.answer}">
					<span>답변 내용이 없습니다.</span>
			    	
			    	</c:when>
			    	<c:otherwise>
					 답변 내용 : ${askAnswerDetail.answer.answerContent}<p>
					 답변 일자 : 
						 <fmt:parseDate value="${askAnswerDetail.answer.answerInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
						<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
					
					 </c:otherwise>
			    </c:choose>
	    	</div>
	    </div>
	
	
		<div class="row">
			<div  class="col text-center">
					
					<c:choose>
					<c:when test="${askAnswerDetail.askComplete eq 'T'}">
						
					</c:when>
					<c:when test="${askAnswerDetail.askComplete eq 'F'}">
						<a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/teacher/board/askanswer/updateFormTeacher?askNo=${askAnswerDetail.askNo}">수정하기</a>
					</c:when>
				</c:choose>
			
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제하기</button>
			</div>
		</div>
		<a class="btn btn-primary btn-sm" role="button" href="${pageContext.request.contextPath}/teacher/board/askanswer/askAnswerSelectById">뒤로가기</a>
		
					
	<form name="askInfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		<input type=hidden name="askNo" value="${askAnswerDetail.askNo}">
	</form>
	
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">게시물 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       게시물을 정말 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="clickDel(askInfo)">삭제하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>







</body>
</html>