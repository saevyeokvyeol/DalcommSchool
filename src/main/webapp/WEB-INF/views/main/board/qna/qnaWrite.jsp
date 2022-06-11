<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA: 등록폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



</head>
<body>

<div class="main-content">

	<!--QnA 등록하기-->
	<div class="card" style="width: 30rem;">
	    <div class="card-body">
	
			<form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/qna/qnaInsert" >
				<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
				<%-- <input type="hidden" name="classId" value="${qna.classes.classId}">
				<input type="hidden" name="studentId" value="${qna.student.studentId}">
				 --%>
				<input type="hidden" name="classId" value="2">
				<input type="hidden" name="studentId" value="lee1234">
				<h2>문의사항 등록</h2>
				<table >
				
				    <tr>
				        <th>제목</th>
				        <td><input type=text name="qnaTitle" size="30"></td>
				    </tr>
				    <tr>
				        <th>내용</th>
				        <td><textarea name="qnaContent"  rows="10" cols="33"></textarea></td>
				    </tr>
				    <tr>
				        <th>비밀글 체크</th>
				        <td>
				        	<span><input type="checkbox" name="secretState" value="T">공개</span>
				        	<span><input type="checkbox" name="secretState" value="F">비공개</span>
				        </td>
				    </tr>
				    
				    <tr>
				        <td colspan="2"><span><input type=submit value=등록하기> 
				        <input type=reset value=다시쓰기></span></td>
				    </tr>
				</table>
			
			</form>
	
			<hr>
			<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/main/board/qna/qnaList">목록으로 돌아가기</a>&gt;</span></div>
	
		</div>
	</div>
</div>
	

</body>
</html>