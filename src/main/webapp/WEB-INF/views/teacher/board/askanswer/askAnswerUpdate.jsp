<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
\${askSelectByIdList.askNo} : ${askSelectByIdList.askNo}
<form name=updateForm method=post action="${pageContext.request.contextPath}/teacher/board/askanswer/updateTeacher?${_csrf.parameterName}=${_csrf.token}" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
    
    <input type='hidden' name='askNo' value="${askSelectByIdList.askNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td>
            <p align="center">${askSelectByIdList.askNo} 게시물 수정하기</p>
        </td>
    </tr>
    <tr>
        <td>
            <p align="center">문의 ID : ${askSelectByIdList.student.studentId}</p>
        </td>
    </tr>
    <tr>
        <td>
            <span>문의 제목</span>
        </td>
        <td>
			<input type=text name="askTitle" value="${askSelectByIdList.askTitle}">
		</td>
    </tr>
    
    <tr>
        <td>
            <span>문의 내 용</span>
        </td>
        <td>
			<textarea name="askContent">${askSelectByIdList.askContent}</textarea>
		</td>
    </tr>
    <tr>
        <td>
			<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기">
		</td>
    </tr>
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/teacher/board/askanswer/askAnswerTeacher">리스트로 돌아가기</a>&gt;</span></div>


</body>
</html>