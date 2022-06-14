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

	/* #answerBtn{
    background-color: rgb(0, 128,255);
    width: 5.5em;
    height: 3.3em;;
    font-size: 15px;
    font-weight: bold;
    color: aliceblue;
	} */

	#span{
	    width: 100%;
	}

	#answerArea{
	    margin-bottom: 10px; 
	    height: 150px;
	    width: 500px;
	    
	}



</style>
<script type="text/javascript">
	

	$(function getAnswerList(){
		//alert(1);
		$("#answerBtn").click(function(){
		   alert(123)
		    $.ajax({
			   url: "${pageContext.request.contextPath}/admin/board/insertAnswer",
			   type: "post",
			   data: {"${_csrf.parameterName}": "${_csrf.token}" , askNo:"${askAnswerDetail.askNo}" , answerContent: $("#answerArea").val()},
			   dataType: "json",
			   success: function(result) {
				   var data="<table border='1' cellpadding='5'>";
				  
					   alert("성공");
						 data+="<tr>";
							data+="<td>답변 번호 : "+result.answerNo+"</td><p>";
							data+="<td>답변 내용 : "+result.answerContent+"</td><p>";
							data+="<td>답변 일자 : "+result.answerInsertDate+"</td><p>";
							data+="</tr>";
					
					data+="</table>";
					
				   $("#answerView").html(data);
				   $("#span").hide();
				  
			   },
				error: function(err) {
					
					alert("답변을 실패 하였습니다.")
				}
			  
		   }) 
		   return false;
	   })
	   return false;
		
	});
	
	
	 
	


</script>
</head>
<body>

<div class="main-content">
	<h5> 관리자 > 1대1 문의 LIST </h5><br><hr>
<table align="center" class="table">	
		
		<tr> 
			 <td> <!-- 글 제목 -->
		    	문의제목
		    </td>
		    <td> <!-- 글 제목 -->
		    	${askAnswerDetail.askTitle}
		    </td>
	    </tr>
		<tr> 
			 <td> <!-- 글 제목 -->
		    	문의 ID
		    </td>
		    <td> <!-- 글 제목 -->
		    	${askAnswerDetail.student.studentId}
		    </td>
		</tr>
		 <tr> 
			 <td> <!-- 글 제목 -->
		    	작성일
		    </td>
			<td>
				<fmt:parseDate value="${askAnswerDetail.askInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
				<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
			</td>
		 </tr>
		 <tr> 
			 <td> <!-- 글 제목 -->
		    	카테고리명
		    </td>
			<td>
				${askAnswerDetail.askCategory.askCategoryName}
			</td>
		 </tr>
		 	<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
		<tr>
		     <td colspan="2" style="text-align: center;">
				<img alt="" src="${pageContext.request.contextPath}/img/ask/${askAnswerDetail.askImg}">
				<span style="font-size:9pt;"><b><pre>${askAnswerDetail.askContent}</pre></b></span>
		     </td>
	    </tr>
		
		
	
		
		
		<tr>
			<td>
				<div align="right">
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/askAnswerList" role="button" >목록으로</a>
				</div>
			</td>
		</tr>
	


</table>
	<div align="center">
		<div id="answerView">
			
			<c:if test="${not empty askAnswerDetail.answer}">
				 답변 내용 : ${askAnswerDetail.answer.answerContent}<p>
				 답변 일자 : <%-- ${askAnswerDetail.answer.answerInsertDate} --%>
				 			<fmt:parseDate value="${askAnswerDetail.answer.answerInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
												<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
			</c:if>
			
				
			</div>
				
			<c:if test="${empty askAnswerDetail.answer}">
				<c:remove var="span"/>
				
			<span id="span">	
				<textarea rows="10" cols="10" id="answerArea" placeholder="답변을 입력해 주세요."></textarea>
				<!-- <input type="button" id="answerBtn" value="답변하기">  -->
				
				 <button type="button" id="answerBtn"  class="btn btn-secondary">답변하기</button>
				
				<!-- <button id="answerBtn">답변하기</button> -->
			</span>
			</c:if>
	</div>
</div>

</body>
</html>