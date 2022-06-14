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

<div class="main-content">
<br><br>
<form method="post" class="row g-3" action="${pageContext.request.contextPath}/main/login/findId">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	<h3> 아이디 찾기 </h3><br><br>
    <hr>
	<!-- 이름 -->
		<div class="col-md-3">
		</div>	
		<div class="col-md-3">
			<label for="userName" class="form-label">이름</label>
		</div>	
		<div class="col-md-3">
			<input type="text" id="userName" name="userName" class="form-control" placeholder="이름을 입력해주세요." required>
		</div>	
		<div class="col-md-3">
		</div>	
	
	<!-- 휴대폰 번호 -->
		<div class="col-md-3">
		</div>	
		<div class="col-md-3">
			<label for="userPhone" class="form-label">휴대폰 번호</label>
		</div>	
		<div class="col-md-3">
			<input type="text" id="userPhone" name="userPhone" class="form-control" placeholder="휴대폰 번호를 입력해주세요." required>
		</div>	
		<div class="col-md-3">
		</div>	<hr>
	
	
	<!-- 버튼 -->
		<div class=".col-6 .col-sm-4 text-center">
		</div>	
		<div class=".col-6 .col-sm-4 text-center">
			<input type="submit" class="btn btn-primary" value="확인">
		</div>	
		<div class="col-md-6">
		</div>	
		<div class="col-md-2">
		</div>	
		<div class="col-md-2">
		</div>	
		<div class="col-md-2">
			<input type="button" id="linkFindPwd" value=" > 비밀번호 찾기" class="btn btn-primary btn-sm" onClick="location.href='findPwdForm'">
		</div>	
	
	
	
<!-- 	<table> -->
<!-- 	  <tr> -->
<!-- 	    <th>이름</th> -->
<!-- 	      <td> -->
<!-- 	        <input type="text" id="userName" name="userName" class="text" placeholder="가입 시 입력하셨던 이름을 입력해주세요." required> -->
<!-- 	      </td> -->
<!-- 	  </tr> -->
<!-- 	  <tr> -->
<!-- 	     <th>핸드폰 번호</th> -->
<!-- 	      <td> -->
<!-- 	        <input type="text" id="userPhone" name="userPhone" class="text" placeholder="가입 시 입력하셨던 핸드폰 번호를 입력해주세요." required> -->
<!-- 	      </td> -->
<!-- 	  </tr> -->
<!-- 	</table> -->
<!-- 	<input type="submit" value="확인"> -->
<!-- 	<input type="reset" value="취소"> -->
<!-- 	<input type="button" id="linkFindPwd" value="비밀번호 찾기" onClick="location.href='findPwdForm'"> -->
</form>
</div>
</body>
</html>