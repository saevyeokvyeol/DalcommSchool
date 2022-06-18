<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 강사 회원가입 페이지입니다.</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jQuery ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery ui -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />



<style type="text/css">

	.pwdCheck_success {
		font-size: 14px;
		color: #00944a;
		display: none;
		padding: 20px;
	}
	.pwdCheck_Fail {
		font-size: 14px;
		color: #f85656;
		display: none;
		padding: 20px;
		
	}
	
	span{
		font-size: 14px;
		padding: 4px 10px;
		color: #f85656;
	
	}
	
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
			var isUpper = id.search(/[A-Z]/g); // -1 리턴해야함.
			var isSpace = id.search(/\s/); //공백 있는지 확인. 없으면 -1. -> -1 리턴해야함.
			var specialChar = id.search(/[~!@#$%^&*?\|=]/gi); //특수문자 있는지 확인. -> -1리턴해야함
			var isKorean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); // -1리턴해야함.
			
			if(id.length<6 || id.length>10){ //길이 체크
				$("#notValidId").css("display", "inline-block");
				return false;
			}else if(!checkLow.test(id)){ //영소문자 체크  --> 확인해봐야함.
				$("#notValidId").css("display", "inline-block");
				return false;
			}else if(isNum<0 || isUpper!=-1 || isSpace!=-1 || specialChar!=-1 || isKorean!= -1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
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
// 				swal("false")
				return false;
			}else if(isNum<0 || isUp<0 || isLow<0 || isSpace!=-1 || specialChar!=-1 || isKorean!=-1){ //숫자, 영대문자, 공백, 특수문자, 한글 체크
				$("#notValidPwd").css("display", "inline-block");
// 				swal("false")
				return false;
			}else{
				$("#notValidPwd").css("display", "none");
// 				swal("true")
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
				swal("먼저 조건에 맞는 ID를 입력해주세요.")
				return;
			}
			$.ajax({
				url: "/main/login/checkId",
				data: {userId : $("#teacherId").val()},//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					console.log(data);
					if(data=="true"){
						swal("이미 존재하는 아이디입니다.");
						return;
					}else{
						swal("사용 가능한 아이디입니다.");
						isIdChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					console.log("에러 = ", err);
					swal(err + "에러 발생");
				}
			})//ajax 끝
		}) //function 끝
		
		/*
		핸드폰 번호 중복 체크
		*/
		$("#phoneCheck").click(function(){
			if(!isValidPhone()){
				swal("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.")
				return;
			}
			$.ajax({
				url: "/main/login/checkPhone",
				data: {	userPhone : $("#teacherPhone").val()},	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
				dataType: "text",
				success: function(data){
					if(data=="true"){
						swal("가입한 이력이 있는 번호입니다. \n 아이디 및 비밀번호 찾기를 이용해주세요.");
						return;
					}else{
						swal("사용 가능한 번호입니다.");
						isPhoneChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					swal(err + "에러 발생");
				}
			})
		})
		
 		/*
 		닉네임 중복 체크
 		*/
		$("#nickCheck").click(function(){
			
			
			if($("#teacherNick").val()==""){
				swal("닉네임을 입력해주세요.");
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
						swal("사용 중인 닉네임입니다.");
						return;
					}else{
						swal("사용 가능한 닉네임입니다.");
						isNickChecked = true;
						return;
					}
				}, //success 끝
				error: function(err){
					swal(err + "에러 발생");
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
 		$("#teacherPwd").keyup(function(){
			isSamePwd = false;
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
		
		$("#insertForm").submit(function(event){
			/*
			중복체크 여부
			*/
			if(!isIdChecked){
				swal("ID 중복체크를 진행해주세요.")
				event.preventDefault();
				return false;
			}else if(!isNickChecked){
				swal("닉네임 중복체크를 진행해주세요")
				event.preventDefault();
				return false;
			}else if(!isPhoneChecked){
				swal("핸드폰 번호 중복체크를 진행해주세요")
				event.preventDefault();
				return false;
			}else if(!isSamePwd){
				swal("비밀번호 일치 여부를 확인해주세요.")
				event.preventDefault();
				return false;
			}
			
			if(!isValidPwd()){
				swal("비밀번호를 형식에 맞게 입력해주세요.");
				event.preventDefault();
				return false;
			}else if(!isValidId()){
// 				swal("아이디를 형식에 맞게 입력해주세요.");
				event.preventDefault();
			}else if(!isValidPhone()){
// 				swal("핸드폰 번호를 형식에 맞게 입력해주세요.");
				event.preventDefault();
			}else if(!isValidEmail()){
// 				swal("이메일을 형식에 맞게 입력해주세요.");
				event.preventDefault();
			}	 
			
			swal("달콤스쿨 회원가입 완료", "가입하신 계정으로 로그인 후 이용해주세요", "success");
		})
	})	
	
</script>
<script type="text/javascript">
	function setThumbnail(event){
		var reader=new FileReader();
		
		reader.onload=function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#image_container").appendChild(img);
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

</head>
<body>

<div class="main-content">


  <section>
	<form id="insertForm" name="insertForm" method="post" class="row g-3" enctype="multipart/form-data" action="${pageContext.request.contextPath}/main/login/insert?${_csrf.parameterName}=${_csrf.token}">
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	    <h3> 강사 회원가입 </h3><br><br>
	    <hr>
	    
	    <table id="classTable">
	    <br><br>
	    <tr>
	    	<td>
	    		<!-- 아이디 -->
		    	<div class="row g-3">
		  				<div class="col-md-2">
		  				</div>
						<div class="col-md-8">
							<div class="form-floating mb-3">
			    			<input type="text" id="teacherId" class="form-control" name="teacherId" placeholder="아이디" required/>
			    			<label for="teacherId">아이디</label>
			    				<span id="notValidId" class="message"><i class="fa-solid fa-circle-exclamation"></i>&ensp; 공백 없이 영소문자와 숫자를 조합하여 6글자 이상 10글자 이하로 입력해주세요</span>
			    			</div>
		    			</div>
		    			<div class="col-md-2">
		    				<button type="button" class="btn btn-primary" id="idCheck">중복체크</button>
		    			</div>
	    		</div>
	    	</td>
	    </tr>
	    
    	<!-- 비밀번호 -->
	    <tr>
	    	<td>
	    	<div class="row g-3">
		    	<div class="col-md-2">
				</div>
		    	<div class="col-md-8">
			    	<div class="form-floating mb-3">
				    	<input type="password" id="teacherPwd" name="teacherPwd" class="form-control" placeholder="비밀번호" required/>
				    	<label for="teacherPwd">비밀번호</label>
				    		<span id="notValidPwd" class="message">비밀번호는 공백 없이 영소문자,대문자,숫자를 조합하여 8글자 이상으로 입력해주세요</span>
			    	</div>
		    	</div>
		    	<div class="col-md-2">
				</div>
	    	</div>
	    	</td>
	    </tr>
	    
    	<!-- 비밀번호 확인 -->
	    <tr>
	    	<td>
				<div class="row g-3">
		  			<div class="col-md-2">
	  				</div>
		    		<div class="col-md-8">
			  		<div class="form-floating mb-3">
			    		<input type="password" id="teacherPwd2" name="teacherPwd2" class="form-control" placeholder="비밀번호 확인" required/>
			    		<label for="studentPwd2">비밀번호 확인</label>
			    	</div>	
		    		</div>
		    		<div class="col-md-2">
		  				<span id="pwdCheck_success" class="pwdCheck_success"><i class="fa-solid fa-circle-check fa-2xl"></i></span>
					    <span id="pwdCheck_Fail" class="pwdCheck_Fail"><i class="fa-solid fa-triangle-exclamation fa-2xl"></i></span>
					</div>
		    	</div>
	    	</td>
	    </tr>
	    <!-- 이름 -->
	    <tr>
	    	<td>
		    	<div class="row g-3">
		  			<div class="col-md-2">
	  				</div>
		    		<div class="col-md-8">
			  		<div class="form-floating mb-3">
    					<input type="text" id="teacherName" name="teacherName" class="form-control" placeholder="이름" required="required"/>
    					<label for="teacherName">이름</label>
   					</div>
   					</div>
 					<div class="col-md-2">
					</div>
				</div>
	    	</td>
	    </tr>
	    
	    <!-- 닉네임 -->
	    <tr>
	    	<td>
	    	<div class="row g-3">
		  			<div class="col-md-2">
	  				</div>
		    		<div class="col-md-8">
				  		<div class="form-floating mb-3">
							<input type="text" id="teacherNick" name="teacherNickname" class="form-control" placeholder="닉네임" required="required"/>
					  		<label for="teacherNick">닉네임</label>
				  			<span id="nickCheck_success" class="message">사용가능한 닉네임입니다^^</span>
							<span id="nickCheck_fail" class="message">이미 존재하는 닉네임입니다.</span>
				  		</div>
			  		</div>
	    			<div class="col-md-2">
	    				<button type="button" id="nickCheck" class="btn btn-primary">중복체크</button>
	    			</div>
    			</div>
	    	</td>
	    </tr>

	    <!-- 휴대폰 번호 -->
	    <tr>
		    <td>
			    <div class="row g-3">
		  			<div class="col-md-2">
	  				</div>
		    		<div class="col-md-8">
			  		<div class="form-floating mb-3">
	    				<input type="text" id="teacherPhone" name="teacherPhone" class="form-control" placeholder="휴대폰 번호" required="required"/>
	    				<label for="teacherPhone">휴대폰 번호</label>
    						<span id="notValidPhone" class="message">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span>
   					</div>
   					</div>
   					<div class="col-md-2">
   						<button type="button" id="phoneCheck" class="btn btn-primary">중복체크</button>
   					</div>
				</div>
		    </td>
	    </tr>
	    
	    <!-- 이메일 -->
	    <tr>
	    	<td>
		    	<div class="row g-3">
		  			<div class="col-md-2">
		  			</div>
					<div class="col-md-8">
			  		<div class="form-floating mb-3">
		    			<input type="text" id="teacherEmail" name="teacherEmail" class="form-control" placeholder="이메일" required="required"/>
		    			<label for="teacherEmail">이메일</label>
		    			<span id="notValidEmail" class="message">올바른 이메일 주소가 아닙니다.</span>
		    		</div>
		    		</div>
	 			  	<div class="col-md-2">
		  			</div>
		  		</div>	
	    	</td>
	    </tr>
    </table>
	   
	    <!-- 버튼 -->
	    <div class=".col-6 .col-sm-4 text-center">
	  		<input type="submit" id="joinBtn" class="btn btn-primary" value="회원가입">
	  	</div>
	</form>
  </section>
</div>
</body>
</html>