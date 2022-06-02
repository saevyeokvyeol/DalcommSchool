<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>QnA : 수정하기</title>
</head>
<body>

<form name=updateForm method=post action="${pageContext.request.contextPath}/main/class/qnaUpdate" >
    <input type='hidden' name='qnaId' value="${qna.qnaId}">
    <input type="hidden" name="classId" value="${qna.classes.classId}">
	<input type="hidden" name="studentId" value="${qna.student.studentId}">
	<input type="hidden" name="blindState" value="${qna.blindState}">
	<input type="hidden" name="qnaComplete" value="${qna.qnaComplete}">
	<table>
    <tr>
        <th>${qna.qnaId}번 Q&A 글 수정하기</th>
    </tr>
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
        <td><input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></td>
    </tr>
    
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/main/class/qnaList">목록으로 돌아가기</a>&gt;</span></div>



</body>
</html>