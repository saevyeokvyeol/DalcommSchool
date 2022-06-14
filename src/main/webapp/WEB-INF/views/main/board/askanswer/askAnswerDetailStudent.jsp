<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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

</head>
<body>

<div class="main-content">

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
		        <td>
		        	답변 유무 : ${askAnswerDetail.askComplete}<p>
		        </td>
		    </tr>
		    
		</table>
		<hr>
			<tr>
	        	<td >
				<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
					 	<%-- <input type=hidden name="askNo" value="${askSelectByIdList.askNo}">
						<input type=button value="수정하기" > --%>
						
						<a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/updateFormStudent?askNo=${askAnswerDetail.askNo}">수정하기</a>
						<a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/deleteStudent?askNo=${askAnswerDetail.askNo}">삭제하기</a>				
					
				</td>
	    	</tr>
			    <hr>
			    <c:choose>
			    	<c:when test="${empty askAnswerDetail.answer}">
					<span>답변 내용이 없습니다.</span>
			    	
			    	</c:when>
			    	<c:otherwise>
					 답변 내용 : ${askAnswerDetail.answer.answerContent}<p>
					 답변 일자 : ${askAnswerDetail.answer.answerInsertDate}
					 </c:otherwise>
			    </c:choose>
		

		


<div align=right><span style="font-size:9pt;"><a class="btn btn-info" role="button" href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerStudent">뒤로가기</a></span></div>
</div>
</body>
</html>