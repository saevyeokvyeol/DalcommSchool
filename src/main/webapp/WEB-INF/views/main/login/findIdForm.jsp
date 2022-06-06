<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지입니다.</title>
<style type="text/css">
	.text{width:500px;}
</style>
</head>
<body>
<h1>아이디를 찾아봅시당</h1>


<form method="post" action="${pageContext.request.contextPath}/main/login/findId">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	<table>
	  <tr>
	    <th>이름</th>
	      <td>
	        <input type="text" id="userName" name="userName" class="text" placeholder="가입 시 입력하셨던 이름을 입력해주세요." required>
	      </td>
	  </tr>
	  <tr>
	     <th>핸드폰 번호</th>
	      <td>
	        <input type="text" id="userPhone" name="userPhone" class="text" placeholder="가입 시 입력하셨던 핸드폰 번호를 입력해주세요." required>
	      </td>
	  </tr>
	</table>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	<input type="button" id="linkFindPwd" value="비밀번호 찾기" onClick="location.href='findPwdForm'">
</form>
</body>
</html>