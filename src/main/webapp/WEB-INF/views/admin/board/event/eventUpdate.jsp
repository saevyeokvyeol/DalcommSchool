<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이벤트 수정 페이지 입니다</h1>
	
	<form name=updateForm method=post action="${pageContext.request.contextPath}/admin/board/event/eventUpdate">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type='hidden' name='noticeNo' value="${event.eventNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> ${event.eventNo} 게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="eventTitle" size="30"
		 value="${event.eventTitle}"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">글 내용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="eventContent" cols="50" rows="10">${event.eventContent}</textarea></span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="submit" value="수정하기" name="update"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</form>

</body>
</html>