<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jQuery ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery ui -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>Insert title here</title>

<style type="text/css">

	.idCheck_success, .pwdCheck_success, .phoneCheck_success, .ValidId, ValidEmail.phoneCheck_success {
		color: blue;
		display: none;
	}
	.idCheck_fail, .pwdCheck_Fail, .phoneCheck_fail, .notValidEmail, .notValidId, .phoneCheck_fail {
		color:red;
		display: none;
	}
	
	.message{display: none}
	
</style>

	<!-- 형식 체크 (진행 중) -->
<script type = "text/javascript">
	
	$(function(){
		/*
		아이디 형식 체크
		*/
		$("#studentId").focusout(function(){
			isValidId();
		})
		
		function isValidId(){
			var id = $("#studentId").val();
			
			var isNum = id.search(/[0-9]/g); //숫자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
			var checkLow = /[a-z]/; //영소문자인지 확인 -> true를 반환해야함.
			var isSpace = id.search(/\s/); //공백 있는지 확인. 없으면 -1. -> -1 리턴해야함.
			var specialChar = id.search(/[~!@#$%^&*?\|=]/gi); //특수문자 있는지 확인. -> -1리턴해야함
			var isKorean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); // -1리턴해야함.
			
			if(id.length<6 || id.length>10){ //길이 체크
				$("#notValidId").css("display", "inline-block");
				//$("#notValidId").tooltip("show");
				return false;
			}else if(!checkLow.test(id)){ //영소문자 체크  --> 확인해봐야함.
				$("#notValidId").css("display", "inline-block");
				//$("#notValidId").tooltip("show");
				return false;
			}else if(isNum<0 || isSpace!=-1 || specialChar!=-1 || isKorean!= -1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
				$("#notValidId").css("display", "inline-block");
				//$("#notValidId").tooltip("show");
				return false;
			}else{
				$("#notValidId").css("display", "none");
				//$("#notValidId").tooltip("hidden");
				return true;
			}
		}
		
		/*
		비밀번호 형식 체크
		*/
		$("#studentPwd").focusout(function(){
			isValidPwd();
		})
		
		function isValidPwd(){
			var id = $("#studentPwd").val();
			
			var isNum = id.search(/[0-9]/g); //숫자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
			var isLow = id.search(/[a-z]/g); //영소문자 있는지 확인. index 리턴. -> -1이면 안됨.
			var isUp = id.search(/[A-Z]/g); //영대문자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
			var isSpace = id.search(/\s/); //공백 있는지 확인. 없으면 -1. -> -1 리턴해야함.
			var specialChar = id.search(/[~!@#$%^&*?\|=]/gi); //특수문자 있는지 확인. -> -1리턴해야함
			var isKorean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); // -1리턴해야함.
			
			if(id.length<8){ //길이 체크
				$("#notValidPwd").css("display", "inline-block");
				return false;
			}else if(isNum<0 || isUp<0 || isLow<0 || isSpace!=-1 || specialChar!=-1 || isKorean!=-1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
				$("#notValidPwd").css("display", "inline-block");
				return false;
			}else{
				$("#notValidPwd").css("display", "none");
				return true;
			}
		}
		
		/*
		핸드폰 번호 형식 체크
		*/
		$("#studentPhone").focusout(function(){
			isValidPhone();
		})
		
		function isValidPhone(){
			var phone = $("#studentPhone").val();
			var validNum = /^010?([0-9]{8})$/;
			
			if(!validNum.test(phone)){
				$("#notValidPhone").css("display","inline-block");
				return false;
			}else{
				$("#notValidPhone").css("display","none");
				return true;
			}
		}
		
		/*
		이메일 형식 체크
		*/
		$("#studentEmail").focusout(function(){
			isValidEmail();
		})
		
		function isValidEmail(){
			var email = $("#studentEmail").val();
			var validEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			var result = email.match(validEmail);
			
			if(!result){
				$("#notValidEmail").css("display","inline-block");
				return false;
			}else{
				$("#notValidEmail").css("display","none");
				return true;
			}
		}
	


<!-- 중복 체크 -->


	
		isIdChecked = false;
		isPhoneChecked = false;
		isNickChecked = false;
		
		/*
		아이디 중복 체크
		*/
		$("#idCheck").click(function(){
			if(!isValidId()){
				//alert("먼저 조건에 맞는 ID를 입력해주세요.")
				swal("먼저 조건에 맞는 ID를 입력해주세요.");
				return;
			}
			$.ajax({
				url: "/main/login/checkId",
				data: {userId : $("#studentId").val()},//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					console.log(data);
					if(data=="true"){
						//alert("이미 존재하는 아이디입니다.");
						swal("이미 존재하는 아이디입니다.");
// 						$('.idCheck_fail').css("display","inline-block");
// 						$('.idCheck_success').css("display","none");
						return;
					}else{
						//alert("사용 가능한 아이디입니다.");
						swal("사용 가능한 아이디입니다.");
// 						$('.idCheck_success').css("display","inline-block");
// 						$('.idCheck_fail').css("display","none");
						isIdChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					console.log("에러 = ", err);
					//alert(err + "에러 발생");
					swal(err + "에러 발생");
				}
			})//ajax 끝
		}) //function 끝
		
		/*
		핸드폰 번호 중복 체크
		*/
		$("#phoneCheck").click(function(){
			if(!isValidPhone()){
				//alert("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.")
				swal("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.");
				return;
			}
			$.ajax({
				url: "/main/login/checkPhone",
				data: {	userPhone : $("#studentPhone").val()},	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					if(data=="true"){
						//alert("가입한 이력이 있는 번호입니다. 아이디 및 비밀번호 찾기를 이용해주세요.");
						swal("가입한 이력이 있는 번호입니다. 아이디 및 비밀번호 찾기를 이용해주세요.");
// 						$('.phoneCheck_fail').css("display","inline-block");
// 						$('.phoneCheck_success').css("display","none");
						return;
					}else{
						//alert("사용 가능한 번호입니다.");
						swal("사용 가능한 번호입니다.");
// 						$('.phoneCheck_success').css("display","inline-block");
// 						$('.phoneCheck_fail').css("display","none");
						isPhoneChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					//alert(err + "에러 발생");
					swal(err + "에러 발생");
				}
			})
		})
 		
		/*
		아이디, 핸드폰번호, 닉네임 값 변경 시 중복 체크 리셋
		*/
		$("#studentId").keyup(function(){
			isIdChecked = false;
		})
		$("#studentPhone").keyup(function(){
			isPhoneChecked = false;
 		})
 		$("#studentNick").keyup(function(){
 			isNickChecked = false;
 		})

		/*
		비밀번호 일치 여부 체크
		*/
		isSamePwd = false;
		
		$("#studentPwd2").focusout(function(){
			let pwd1 = $("#studentPwd").val();
			let pwd2 = $("#studentPwd2").val();
			
			if(pwd1!="" && pwd2!=""){
				if(pwd1 == pwd2){
					$('.pwdCheck_Fail').css("display", "none");
					$('.pwdCheck_success').css("display", "inline-block");
					isSamePwd = true;
				}else{
					$('.pwdCheck_success').css("display", "none");
					$('.pwdCheck_Fail').css("display", "inline-block");
					isSamePwd = false;
				}
			}else if(pwd1 != "" && pwd2 == ""){
				$('.pwdCheck_success').css("display", "none");
				$('.pwdCheck_Fail').css("display", "none");
				isSamePwd = false;
			}else{
				$('.pwdCheck_success').css("display", "none");
				$('.pwdCheck_Fail').css("display", "none");
				isSamePwd = false;
			}
		})
		
		$("#studentPwd2").focusout(function(){
			let pwd1 = $("#studentPwd").val();
			let pwd2 = $("#studentPwd2").val();
			
			if(pwd1=="" && pwd2!=""){
				$('.pwdCheck_Fail').css("display", "inline-block");
				isSamePwd = false;
			}
			
		})
	})	
	
	$(function(){
		$("#joinForm").submit(function(){			
			/*
			중복체크 여부
			*/
			if(!isIdChecked){
				//alert("ID 중복체크를 진행해주세요.")
				swal("ID 중복체크를 진행해주세요.");
				return false;
			}else if(!isPhoneChecked){
				//alert("핸드폰 번호 중복체크를 진행해주세요")
				swal("핸드폰 번호 중복체크를 진행해주세요");
				return false;
			}else if(!isSamePwd){
				//alert("비밀번호 일치 여부를 확인해주세요.")
				swal("비밀번호 일치 여부를 확인해주세요.");
				return false;
			}
			
			isValidId();
			isValidPwd();
			isValidPhone();
			isValidEmail();
			
			swal("회원가입이 성공적으로 완료되었습니다. 로그인해주세요.")
			
		})
		
	})
</script>
	

</head>
<body>

<div class="main-content">

  <section>
  <div>
	<form id="joinForm" name="joinForm" method="post" action="${pageContext.request.contextPath}/main/login/join" class="row g-3">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	  <h3> 일반 회원가입 </h3><br><br>
	  		<hr>
		  	<!-- 아이디 -->
		    <div class="col-md-2">
		  	</div>
	  	    <div class="col-md-2">
			    <label for="studentId" class="form-label">아이디</label>
		  	</div>
		  	 <div class="col-md-6">
		  	 	<input type="text" id="studentId" class="form-control" name="studentId" placeholder="영소문자+숫자, 최소 6글자 이상 10글자 이하로 입력해주세요." required/>
				<span id="notValidId" class="message" data-bs-toggle="tooltip" data-bs-placement="top" title="ID는 공백 없이 영소문자와 숫자를 조합하여 6글자 이상 10글자 이하로 입력해주세요">ID는 공백 없이 영소문자와 숫자를 조합하여 6글자 이상 10글자 이하로 입력해주세요</span>
				<span id="idCheck_success" class="idCheck_success">사용가능한 ID입니다^^</span>
				<span id="idCheck_fail" class="idCheck_fail">이미 존재하는 ID입니다.</span>
		  	</div>
		  	<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="idCheck">중복체크</button>
			</div>
     		
     		<!-- 비밀번호 -->
  		 	<div class="col-md-2">
			</div>	
     		<div class="col-md-2">
     			<label for="studentPwd" class="form-label">비밀번호</label>
     		</div>
     		<div class="col-md-6">
				<input type="password" id="studentPwd" name="studentPwd" class="form-control" placeholder="영소문자+대문자+숫자, 최소 8글자 이상 입력해주세요." required/>
	      		<span id="notValidPwd" class="message" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span></td>
	      	</div>
	      	<div class="col-md-2">
			</div>	
	      	
	      	<!-- 비밀번호 확인-->	
	      	<div class="col-md-2">
			</div>	
	      	<div class="col-md-2">
     			<label for="studentPwd2" class="form-label">비밀번호 확인</label>
     		</div>	
	      	<div class="col-md-6">
	      		<input type="password" id="studentPwd2" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요." required="required"/><br>
	      		<span id="pwdCheck_success" class="pwdCheck_success">비밀번호가 일치합니다.</span>
			    <span id="pwdCheck_Fail" class="pwdCheck_Fail">비밀번호 일치 여부를 확인해주세요.</span>
	      	</div>
			<div class="col-md-2">
			</div>	
			
			<!-- 이름 -->
			<div class="col-md-2">
			</div>	
			<div class="col-md-2">
			   <label for="studentName" class="form-label">이름</label>
			</div>
			<div class="col-md-6">
				<input type="text" id="studentName" name="studentName" class="form-control" placeholder="" required="required"/>
			</div>
			<div class="col-md-2">
			</div>	
			
			<!-- 휴대폰 번호 -->
			<div class="col-md-2">
			</div>	
			<div class="col-md-2">
			    <label for="studentPhone" class="form-label">휴대폰 번호</label>
		  	</div>
			<div class="col-md-6">
				<input type="text" id="studentPhone" name="studentPhone" class="form-control" placeholder="'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요." required="required"/>
	      		<span id="notValidPhone" class="message" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span>
	      		<span id="phoneCheck_success" class="phoneCheck_success">사용가능한 번호입니다.</span>
			    <span id="phoneCheck_fail" class="phoneCheck_fail">이미 가입한 이력이 있는 번호입니다.</span>
			</div>
			<div class="col-md-2">
				<button type="button" id="phoneCheck" class="btn btn-primary">중복체크</button>
			</div>
	      	
	      	<!-- 이메일 -->	
	      	<div class="col-md-2">
			</div>	
	      	<div class="col-md-2">
	      		<label for="studentEmail" class="form-label">이메일</label>
	      	</div>
	      	<div class="col-md-6">
	      		<input type="text" id="studentEmail" name="studentEmail" class="form-control" required="required"/>
	      		<span id="notValidEmail" class="message" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">올바른 이메일 주소가 아닙니다.</span>
	      	</div>
      		<div class="col-md-2">
			</div>	
	      	
	      	<br><br>
	    	<hr>
	      	<!-- 버튼 -->
		  	<div class=".col-6 .col-sm-4 text-center">
		  		<input type="submit" id="joinBtn" class="btn btn-primary" value="회원가입">
		  	</div>
	</form>
</div>
  </section>
</div>

</body>
</html>