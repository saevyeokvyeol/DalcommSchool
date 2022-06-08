<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


	.idCheck_success, .pwdCheck_success, .phoneCheck_success, .phoneCheck_success {
		color: blue;
		display: none;
	}
	.idCheck_fail, .pwdCheck_Fail, .phoneCheck_fail, .notValidEmail, .phoneCheck_fail {
		color:red;
		display: none;
	}
	
	.id, .name { 
		background-color: #D3D3D3;
	}

</style>



<script type="text/javascript">


$(function(){
	
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
	핸드폰 번호 중복 체크
	*/
	$("#phoneCheck").click(function(){
		if(!isValidPhone()){
			alert("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.")
			return;
		}
		$.ajax({
			url: "/main/login/checkPhone",
			data: {	userPhone : $("#studentPhone").val()},	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
			dataType: "text",
			success: function(data){
				if(data=="true"){
					alert("가입한 이력이 있는 번호입니다. 아이디 및 비밀번호 찾기를 이용해주세요.");
					$('.phoneCheck_fail').css("display","inline-block");
					$('.phoneCheck_success').css("display","none");
					return;
				}else{
					alert("사용 가능한 번호입니다.");
					$('.phoneCheck_success').css("display","inline-block");
					$('.phoneCheck_fail').css("display","none");
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
		
		$(function(){
		$("#updateForm").submit(function(){			
			/*
			중복체크 여부
			*/
			if(!isPhoneChecked){
				alert("핸드폰 번호 중복체크를 진행해주세요")
				return false;
			}
			isValidPhone();
			isValidEmail();
		})	

})	


</script>




</head>
<body>
 <section>
  <sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal" var="student"/>
	<form id="updateForm" name="updateForm" method="post" action="${pageContext.request.contextPath}/main/mypage/modify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		
	  <h1> 학생 회원정보 수정페이지 </h1>
	    <div class="joinNotice"> * 표시가 있는 항목은 필수 항목입니다.</div>
	    <table>
	      <tr>
	          <th>아이디</th>
	          <td class=""><input type="text" id="studentId" class="id" name="studentId" value="${student.studentId}" readonly="readonly"/>

	      </tr>
	      <tr>
	          <th>이름</th>
	          <td><input type="text" id="studentName" name="studentName" class="name" value="${student.studentName}" readonly="readonly"/>
	      </tr>
	      <tr>
	          <th>* 핸드폰 번호</th>
	          <td><input type="text" id="studentPhone" name="studentPhone" class="" value="${student.studentPhone}" />
	          <button type="button" id="phoneCheck" class="">중복체크</button>
	          <span id="notValidPhone" class="notValidPhone">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span><br>
	          <span id="phoneCheck_success" class="phoneCheck_success">사용가능한 번호입니다.</span>
	          <span id="phoneCheck_fail" class="phoneCheck_fail">이미 가입한 이력이 있는 번호입니다.</span></td>
	      </tr>
	      <tr>
	          <th>* 이메일</th>
	          <td><input type="text" id="studentEmail" name="studentEmail" class="" value="${student.studentEmail}" />
	          <span id="notValidEmail" class="notValidEmail">올바른 이메일 주소가 아닙니다.</span></td>
	      </tr>
  	</table>
	  	<div>
	  	<input type="submit" id="updateBtn" value="수정">
	  	<a href="../index.jsp" id="cancelBtn">취소</a>
	  	<a href="${pageContext.request.contextPath}/main/mypage/myPage" id="cancelBtn">뒤로가기</a>
	  	</div>
	</form>
	</sec:authorize>
  </section>
</body>
</html>