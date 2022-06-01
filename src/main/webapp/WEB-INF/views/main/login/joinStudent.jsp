<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";		
		$("joinForm").submit(function(){			
			if($("#joinForm :input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($("#joinForm :input[name=name]").val().trim()==""){
				alert("이름을 입력하세요");				
				return false;
			}
			if($("#joinForm :input[name=pwd]").val().trim()==""){
				alert("패스워드를 입력하세요");				
				return false;
			}
			if($("#joinForm :input[name=phone]").val().trim()==""){
				alert("휴대폰 번호를 입력하세요");				
				return false;
			}	
			if($("#joinForm :input[name=email]").val().trim()==""){
				alert("이메일을 입력하세요");				
				return false;
			}	
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});//submit

	////////////아이디에 한글 입력 불가능 하도록
	function chkCharCode(event) {
		const regExp = /[^0-9a-zA-Z]/g;
		  const ele = event.target;
		  if (regExp.test(ele.value)) {
		    ele.value = ele.value.replace(regExp, '');
		  }
	};
	
	////////////휴대폰 번호에 숫자 이외에는 입력 불가능 하도록
	function chkPhCode(event) {
		const regExp = /[^0-9]/g;
		  const ele = event.target;
		  if (regExp.test(ele.value)) {
		    ele.value = ele.value.replace(regExp, '');
		  }
	};
	</script>

    <script type="text/javascript">
  	//아이디 체크...
	$("#joinForm :input[name=id]").keyup(function(){
		var id=$(this).val().trim();
		//alert(id);
		if(id.length<4 || id.length>10){
			$("#idCheckView").html("4>id length OR id length>10").css("background","pink");
			checkResultId="";
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/idcheckAjax",				
			//data:"${_csrf.parameterName}=${_csrf.token}&id="+id,	
			 data:{
				"${_csrf.parameterName}":"${_csrf.token}"
			} ,
			success:function(data){						
				if(data=="fail"){
				$("#idCheckView").html("  "+id+" ID Can't Use!! ").css("background","red");
					checkResultId="";
				}else{						
					$("#idCheckView").html("  "+id+" ID Can Use!! ").css("background","yellow");		
					checkResultId=id;
				}					
			}//callback			
		});//ajax
	});//keyup
});//ready
	
</script>
</head>
<body>
	<h2>회원 가입</h2>
	모든 항목을 필수로 입력해주세요.<br>
	<form name="join" method="post" action="${pageContext.request.contextPath}/join" id="joinForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		
		이름&nbsp;<input type="text" id="studentName" name="name"
		placeholder="이름" onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		아이디&nbsp; 영문과 숫자를 조합하여 최소 6자리 이상 <br>
		<input type="text" id="studentId" name="id"
		placeholder="영문과 숫자만 입력가능합니다" onkeyup="chkCharCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()"/><span></span><br>
		
		비밀번호&nbsp; 영문 대소문자, 숫자 조합하여 8자리 이상 <input type="password"id="studentPwd" name="pwd"
		onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		비밀번호 확인&nbsp; 영문 대소문자, 숫자 조합하여 8자리 이상 <input type="password"id="studentPwd" name="pwdCk"
		onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		휴대폰번호 <input type="text" id="studentPhone" name="phone"
		placeholder="ex)01012345678" onkeyup="chkPhCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		이메일 주소 <input type="text" id="studentEmail" name="email"placeholder="이메일주소를 입력하세요"/><br>
		<input type="submit" class="btn btn-default" value="가입">
	</form>

</body>
</html>