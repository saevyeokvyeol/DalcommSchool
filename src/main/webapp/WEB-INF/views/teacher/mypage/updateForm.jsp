<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style type="text/css">

	.message{display: none; position: fixed;}
	
	.mainFileBtn {
				display: none;
			}
	h6 {
		text-align: left;
	}
	#teacherInfo{
		width: 748px;
		height: 140px;
		resize: none;
	}
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#preview-image").click(function() {
					$("#input-image").click()
				})
				
				function readImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var previewImage = document.getElementById("preview-image")
				            previewImage.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var inputImage = document.getElementById("input-image")
				inputImage.addEventListener("change", e => {
				    readImage(e.target)
				})
			})
		</script>
		
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
			swal("먼저 조건에 맞는 핸드폰 번호를 입력해주세요.")
			return;
		}
		$.ajax({
			url: "/main/login/checkPhone",
			data: {	userPhone : $("#teacherPhone").val()},	//컨트롤러에서 요구하는 항목. 밑에 있는 항목이 아님.	
			dataType: "text",
			success: function(data){
				if(data=="true"){
					swal("가입한 이력이 있는 번호입니다. 아이디 및 비밀번호 찾기를 이용해주세요.");
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
	닉네임 중복체크
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
			swal("닉네임 중복체크를 진행해주세요")
			event.preventDefault();
		}else if(!isPhoneChecked){
			swal("핸드폰 번호 중복체크를 진행해주세요")
			event.preventDefault();
		}else if(!isValidPhone()){
			swal("핸드폰 번호를 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}else if(!isValidEmail()){
			swal("이메일을 형식에 맞게 입력해주세요.");
			event.preventDefault();
		}else{
			swal("회원정보가 수정되었습니다.")
		}
	})
})

