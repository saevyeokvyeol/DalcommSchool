<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정하기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">

.message{display: none}

</style>

<script type="text/javascript">
$(function(){
	
	/*
	비밀번호 형식 체크
	*/
	$("#newUserPwd").focusout(function(){
		isValidPwd();
	})
	
	function isValidPwd(){
		var id = $("#newUserPwd").val();
		
		var isNum = id.search(/[0-9]/g); //숫자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
		var isLow = id.search(/[a-z]/g); //영소문자 있는지 확인. index 리턴. -> -1이면 안됨.
		var isUp = id.search(/[A-Z]/g); //영대문자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
		var isSpace = id.search(/\s/); //공백 있는지 확인. 없으면 -1. -> -1 리턴해야함.
		var specialChar = id.search(/[~!@#$%^&*?\|=]/gi); //특수문자 있는지 확인. -> -1리턴해야함
		var isKorean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); // -1리턴해야함.
		
		if(id.length<8){ //길이 체크
			$("#notValidPwd").css("display", "inline-block");
			alert("길이 땡")
			return false;
		}else if(isNum<0 || isUp<0 || isLow<0 || isSpace!=-1 || specialChar!=-1 || isKorean!=-1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
			$("#notValidPwd").css("display", "inline-block");
			$("#pwdCheck_success").css("display", "none");
			//alert("다른거 땡")
			return false;
		}else{
			$("#notValidPwd").css("display", "none");
			//alert("올바릅니다.")
			return true;
		}
	}
	
	$("#newUserPwd").keyup(function(){
		isSamePwd = false;
		})
	
	isSamePwd = false;
	
	$("#newUserPwd2").focusout(function(){
		let pwd1 = $("#newUserPwd").val();
		let pwd2 = $("#newUserPwd2").val();
		
		if(pwd1!="" && pwd2!=""){
			if(pwd1 == pwd2){
				$("#pwdCheck_Fail").css("display", "none");
				$("#pwdCheck_success").css("display", "inline-block");
				isSamePwd = true;
			}else{
				$("#pwdCheck_success").css("display", "none");
				$("#pwdCheck_Fail").css("display", "inline-block");
				isSamePwd = false;
			}
		}else if(pwd1 != "" && pwd2 == ""){
			$("#pwdCheck_success").css("display", "none");
			$("#pwdCheck_Fail").css("display", "none");
			isSamePwd = false;
		}else{
			$("#pwdCheck_success").css("display", "none");
			$("#pwdCheck_Fail").css("display", "none");
			isSamePwd = false;
		}
	})
	
	$("#newUserPwd2").focusout(function(){
		let pwd1 = $("#newUserPwd").val();
		let pwd2 = $("#newUserPwd2").val();
		
		if(pwd1=="" && pwd2!=""){
			$("#pwdCheck_Fail").css("display", "inline-block");
			isSamePwd = false;
		}
		
	}) //focusout 끝

	/*
	 비밀번호 일치 여부 확인
	 */
	$("#updatePwdForm").submit(function(event){	
		if(!isSamePwd){
			alert("비밀번호 일치 여부를 확인해주세요.")
			event.preventDefault();
		}
		
		let pwd = $("#userPwd").val();
		let newPwd = $("#newUserPwd").val();
		
		if(pwd==newPwd){
			alert("새로운 비밀번호는 기존 비밀번호와 달라야합니다.")
			event.preventDefault();
		}
		
		if(!isValidPwd()){
			alert("비밀번호를 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}
	})
	
})
</script>
</head>
<body>
<div class="main-content">
<br><br>
<h3>비밀번호 변경</h3>
<br><br><br>
<form method="post" class="row g-3" id="updatePwdForm" action="${pageContext.request.contextPath}/main/login/findPwdOk">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  	<input type="hidden" name="userId" value="${userId}">
  	
  	<!-- 새 비밀번호 -->
    		<div class="col-md-2">
			</div>	
     		<div class="col-md-2">
     			<label for="newUserPwd" class="form-label">변경할 비밀번호</label>
     		</div>
     		<div class="col-md-6">
				<input type="password" id="newUserPwd" name="newUserPwd" class="form-control" placeholder="영소문자+대문자+숫자, 최소 8글자 이상 입력해주세요." required/>
	      		<span id="notValidPwd" class="message">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span></td>
	      	</div>
	      	<div class="col-md-2">
			</div>	
  	
  	<!-- 새 비밀번호 확인 -->
    		<div class="col-md-2">
			</div>	
     		<div class="col-md-2">
     			<label for="newUserPwd2" class="form-label">비밀번호 확인</label>
     		</div>
     		<div class="col-md-6">
				<input type="password" id="newUserPwd2" name="newUserPwd2" class="form-control" placeholder="한번 더 입력해주세요." required/>
	      		<span id="notValidPwd" class="message">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span></td>
	      		<span id="pwdCheck_success" class="message">비밀번호가 일치합니다.</span>
	 			<span id="pwdCheck_Fail" class="message">비밀번호 일치 여부를 확인해주세요.</span></td>
	      	</div>
	      	<div class="col-md-2">
			</div>	
 
 			<br><br><br><br>
		  <div class="text-center">
		    <input type="submit" id="submitBtn" class="btn btn-primary" value="확인">
		    <input type="reset" id="cancelBtn" class="btn btn-primary" value="취소">
		  </div>
  	
  	
<!--   <table> -->
<!--     <tr> -->
<!--       <th>새 비밀번호</th> -->
<!--       <td><input type="password" id="newUserPwd" name="newUserPwd" placeholder="영소문자,대문자,숫자를 조합하여 최소 8자리 이상 입력해주세요." required> -->
<!--       <span id="notValidPwd" class="message">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span></td> -->
<!--     </tr> -->
<!--     <tr> -->
<!--       <th>새 비밀번호 확인</th> -->
<!--       <td><input type="password" id="newUserPwd2" placeholder="한번 더 입력해주세요." required> -->
<!--       <span id="pwdCheck_success" class="message">비밀번호가 일치합니다.</span> -->
<!-- 	  <span id="pwdCheck_Fail" class="message">비밀번호 일치 여부를 확인해주세요.</span></td> -->
<!--     </tr> -->
<!--   </table> -->

</form>

</div>
</body>
</html>