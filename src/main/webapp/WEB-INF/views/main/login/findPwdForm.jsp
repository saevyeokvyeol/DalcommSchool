<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지입니다.</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>비밀번호를 찾아봅시당~</h1>

<form method="post" action="${pageContext.request.contextPath}/main/login/findPwd">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	<table>
	  <tr>
	    <th>아이디</th>
	      <td>
	        <input type="text" id="userId" name="userId" class="text" placeholder="아이디를 입력해주세요." required>
	      </td>
	  </tr>
	  <tr>
	    <th>이름</th>
	      <td>
	        <input type="text" id="userName" name="userName" class="text" placeholder="이름을 입력해주세요." required>
	      </td>
	  </tr>
	  <tr>
	     <th>핸드폰 번호</th>
	      <td>
	        <input type="text" id="userPhone" name="userPhone" class="text" placeholder="'-'를 제외한 핸드폰 번호 11자리를 입력해주세요." required>
	      </td>
	  </tr>
	</table>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	<input type="button" id="linkFindId" value="아이디 찾기" onClick="location.href='findIdForm'">
</form>
</body>
</html>