</script>
<title>강사 회원 정보 수정 페이지입니다.</title>
</head>
<body>
<div id="main-content">
<br>
<section>
<%--   <sec:authorize access="isAuthenticated()"> --%>
<%--  	<sec:authentication property="principal" var="teacher"/> --%>
	<form id="updateForm" name="updateForm" method="post" class="row g-3" action="${pageContext.request.contextPath}/teacher/mypage/updateTeacher?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	  <table id="classTable">
	    <tr>
			<td>
				<div class="mb-3">
					<div class="profileImgCon">
						<c:choose>
							<c:when test="${teacher.teacherImg == null}">
								<a><img id="preview-image" src="${pageContext.request.contextPath}/img/teacher/Profile.png"></a>
							</c:when>
							<c:otherwise>
								<a><img id="preview-image" src="${pageContext.request.contextPath}/img/teacher/${teacher.teacherImg}"></a>
							</c:otherwise>
						</c:choose>
					</div>
					<input type="file" id="input-image" name="file">
				</div>
			</td>
		</tr>
	      <tr>
	          <td>
		          <div class="form-floating mb-3">
			          <input type="text" id="teacherId" name="teacherId" placeholder="아이디" class="form-control" value="${teacher.teacherId}" readonly/>
			          <label for="teacherId">아이디</label>
		          </div>
	          </td>
	      </tr>
	      <tr>
	          <td>
		          <div class="form-floating mb-3">
				          <input type="text" id="teacherName" name="teacherName" placeholder="이름" class="form-control" value="${teacher.teacherName}" readonly/>
				          <label for="teacherId">이름</label>
		          </div>
	          </td>
	      </tr>
	      <tr>
	          <td>
				<div class="row g-3">
				<div class="col-md-10">
				<div class="form-floating mb-3">
				          <input type="text" id="teacherNick" name="teacherNickname" placeholder="닉네임" class="form-control" value="${teacher.teacherNickname}" required/>
				          <label for="teacherId">닉네임</label>
	          	</div>
		        </div>
	          	<div class="col-md-2">
		          <button type="button" id="nickCheck" class="btn btn-primary">중복체크</button>
		        </div>
		        </div>
		          <span id="nickCheck_success" class="message">사용가능한 닉네임입니다^^</span>
		          <span id="nickCheck_fail" class="message">이미 존재하는 닉네임입니다.</span>
	          </td>
	      </tr>
	      <tr>
	      	<td>
			<div class="row g-3">
			<div class="col-md-10">
	           <div class="form-floating mb-3">
				          <input type="text" id="teacherPhone" name="teacherPhone" placeholder="휴대폰 번호" class="form-control" value="${teacher.teacherPhone}" required/>
				          <label for="teacherPhone">휴대폰 번호</label>
	          </div>
	          </div>
	          <div class="col-md-2">
		          <button type="button" id="phoneCheck" class="btn btn-primary">중복체크</button>
	          </div>
	          </div>
		          <span id="notValidPhone" class="message">'-'를 제외하고 010으로 시작하는 핸드폰 번호 11자리를 입력해주세요.</span>
		          <span id="phoneCheck_success" class="message">사용가능한 번호입니다.</span>
		          <span id="phoneCheck_fail" class="message">이미 가입한 이력이 있는 번호입니다.</span>
			</td>
	      </tr>
	      <tr>
	     	 <td>
				<div class="form-floating mb-3">
					          <input type="text" id="teacherTel" name="teacherTel" placeholder="공개 연락처" class="form-control" value="${teacher.teacherTel}" required/>
					          <label for="teacherTel">공개 연락처</label>
				</div>
			</td>
	      </tr>
	      <tr>
	          <td>
		          <div class="form-floating mb-3">
					          <input type="text" id="teacherEmail" name="teacherEmail" placeholder="이메일 주소" class="form-control" value="${teacher.teacherEmail}" required/>
					          <label for="teacherEmail">이메일 주소</label>
		          </div>
		          <span id="notValidEmail" class="message">올바른 이메일 주소가 아닙니다.</span>
	          </td>
	      </tr>
	      <tr>
			<td>
				<h5>소개</h5>
				<h6>* 강사님을 소개해주세요 </h6>
				<hr>
			</td>
		  </tr>
	      <tr>
	          <td>
		          <div class="form-floating mb-3">
					          <textarea id="teacherInfo" name="teacherInfo" placeholder="소개글" class="form-control">${teacher.teacherInfo}</textarea>
		          </div>
	          </td>
	      </tr>
	      <tr>
			<td>
				<h5>SNS</h5>
				<h6>* SNS 주소를 입력해주세요 </h6>
				<hr>
			</td>
		  </tr>
			<tr>
				<td>
					<c:forEach items="${teacher.teacherSns}" var="sns">
						<c:if test="${sns.sns.snsId == 1}"><c:set var="youtube" value="${sns.teacherSnsId}"/></c:if>
						<c:if test="${sns.sns.snsId == 2}"><c:set var="instagram" value="${sns.teacherSnsId}"/></c:if>
						<c:if test="${sns.sns.snsId == 3}"><c:set var="twitter" value="${sns.teacherSnsId}"/></c:if>
						<c:if test="${sns.sns.snsId == 4}"><c:set var="facebook" value="${sns.teacherSnsId}"/></c:if>
					</c:forEach>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="youtube" placeholder="유튜브" value="${youtube}" name="youtube">
						<label for="youtube">유튜브</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="instagram" placeholder="인스타그램" value="${instagram}" name="instagram">
						<label for="instagram">인스타그램</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="twitter" placeholder="트위터" value="${twitter}" name="twitter">
						<label for="twitter">트위터</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="facebook" placeholder="페이스북" value="${facebook}" name="facebook">
						<label for="pacebook">페이스북</label>
					</div>
				</td>
			</tr>
	      
	      
	      
	      
	      
	  	</table>
	  	<div class=".col-6 .col-sm-4 text-center">
		  	<input type="submit" class="btn btn-primary" id="updateBtn" value="수정하기">
		  	<a href="../board.jsp" class="btn btn-primary" id="cancelBtn">취소</a>
	  	</div>
	</form>
<%-- 	</sec:authorize> --%>
  </section>
  </div>
</body>
</html>