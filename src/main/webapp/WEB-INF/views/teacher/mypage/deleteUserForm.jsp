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
	
</style>

<script type="text/javascript">

	$(function() {
// 		alert("확인!!!")
		
// 		//비밀번호 일치 여부
// 		isSamePwd = false;
		
// 		$("#userPwd2").focusout(function(){
// 			let pwd1 = $("#userPwd").val();
// 			let pwd2 = $("#userPwd2").val();
			
// 			if(pwd1!="" && pwd2!=""){
// 				if(pwd1 == pwd2){
// 					$('.pwdCheck_Fail').css("display", "none");
// 					$('.pwdCheck_success').css("display", "inline-block");
// 					isSamePwd = true;
// 				}else{
// 					$('.pwdCheck_success').css("display", "none");
// 					$('.pwdCheck_Fail').css("display", "inline-block");
// 					isSamePwd = false;
// 				}
// 			}else if(pwd1 != "" && pwd2 == ""){
// 				$('.pwdCheck_success').css("display", "none");
// 				$('.pwdCheck_Fail').css("display", "none");
// 				isSamePwd = false;
// 			}else{
// 				$('.pwdCheck_success').css("display", "none");
// 				$('.pwdCheck_Fail').css("display", "none");
// 				isSamePwd = false;
// 			}
// 		})
		
// 		$("#userPwd2").focusout(function(){
// 			let pwd1 = $("#userPwd").val();
// 			let pwd2 = $("#userPwd2").val();
			
// 			if(pwd1=="" && pwd2!=""){
// 				$('.pwdCheck_Fail').css("display", "inline-block");
// 				isSamePwd = false;
// 			}
// 		})
		
		
		$(document).ready(function(){
			  $("#bt").click(function(){
			   
				  if($("#userPwd").val() == ''){
					  alert("비밀번호를 입력해주세요");
					  return false;

				  }
				  
// 				  if($("#userPwd2").val() == ''){
// 					  alert("비밀번호를 확인해주세요");
// 					  return false;

// 				  }
		 	 });
		});// ready(); 

	}); //function();
	
</script>

<script type="text/javascript">

		function clickDel(deleteInfo) {
			deleteInfo.action = "${pageContext.request.contextPath}/main/mypage/deleteUser";
			deleteInfo.method = "post";
			deleteInfo.submit();
		}

</script>

</head>
<body>

<div id="sidebar-content">
	<h3 class="h3tit01">회원 탈퇴</h3>
	<h6>* 회원 탈퇴 신청 전, 탈퇴 사유를 체크해주세요.</h6>
	<table class="table">
		<colgroup>
			<col style="width:210px;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">개인정보관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="a_rd01" name="a_rd" />
							<label for="a_rd01">아이디 변경을 위해 탈퇴 후 재가입</label>
						</li>
						<li>
							<input type="radio" id="a_rd02" name="a_rd" />
							<label for="a_rd02">장기간 부재</label>
						</li>
						<li>
							<input type="radio" id="a_rd03" name="a_rd" />
							<label for="a_rd03">개인정보 누출 우려</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row">사이트 이용관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="b_rd01" name="a_rd" />
							<label for="b_rd01">컨텐츠 등 이용할 만한 서비스 부족</label>
						</li>
						<li>
							<input type="radio" id="b_rd02" name="a_rd" />
							<label for="b_rd02">사이트 속도 및 안정성 불만</label>
						</li>
						<li>
							<input type="radio" id="b_rd03" name="a_rd" />
							<label for="b_rd03">사이트 이용 불편</label>
						</li>
						<li>
							<input type="radio" id="b_rd04" name="a_rd" />
							<label for="b_rd04">이용빈도 낮음</label>
						</li>
						<li>
							<input type="radio" id="b_rd05" name="a_rd" />
							<label for="b_rd05">실질적인 혜택 부족</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row">클래스 이용관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="c_rd01" name="a_rd" />
							<label for="c_rd01">클래스의 다양성/품질 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd02" name="a_rd" />
							<label for="c_rd02">클래스 가격 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd05" name="a_rd" />
							<label for="c_rd05">사후조치 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd06" name="a_rd" />
							<label for="c_rd06">탈퇴사유 직접 입력(기타)</label>
                            <textarea cols="20" rows="5" id="out_etc" name="out_etc"  style="width:574px; height:96px; padding:5px; background:#fff; border:1px solid #000000; display:none"></textarea>
						</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="bk_box mgt60">아래 체크 리스트에 전부 동의를 해주셔야 회원 탈퇴가 진행됩니다. 꼼꼼히 읽고 체크박스에 체크해주세요.</div>
	<ul class="gsm_list">
		<li>
			<div class="gsm_left">
				<span>회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며,<br />이후 영구적으로 사용이 중지되므로 새로운 아이디로만 재가입이 가능합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<span>회원 탈퇴 신청 후, 1개월 동안 재가입이 불가능합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<span>고객님께서 소유한 쿠폰, 구매내역 등은 복원 불가합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<span>사이트 게시판에 등록된 게시물은 탈퇴 후에도 삭제되지 않습니다.<br />게시물 등의 삭제를 원하시는 경우에는 반드시 탈퇴 전 삭제하시기 바랍니다.</span>
			</div>
		</li>
	</ul>
	<hr>
	
	<!--       -----------------------------탈퇴 폼------------------------------------         -->
	
	<div class="bk_box mgt60">마지막으로, 회원 탈퇴를 위한 고객님의 회원 정보를 입력해 주세요.</div><br>
	<div class="ad_box">
		<div class="ad_tbl_box">
		<sec:authorize access="isAuthenticated()">
 		<sec:authentication property="principal" var="teacher"/>
		<form id="delete" name="deleteInfo" action="${pageContext.request.contextPath}/main/mypage/deleteUser" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
			<table>
				<colgroup>
					<col style="width:160px;" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<td class="id"><input type="hidden" id="userId" name="userId" value="${teacher.teacherId}" /><span></span></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" id="userPwd" name="userPwd" required="required"/></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th scope="row">비밀번호 확인</th> -->
<!-- 						<td><input type="password" id="userPwd2" name="userPwd2" required="required"/><br> -->
<!-- 						 <span id="pwdCheck_success" class="pwdCheck_success">비밀번호가 일치합니다.</span> -->
<!-- 	      	  			<span id="pwdCheck_Fail" class="pwdCheck_Fail">비밀번호 일치 여부를 확인해주세요.</span></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
	    </form><br><br>
	    
  <!-- ----------------------------- 탈퇴하기 버튼 ------------------------ -->
	    <button type="button" class="btn btn-primary" id="bt" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="deleteCheck()">탈퇴하기</button>
		<input type="reset" value="나가기">
		</sec:authorize>
		</div>
	</div>
		<input type="hidden" id="contents" name="contents" value=""  />
		<input type="hidden" id="userid" name="userid" value=""  />
	</div>

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
		        <button type="button" class="btn btn-primary" onclick="clickDel(deleteInfo)">탈퇴</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>

</body>
</html>