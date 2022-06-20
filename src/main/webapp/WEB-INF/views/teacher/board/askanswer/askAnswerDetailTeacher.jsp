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

	#preview-image{
		width: 350px;
		height: 350px;
		/* object-fit:cover; */
		background-size: contain;
	
	}

</style>



</head>
<body>
<div id="sidebarHeader"><h3>1대1 문의</h3></div>
	<table class="table" id="askTable">
			<tr>
			    <td colspan="2"> 
			    	<h4><span class="badge bg-secondary">${askAnswerDetail.askCategory.askCategoryName}</span> ${askAnswerDetail.askTitle}</h4>
			    	
			    	${askAnswerDetail.teacher.teacherId}<br>
					<span id="date">${askAnswerDetail.askInsertDate.toString().substring(0, 10)}</span>
			    </td>
			</tr>
			<tr>
				<td><i class="fa-solid fa-q fa-2xl"></i></td>
			     <td>
			     	<c:if test="${askAnswerDetail.askImg != null}">
						<img alt="" src="${pageContext.request.contextPath}/img/ask/${askAnswerDetail.askImg}">
			     	</c:if>
					<pre><h6>${askAnswerDetail.askContent}</h6></pre>
			     </td>
    		</tr>	
			<tr>
			<td><i class="fa-solid fa-a fa-2xl"></i></td>
				<td>
					 <c:choose>
					    	<c:when test="${empty askAnswerDetail.answer}">
							<span>답변 내용이 없습니다.</span>			    	
					    	</c:when>
					    	<c:otherwise>
							  ${askAnswerDetail.answer.answerContent}<br><br>
					    	<span id="date">${askAnswerDetail.answer.answerInsertDate.toString().substring(0, 10)}</span>
							 </c:otherwise>
					 </c:choose>
				</td>
			</tr>
			
		</table>
	<div class="row">
		<div  class="col text-center"> 
			<c:choose>
				<c:when test="${askAnswerDetail.askComplete eq 'T'}">
					
				</c:when>
				<c:when test="${askAnswerDetail.askComplete eq 'F'}">
					<a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/updateFormStudent?askNo=${askAnswerDetail.askNo}">수정하기</a>
				</c:when>
			</c:choose>
			
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제하기</button>
		</div>
	</div>
	<a class="btn btn-primary btn-sm" role="button" href="${pageContext.request.contextPath}/main/mypage/askAnswerSelectById">뒤로가기</a>
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
	
</body>
</html>