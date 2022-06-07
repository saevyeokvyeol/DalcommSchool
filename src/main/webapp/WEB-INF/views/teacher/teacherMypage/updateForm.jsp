<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
<!--------------------------유효성 체크-------------------------->	
	/*
	핸드폰 번호 유효성 체크
	*/
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
	}//isValidPhone() 끝
	
	
	/*
	이메일 유효성 체크
	*/
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
	}//isValidEmail() 끝
	
	
	
<!--------------------------중복체크-------------------------->
	
	isPhoneChecked=true;
	isNickChecked=true;
	
	$("#teacherPhone").keyup(function(){
		isPhoneChecked=false;
	})
	$("#teacherNick").keyup(function(){
		isNickChecked=false;
	})
	
	/*
	핸드폰 번호 중복체크
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
	닉네임 중복체크
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
		if(!isNickChecked){
			alert("닉네임 중복체크를 진행해주세요")
			event.preventDefault();
		}else if(!isPhoneChecked){
			alert("핸드폰 번호 중복체크를 진행해주세요")
			event.preventDefault();
		}else if(!isValidPhone()){
			alert("핸드폰 번호를 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}else if(!isValidEmail()){
			alert("이메일을 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}
	})
})

</script>
<title>강사 회원정보 수정 페이지입니다.</title>
</head>
<body>
<h1> 강사정보 수정~ </h1>
<section>
	<form id="updateForm" name="updateForm" method="post" action="${pageContext.request.contextPath}/teacher/teacherMypage/updateTeacher">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	    <div class="joinNotice"> * 표시가 있는 항목은 필수 항목입니다.</div>
	    <table>
	      <tr>
	          <th>강사 ID</th>
	          <td class=""><b>${teacher.teacherId}</b></td>
	      </tr>
	      <tr>
	          <th>강사 비밀번호</th>
	          <td><a href="${pageContext.request.contextPath}/main/mypage/modifyPwd">비밀번호 수정하러 가기</a></td>
	      </tr>
	      <tr>
	          <th>강사 이름</th>
	          <td><b>${teacher.teacherName}</b></td>
	      </tr>
	      <tr>
	          <th>강사 닉네임</th>
	          <td><input type="text" id="teacherNick" name="teacherNickname" class="" value="${teacher.teacherNickname}" placeholder="달콤스쿨에서 보여지는 강사님의 닉네임을 입력해주세요." required/>
	          <button type="button" id="nickCheck" class="">중복체크</button>
	          <span id="nickCheck_success" class="message">사용가능한 닉네임입니다^^</span></td>
	          <span id="nickCheck_fail" class="message">이미 존재하는 닉네임입니다.</span></td>
	      </tr>
	      <tr>
	          <th>강사 핸드폰 번호</th>
	          <td><input type="text" id="teacherPhone" name="teacherPhone" class="" value="${teacher.teacherPhone}" placeholder="'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요." required/>
	          <button type="button" id="phoneCheck" class="">중복체크</button>
	          <span id="notValidPhone" class="message">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span>
	          <span id="phoneCheck_success" class="message">사용가능한 번호입니다.</span></td>
	          <span id="phoneCheck_fail" class="message">이미 가입한 이력이 있는 번호입니다.</span></td>
	      </tr>
	      <tr>
	          <th>강사 공개 연락처</th>
	          <td><input type="text" id="teacherNick" class="" name="teacherTel" value="${teacher.teacherTel}" placeholder="달콤스쿨에서 보여지는 강사님의 번호를 입력해주세요." /></td>
	      </tr>
	      <tr>
	          <th>강사 이메일</th>
	          <td><input type="text" id="teacherEmail" name="teacherEmail" class="" required/>
	          <span id="notValidEmail" class="message">올바른 이메일 주소가 아닙니다.</span></td>
	      </tr>
	  	</table>
	  	<div>
	  	<input type="submit" id="joinBtn" value="회원가입">
	  	<a href="../board.jsp" id="cancelBtn">취소</a>
	  	</div>
	</form>
  </section>
</body>
</html>