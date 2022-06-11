<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA : 수정하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



</head>
<body>

<div class="main-content">

	<!--QnA 수정하기-->
	<div class="card" style="width: 30rem;">
	    <div class="card-body">

		<form name=updateForm method=post action="${pageContext.request.contextPath}/main/board/qna/qnaUpdate" >
			<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
		    <input type='hidden' name='qnaId' value="${qna.qnaId}">
		    <input type="hidden" name="classId" value="${qna.classes.classId}">
			<input type="hidden" name="studentId" value="${qna.student.studentId}">
			<input type="hidden" name="blindState" value="${qna.blindState}">
			<input type="hidden" name="qnaComplete" value="${qna.qnaComplete}">
			
			<h3>${qna.qnaId}번 Q&A 글 수정하기</h3>
			<table>
		    <tr>
		        <th>제목</th>
		        <td><input type=text name="qnaTitle" size="30" value="${requestScope.qna.qnaTitle}"></td>
		    </tr>
		    
		    <tr>
		        <th>내 용</th>
		        <td><textarea name="qnaContent" cols="30" rows="10">${requestScope.qna.qnaContent}</textarea></td>
		    </tr>
		    
		    <tr>
		        <th>비밀글 체크</th>
		        <td>
		        	<span><input type="checkbox" name="secretState" value="T">공개</span>
		        	<span><input type="checkbox" name="secretState" value="F">비공개</span>
		        </td>
		    </tr>
		    
		    <tr>
		        <td><input type="submit" value="수정하기"></td>
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