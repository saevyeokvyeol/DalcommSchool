<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 강사 회원가입 페이지입니다.</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
      
<!-- jQuery ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery ui -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style type="text/css">

	.message{display: none}
	
</style>


<!-- 형식 체크 (진행 중) -->
<script type = "text/javascript">
	
	$(function(){
		/*
		아이디 형식 체크
		*/
		$("#teacherId").focusout(function(){
			isValidId();
		})
		
		function isValidId(){
			var id = $("#teacherId").val();
			
			var isNum = id.search(/[0-9]/g); //숫자 있는지 확인. 있으면 index 리턴. 없으면 -1. -> -1이면 안됨.
			var checkLow = /[a-z]/; //영소문자인지 확인 -> true를 반환해야함.
			var isSpace = id.search(/\s/); //공백 있는지 확인. 없으면 -1. -> -1 리턴해야함.
			var specialChar = id.search(/[~!@#$%^&*?\|=]/gi); //특수문자 있는지 확인. -> -1리턴해야함
			var isKorean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); // -1리턴해야함.
			
			if(id.length<6 || id.length>10){ //길이 체크
				$("#notValidId").css("display", "inline-block");
				return false;
			}else if(!checkLow.test(id)){ //영소문자 체크  --> 확인해봐야함.
				$("#notValidId").css("display", "inline-block");
				return false;
			}else if(isNum<0 || isSpace!=-1 || specialChar!=-1 || isKorean!= -1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
				$("#notValidId").css("display", "inline-block");
				return false;
			}else{
				$("#notValidId").css("display", "none");
				return true;
			}
		}
		
		/*
		비밀번호 형식 체크
		*/
		$("#teacherPwd").focusout(function(){
			isValidPwd();
		})
		
		function isValidPwd(){
			var id = $("#teacherPwd").val();
			
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
		$("#teacherPhone").focusout(function(){
			isValidPhone();
		})
		
		function isValidPhone(){
			var phone = $("#teacherPhone").val();
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
		$("#teacherEmail").focusout(function(){
			isValidEmail();
		})
		
		function isValidEmail(){
			var email = $("#teacherEmail").val();
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
				alert("먼저 조건에 맞는 ID를 입력해주세요.")
				return;
			}
			$.ajax({
				url: "/main/login/checkId",
				data: {userId : $("#teacherId").val()},//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					console.log(data);
					if(data=="true"){
						alert("이미 존재하는 아이디입니다.");
						return;
					}else{
						alert("사용 가능한 아이디입니다.");
						isIdChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					console.log("에러 = ", err);
					alert(err + "에러 발생");
				}
			})//ajax 끝
		}) //function 끝
		
		/*
		핸드폰 번호 중복 체크
		*/
		$("#phoneCheck").click(function(){
			if(!isValidPhone()){
				alert("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.")
				return;
			}
			$.ajax({
				url: "/main/login/checkPhone",
				data: {	userPhone : $("#teacherPhone").val()},	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					if(data=="true"){
						alert("가입한 이력이 있는 번호입니다. 아이디 및 비밀번호 찾기를 이용해주세요.");
						return;
					}else{
						alert("사용 가능한 번호입니다.");
						isPhoneChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					alert(err + "에러 발생");
				}
			})
		})
		
 		/*
 		닉네임 중복 체크
 		*/
		$("#nickCheck").click(function(){
			
			
			if($("#teacherNick").val()==""){
				alert("닉네임을 입력해주세요.");
				return;
			}
			$.ajax({
				url: "/main/login/checkNick",
				data: {
					teacherNick : $("#teacherNick").val()	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				},
				dataType: "text",
				success: function(data){
					if(data=="true"){
						alert("사용 중인 닉네임입니다.");
						return;
					}else{
						alert("사용 가능한 닉네임입니다.");
						isNickChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					alert(err + "에러 발생");
				}
			})			
		})
		
			
		/*
		아이디, 핸드폰번호, 닉네임 값 변경 시 중복 체크 리셋
		*/
		$("#teacherId").keyup(function(){
			isIdChecked = false;
		})
		$("#teacherPhone").keyup(function(){
			isPhoneChecked = false;
 		})
 		$("#teacherNick").keyup(function(){
 			isNickChecked = false;
 		})

		/*
		비밀번호 일치 여부 체크
		*/
		isSamePwd = false;
		
		$("#teacherPwd2").focusout(function(){
			let pwd1 = $("#teacherPwd").val();
			let pwd2 = $("#teacherPwd2").val();
			
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
		
		$("#teacherPwd2").focusout(function(){
			let pwd1 = $("#teacherPwd").val();
			let pwd2 = $("#teacherPwd2").val();
			
			if(pwd1=="" && pwd2!=""){
				$("#pwdCheck_Fail").css("display", "inline-block");
				isSamePwd = false;
			}
			
		})
	})	
	
	$(function(){
		$("#insertForm").submit(function(){			
			/*
			중복체크 여부
			*/
			if(!isIdChecked){
				alert("ID 중복체크를 진행해주세요.")
				return false;
			}else if(!isNickChecked){
				alert("닉네임 중복체크를 진행해주세요")
				return false;
			}else if(!isPhoneChecked){
				alert("핸드폰 번호 중복체크를 진행해주세요")
				return false;
			}else if(!isSamePwd){
				alert("비밀번호 일치 여부를 확인해주세요.")
				return false;
			}
			
			isValidId();
			isValidPwd();
			isValidPhone();
			isValidEmail();
		})
		
	})
</script>

</head>
<body>
<h1> 강사 회원가입 </h1>
  <section>
	<form id="insertForm" name="insertForm" method="post" action="${pageContext.request.contextPath}/main/login/insert">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	    <div class="joinNotice"> * 표시가 있는 항목은 필수 항목입니다.</div>
	    <table>
	      <tr>
	          <th>* 강사 ID</th>
	          <td class=""><input type="text" id="teacherId" class="" name="teacherId" placeholder="영소문자와 숫자를 조합하여 최소 6자리 이상 10글자 이하로 입력해주세요." required/>
	          <button type="button" class="" id="idCheck">중복체크</button>
	          <span id="notValidId" class="message">ID는 공백 없이 영소문자와 숫자를 조합하여 6글자 이상 10글자 이하로 입력해주세요</span>
	          <span id="idCheck_success" class="message">사용가능한 ID입니다^^</span></td>
	          <span id="idCheck_fail" class="message">이미 존재하는 ID입니다.</span></td>
	      </tr>
	      <tr>
	          <th>* 강사 비밀번호</th>
	          <td class=""><input type="password" id="teacherPwd" name="teacherPwd" class="" placeholder="영소문자,대문자,숫자를 조합하여 최소 8자리 이상 입력해주세요." required/>
	          <span id="notValidPwd" class="message">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span></td>
	      </tr>
	      <tr>
	      	  <th>* 강사 비밀번호 확인</th>
	      	  <td><input type="password" id="teacherPwd2" class="" placeholder="비밀번호를 한번 더 입력해주세요." required="required"/>
	      	  <span id="pwdCheck_success" class="message">비밀번호가 일치합니다.</span>
	      	  <span id="pwdCheck_Fail" class="message">비밀번호 일치 여부를 확인해주세요.</span></td>
	      </tr>
	      <tr>
	          <th>* 강사 이름</th>
	          <td><input type="text" id="teacherName" name="teacherName" class="" placeholder="" required="required"/>
	      </tr>
	      <tr>
	          <th>* 강사 닉네임</th>
	          <td><input type="text" id="teacherNick" name="teacherNickname" class="" placeholder="달콤스쿨에서 보여지는 강사님의 닉네임을 입력해주세요." required="required"/>
	          <button type="button" id="nickCheck" class="">중복체크</button>
	          <span id="nickCheck_success" class="message">사용가능한 닉네임입니다^^</span></td>
	          <span id="nickCheck_fail" class="message">이미 존재하는 닉네임입니다.</span></td>
	      </tr>
	      <tr>
	          <th>* 강사 핸드폰 번호</th>
	          <td><input type="text" id="teacherPhone" name="teacherPhone" class="" placeholder="'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요." required="required"/>
	          <button type="button" id="phoneCheck" class="">중복체크</button>
	          <span id="notValidPhone" class="message">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span>
	          <span id="phoneCheck_success" class="message">사용가능한 번호입니다.</span></td>
	          <span id="phoneCheck_fail" class="message">이미 가입한 이력이 있는 번호입니다.</span></td>
	      </tr>
	      <tr>
	          <th>강사 공개 연락처</th>
	          <td><input type="text" id="teacherNick" class="" name="teacherTel" placeholder="달콤스쿨에서 보여지는 강사님의 번호를 입력해주세요." /></td>
	      </tr>
	      <tr>
	          <th>*강사 이메일</th>
	          <td><input type="text" id="teacherEmail" name="teacherEmail" class="" required="required"/>
	          <span id="notValidEmail" class="message">올바른 이메일 주소가 아닙니다.</span></td>
	      </tr>
	  	</table>
	  	<div>
	  	<input type="submit" id="joinBtn" value="회원가입">
	  	<a href="../index.jsp" id="cancelBtn">취소</a>
	  	</div>
	</form>
  </section>
</body>
</html>