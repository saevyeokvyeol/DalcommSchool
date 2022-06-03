<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
      
<!-- jQuery ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery ui -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	<form name="join" method="post" action="${pageContext.request.contextPath}/main/login/join" id="joinForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		
		
		아이디&nbsp; 영문과 숫자를 조합하여 최소 6자리 이상 <br>
		<input type="text" id="studentId" name="studentId"
		placeholder="영문과 숫자만 입력가능합니다" onkeyup="chkCharCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()"/><span></span><br>
		
		비밀번호&nbsp; 영문 대소문자, 숫자 조합하여 8자리 이상 <input type="password" id="studentPwd" name="studentPwd"
		onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		<!--비밀번호 확인&nbsp; 영문 대소문자, 숫자 조합하여 8자리 이상 <input type="password"id="studentPwd" name="pwdCk"
		onKeyDown="if(event.keyCode == 13) joinCheck()"/><br> -->
		
		이름&nbsp;<input type="text" id="studentName" name="studentName"
		placeholder="이름" onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		
		휴대폰번호 <input type="text" id="studentPhone" name="studentPhone"
		placeholder="ex)01012345678" onkeyup="chkPhCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()"/><br>
		
		이메일 주소 <input type="text" id="studentEmail" name="studentEmail"placeholder="이메일주소를 입력하세요"/><br>
		<input type="submit" class="btn btn-default" value="가입">
	</form>

</body>
</html>