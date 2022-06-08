<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
\${askSelectByIdList.askNo} : ${askSelectByIdList.askNo}
<form name=updateForm method=post action="${pageContext.request.contextPath}/main/board/askanswer/updateTeacher?${_csrf.parameterName}=${_csrf.token}" >
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
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/main/board/askanswer/askAnswerTeacher">리스트로 돌아가기</a>&gt;</span></div>


</body>
</html>