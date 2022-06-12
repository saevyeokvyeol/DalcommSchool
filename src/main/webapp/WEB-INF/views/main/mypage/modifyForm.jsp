<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Insert title here</title>

<style type="text/css">
	
/* 	h3 { */
/* 		text-align: center; */
/* 	} */

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

/* 	.joinNotice { */
/* 		text-align: center; */
/* 	} */

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
	
	
<!--------------------------중복체크-------------------------->
	
	isPhoneChecked=true;
	
	$("#teacherPhone").keyup(function(){
		isPhoneChecked=false;
	})

	
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
		
	<!--------------------------핸드폰 번호, 이메일 형식 체크 함수 호출-------------------------->	
	
	$("#teacherPhone").focusout(function(){
		isValidPhone();
	})
	
	$("#teacherEmail").focusout(function(){
		isValidEmail();
	})
	
<!--------------------------submit 하기 전 체크-------------------------->	
	
	$("#updateForm").submit(function(event){
		
		/*
		중복체크 여부
		*/
		if(!isPhoneChecked){
			alert("핸드폰 번호 중복체크를 진행해주세요")
			event.preventDefault();
		}else if(!isValidPhone()){
			alert("핸드폰 번호를 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}else if(!isValidEmail()){
			alert("이메일을 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}else{
			alert("회원정보가 수정되었습니다.")
		}
	})
	
});


</script>
</head>
<body>
<div id="sidebar-content">
 <section>
  <sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal" var="student"/>
	<form id="updateForm" name="updateForm" method="post" action="${pageContext.request.contextPath}/main/mypage/modify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		
	  <h3>회원정보 수정</h3>
	    <div class="joinNotice"> * 표시가 있는 항목은 필수 항목입니다.</div><br><hr>
	    <table class="table">
	      <tr>
	          <th>아이디</th>
	          <td><b>${student.studentId}"</b></td>

	      </tr>
	      <tr>
	          <th>이름</th>
	          <td><b>${student.studentName}</b></td>
	      </tr>
	      <tr>
	          <th>* 핸드폰 번호</th>
	          <td><input type="text" id="studentPhone" name="studentPhone" class="" value="${student.studentPhone}" />
	          <button type="button" id="phoneCheck" class="">중복체크</button>
	          <span id="notValidPhone" class="notValidPhone"></span><br>
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
  </div>

  
</body>
</html>