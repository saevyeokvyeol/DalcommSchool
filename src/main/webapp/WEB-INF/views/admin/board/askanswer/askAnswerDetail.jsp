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

	
	#preview-image{
		width: 350px;
		height: 350px;
		/* object-fit:cover; */
		background-size: contain;
	
	}


</style>
<script type="text/javascript">
	

	$(function getAnswerList(){
		//alert(1);
		$("#answerBtn").click(function(){
		   
		    $.ajax({
			   url: "${pageContext.request.contextPath}/admin/board/insertAnswer",
			   type: "post",
			   data: {"${_csrf.parameterName}": "${_csrf.token}" , askNo:"${askAnswerDetail.askNo}" , answerContent: $("#answerArea").val()},
			   dataType: "json",
			   success: function(result) {
				  

				   alert("답변을 등록하였습니다.");
				   
					
					
				var data="";
				 
				  
				   data+="<table align='center' class='table'>";	
						data+="<h6>"+result.answerContent+"</h6>";
									
						data+="<span id='date'>"+result.answerInsertDate.toString().substring(0,10)+"</span>";
						
					
					
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
	<table class="table" id="askTable">
			<tr>
			    <td colspan="2"> 
			    	<h4><span class="badge bg-secondary">${askAnswerDetail.askCategory.askCategoryName}</span> ${askAnswerDetail.askTitle}</h4>
			    	
			    	${askAnswerDetail.student.studentId}<br>
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
					 	<div>
		<div id="answerView">
			<c:if test="${not empty askAnswerDetail.answer}">
			<h6>${askAnswerDetail.answer.answerContent}</h6>
				 			<span id="date"><fmt:parseDate value="${askAnswerDetail.answer.answerInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
							<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>

			
				 
			</c:if>		
		</div>
				
				
			<c:if test="${empty askAnswerDetail.answer}">
				<c:remove var="span"/>
				
			<span id="span">	
				<textarea class="form-control" rows="10" cols="10" id="answerArea" placeholder="답변을 입력해 주세요."></textarea>
				<!-- <input type="button" id="answerBtn" value="답변하기">  -->
				
				 <button type="button" id="answerBtn"  class="btn btn-secondary">답변하기</button>
				
				<!-- <button id="answerBtn">답변하기</button> -->
			</span>
			</c:if>
	</div>
				</td>
			</tr>
			
		</table>
				
				

				

	
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/askAnswerList" role="button" >목록으로</a>


</body>
</html>