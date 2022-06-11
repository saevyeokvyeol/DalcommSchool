<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>달콤스쿨 로그인</title>

<style type="text/css">

	a{
		text-decoration: none;
	}
	
	.loginbox-social , .social-buttons{
		display: inline-block;
		margin: 0 auto;
	}
	
	.kakao, .naver, .google{
	
		float:left;
		width: 70px;
	  	height: 70px;
	  	padding: 5px;
	}
	
	.logo{
	    width: auto; height: auto;
	    max-width: 100px;
	    max-height: 100px;
	}
	
	.loginbox bg-white , .title {
		text-align: center;
	}

</style>
</head>
<body>

<div class="logo">
<img src="${pageContext.request.contextPath}/img/main/mainLogoBlack.png" class="d-block w-100" alt="...">
</div>
<h4 class="title" id="myModalLabel" style="text-align: center;">달콤스쿨 회원 로그인</h4>


<!--        <div class="loginbox-title">로그인</div> -->
<!--------------------------------- sns 로그인 ------------------------------------>
          <div class="loginbox-social">
              <div class="social-title ">SNS계정으로 10초만에 로그인</div>
              <div class="social-buttons">
              	<div class="kakao">
                   <a href="/oauth2/authorization/kakao" class="button-kakao">
               		<img src="${pageContext.request.contextPath}/img/main/login_kakao.png" class="d-block w-100" alt="...">
                   </a>
                  </div>
                  <div class="naver">
                   <a href="/oauth2/authorization/naver" class="button-naver">
                     <img src="${pageContext.request.contextPath}/img/main/login_naver.png" class="d-block w-100" alt="...">
                   </a>
                  </div>
                  <div class="google">
                   <a href="/oauth2/authorization/google" class="button-google">
				<img src="${pageContext.request.contextPath}/img/main/login_google.png" class="d-block w-100" alt="...">	                        </a>
                  </div>
              </div>
          </div>
              <div class="loginbox-or">
                  <div class="line"></div>
                  <div class="or">OR</div>
              </div><br>
<!--------------------------------- 일반 로그인 ------------------------------------>

              <form name="login" method="post" action="${pageContext.request.contextPath}/login">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               <div class="loginbox-textbox"> 
                   아이디<br><input type="text" name="id" id="id" class="form-control" value="${id}">
               </div>
               <div class="loginbox-textbox">
                   비밀번호<br><input type="password" name="pwd" id="pwd" class="form-control" value="${pwd}">
               </div>
               <span><br>
				<c:if test="${sessionScope.msg != null}">
					<div class="alert alert-danger" role="alert">
						${sessionScope.msg}
					</div>	 
				</c:if>
               </span>
               <br><br>
               <div class="loginbox-forgot">
                   <a href="${pageContext.request.contextPath}/main/login/findId">아이디</a>&ensp;/&ensp;
                   <a href="${pageContext.request.contextPath}/main/login/findPwd">비밀번호 찾기</a>
               </div>
               <div class="loginbox-submit">
                   <input type="submit" id="login" class="btn btn-primary btn-block" value="로그인">
               </div>
               <div class="loginbox-signup">
                   <a href="${pageContext.request.contextPath}/main/login/joinStudent">일반 회원가입</a>&ensp;or&ensp;
                   <a href="${pageContext.request.contextPath}/main/login/joinTeacher">강사 회원가입</a>
               </div>
              </form>
</body>
</html>