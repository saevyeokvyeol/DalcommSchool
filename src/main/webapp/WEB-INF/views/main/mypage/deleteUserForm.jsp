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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>

<style type="text/css">
	
	a{
		text-decoration: none;
	}
	th{
		text-align: center;
		vertical-align: middle;
	}
	
	td{
		vertical-align: middle;
	}
	
	.pwdCheck_success {
		color: blue;
		display: none;
	}
	.pwdCheck_Fail {
		color:red;
		display: none;
	}
	
	.notice text-center {
		line-height: 200%
	}
	
	table {
		line-height: 170%
	}
	
</style>

<script type="text/javascript">
	

	$(function() {
		//var btn = document.getElementById('bt');

		$(document).ready(function(){
			
			  $("#bt").click(function(){
			   
				  if($("#userPwd").val() == ''){
						alert("비밀번호를 입력해주세요");
						return false;
				  }

				$("#staticBackdrop").modal('show');
	 		 });
		});// ready(); 
				  
		  $(document).on("click", "button[name=Withdrawal]", function() {
				  $.ajax({
						url:"${pageContext.request.contextPath}/checkPwd",
						data: { "${_csrf.parameterName}" : "${_csrf.token}", userPwd : $("#userPwd").val() },
						dataType: "text",
						success: function(data) {
							console.log(data);
							if(data=="true"){
								document.deleteInfo.submit();
								return;
							}else{
								//모달 id값 찾기 
								$("#staticBackdrop").modal('hide');
								$(".modal-backdrop.show").remove(); 
								alert("비밀번호 오류로 탈퇴할 수 없습니다.");
								//btn.disabled = 'disabled';
								return;
							}
						}, //success 끝
						error : function(err) {
							console.log("에러 = " , err);
							alert(err + "에러 발생");
						}
				  })//ajax();
		})//Withdrawal;
	}); //function();
	
</script>

</head>
<body>
	<h3>회원 탈퇴</h3>
	<h6>* 회원 탈퇴 신청 전, 탈퇴 사유를 체크해주세요.</h6>
	<h6>* 탈퇴시 고객님께서 소유한 쿠폰, 구매내역 등은 복원 불가합니다.</h6>
	<h6>* 삭제를 원하시는 게시물은 반드시 탈퇴 전 삭제하시기 바랍니다.</h6>
	<h6>* 유의사항 미숙지로 인한 문제 발생시 책임은 본인에게 있습니다.</h6><br>
	<table class="table table-striped">
		<colgroup>
			<col style="width:210px;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">개인정보관련</th>
				<td>
						<li>
							<input type="checkbox"  class="form-check-input" id="a_rd01" name="a_rd" />
							<label for="a_rd01">아이디 변경을 위해 탈퇴 후 재가입</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="a_rd02" name="a_rd" />
							<label for="a_rd02">장기간 부재</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="a_rd03" name="a_rd" />
							<label for="a_rd03">개인정보 누출 우려</label>
						</li>
				</td>
			</tr>
			<tr>
				<th scope="row">사이트 이용관련</th>
				<td>
						<li>
							<input type="checkbox" class="form-check-input" id="b_rd01" name="a_rd" />
							<label for="b_rd01">컨텐츠 등 이용할 만한 서비스 부족</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="b_rd02" name="a_rd" />
							<label for="b_rd02">사이트 속도 및 안정성 불만</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="b_rd03" name="a_rd" />
							<label for="b_rd03">사이트 이용 불편</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="b_rd04" name="a_rd" />
							<label for="b_rd04">이용빈도 낮음</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="b_rd05" name="a_rd" />
							<label for="b_rd05">실질적인 혜택 부족</label>
						</li>
				</td>
			</tr>
			<tr>
				<th scope="row">클래스 이용관련</th>
				<td>
						<li>
							<input type="checkbox" class="form-check-input" id="c_rd01" name="a_rd" />
							<label for="c_rd01">클래스의 다양성/품질 불만</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="c_rd02" name="a_rd" />
							<label for="c_rd02">클래스 가격 불만</label>
						</li>
						<li>
							<input type="checkbox" class="form-check-input" id="c_rd05" name="a_rd" />
							<label for="c_rd05">사후조치 불만</label>
						</li>
				</td>
			</tr>
		</tbody>
	</table><br>
	
	<!--       -----------------------------탈퇴 폼------------------------------------         -->
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="student"/>
	<div class="text-center"><h6><b>마지막으로, 회원 탈퇴를 위한 고객님의 회원 정보를 입력해 주세요.</b></h6></div><br>
		<form id="delete" name="deleteInfo" action="${pageContext.request.contextPath}/main/mypage/deleteUser" method="post" class="row g-3">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
			<input type="hidden" id="userId" name="userId" value="${student.studentId}" />
			
			<div class="col-md-2">
			</div>	
     		<div class="col-md-2">
     			<label for="password" class="form-label">비밀번호</label>
     		</div>
     		<div class="col-md-6">
				<input type="password" id="userPwd" name="userPwd" class="form-control" required="required"/>
	      	</div>
	      	<div class="col-md-2">
			</div>	
		</form>
<!-- 					<tr> -->
<!-- 						<th scope="row">비밀번호 확인</th> -->
<!-- 						<td><input type="password" id="userPwd2" name="userPwd2" required="required"/><br> -->
<!-- 						 <span id="pwdCheck_success" class="pwdCheck_success">비밀번호가 일치합니다.</span> -->
<!-- 	      	  			<span id="pwdCheck_Fail" class="pwdCheck_Fail">비밀번호 일치 여부를 확인해주세요.</span></td> -->
<!-- 					</tr> -->

	    <br><br>
  <!-- ----------------------------- 탈퇴하기 버튼 ------------------------ -->
	<div class=".col-6 .col-sm-4 text-center">
	    <button type="button" class="btn btn-primary" id="bt">탈퇴하기</button>
	</div>
	
		<input type="hidden" id="contents" name="contents" value=""  />
		<input type="hidden" id="userid" name="userid" value=""  />

	 <!-- ------------------------------------------모달------------------------------- -->
	 
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">회원 탈퇴</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       정말 탈퇴하시겠습니까?<br>
		       * 탈퇴 신청 후, 1개월 동안 재가입이 불가능합니다
		      </div>
		      <div class="modal-footer">
		        <button type="button" name="Withdrawal" form="delete" class="btn btn-primary">탈퇴</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
</sec:authorize>
</body>
</html>