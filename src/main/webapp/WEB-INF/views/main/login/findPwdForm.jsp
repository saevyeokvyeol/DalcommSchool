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

<div class="main-content">
<br><br>
<form method="post" class="row g-3" action="${pageContext.request.contextPath}/main/login/findPwd">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	<h3> 비밀번호 찾기 </h3><br><br>
    <hr>
	
	<!-- 아이디 -->
		<div class="col-md-3">
		</div>	
		<div class="col-md-3">
			<label for="userId" class="form-label">아이디</label>
		</div>	
		<div class="col-md-3">
			<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력해주세요." required>
		</div>	
		<div class="col-md-3">
		</div>	
	
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
			<input type="button" id="linkFindId" value=" > 아이디 찾기" class="btn btn-primary btn-sm" onClick="location.href='findIdForm'">
		</div>	
	
	
<!-- 	<table> -->
<!-- 	  <tr> -->
<!-- 	    <th>아이디</th> -->
<!-- 	      <td> -->
<!-- 	        <input type="text" id="userId" name="userId" class="text" placeholder="아이디를 입력해주세요." required> -->
<!-- 	      </td> -->
<!-- 	  </tr> -->
<!-- 	  <tr> -->
<!-- 	    <th>이름</th> -->
<!-- 	      <td> -->
<!-- 	        <input type="text" id="userName" name="userName" class="text" placeholder="이름을 입력해주세요." required> -->
<!-- 	      </td> -->
<!-- 	  </tr> -->
<!-- 	  <tr> -->
<!-- 	     <th>핸드폰 번호</th> -->
<!-- 	      <td> -->
<!-- 	        <input type="text" id="userPhone" name="userPhone" class="text" placeholder="'-'를 제외한 핸드폰 번호 11자리를 입력해주세요." required> -->
<!-- 	      </td> -->
<!-- 	  </tr> -->
<!-- 	</table> -->
<!-- 	<input type="submit" value="확인"> -->
<!-- 	<input type="reset" value="취소"> -->
<!-- 	<input type="button" id="linkFindId" value="아이디 찾기" onClick="location.href='findIdForm'"> -->
</form>
</div>
</body>
</html>