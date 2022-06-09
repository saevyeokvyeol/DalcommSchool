<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">

<script type="text/javascript">


	function clickDel(eventInfo) {
	 	eventInfo.action = "${pageContext.request.contextPath}/admin/board/event/eventDelete";
	 	eventInfo.method = "post";
	 	eventInfo.submit();
	}

	$(function(){
		
	 $("input[value=수정하기]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/board/event/eventUpdate");
		   $("#requestForm").submit();
		   
	   })

	});
	
</script>


<title>Insert title here</title>
</head>
<body>
	

<div class="main-content">

	<h5> 관리자 > 이벤트 관리 </h5><br><hr>
	
<table align="center" class="table">
  
	<tr> 
		 <td> <!-- 글 제목 -->
	    	제목
	    </td>
	    <td> <!-- 글 제목 -->
	    	${requestScope.event.eventTitle}
	    </td>
	</tr>
	<tr> 
		 <td> <!-- 글 제목 -->
	    	작성자
	    </td>
	    <td> <!-- 글 제목 -->
	    	관리자
	    </td>
	</tr>
	<tr> 
		 <td> <!-- 글 제목 -->
	    	작성일
	    </td>
		<td>
			<fmt:parseDate value="${event.eventInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
			<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
		</td>
	</tr>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
	<tr>
	     <td colspan="2" style="text-align: center;">
			<img alt="" src="${pageContext.request.contextPath}/img/event/${requestScope.event.eventImg}">
			<span style="font-size:9pt;"><b><pre>${requestScope.event.eventContent}</pre></b></span>
	     </td>
    </tr>
    
	<tr>
        <td>
        <!-- 관리자 버튼 권한-->
	        <div class="col-6 col-md-4">
				<form name="requestForm" method="post" id="requestForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
					<input type=hidden name="eventNo" value="${event.eventNo}">
					
					<input type=button class="btn btn-primary" value="수정하기" >
				</form>
			</div>
		</td>
		<td>
	        <div class="col-6 col-md-4">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제하기</button>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/event/eventList" role="button" >목록으로</a>
		</td>
	</tr>
    </table>
    
    <form name="eventInfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		<input type=hidden name="eventNo" value="${event.eventNo}">
	</form>
    

    <!-- Modal -->
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
	        <button type="button" class="btn btn-primary" onclick="clickDel(eventInfo)">삭제하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
	      </div>
	    </div>
	  </div>
	</div>
    </div>
    
    

</body>
</html>