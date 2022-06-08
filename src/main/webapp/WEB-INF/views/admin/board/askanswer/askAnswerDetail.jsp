<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<style type="text/css">

	#answerBtn{
    background-color: rgb(0, 128,255);
    width: 5.5em;
    height: 3.3em;;
    font-size: 15px;
    font-weight: bold;
    color: aliceblue;
	}

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
		<!-- 아작스 클릭하면 자동으로 나오게 하는것
		id값주고 remove하기 -->
		<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
  		   <tr>  
		        <td>
		           글 번호 : ${askAnswerDetail.askNo}<p>
		        </td>
		        <td>
		        	문의 ID : ${askAnswerDetail.student.studentId}<p>
		        </td>
		        <td>
		        	문의제목 : ${askAnswerDetail.askTitle}<p>
		        </td>
		        <td>
				    카테고리 : ${askAnswerDetail.askCategory.askCategoryId}<p>
		        </td>
		        <td>
		            문의 내용 : ${askAnswerDetail.askContent}<p>
		        </td>
		        <td>
		        	첨부 파일명 : ${askAnswerDetail.askImg}<p>
		        </td>
		        <td>
		        	문의 일자 : ${askAnswerDetail.askInsertDate}<p>
		        </td>
		    </tr>
		    
		</table>
		<hr>
		
		

<div id="answerView">

<c:if test="${not empty askAnswerDetail.answer}">
	 답변 내용 : ${askAnswerDetail.answer.answerContent}<p>
	 답변 일자 : ${askAnswerDetail.answer.answerInsertDate}
</c:if>

	
</div>
	
<c:if test="${empty askAnswerDetail.answer}">
	<c:remove var="span"/>
	
<span id="span">	
	<textarea rows="10" cols="10" id="answerArea" placeholder="답변을 입력해 주세요."></textarea>
	<!-- <input type="button" id="answerBtn" value="답변하기">  -->
	
	<!-- <button type="button" id="answerBtn">답변하기</button> -->
	
	<button id="answerBtn">답변하기</button>
</span>
</c:if>

<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/board/askAnswerList">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>