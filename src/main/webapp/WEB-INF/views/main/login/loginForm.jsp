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
<title>Insert title here</title>
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
	
	.loginbox bg-white {
		text-align: center;
	}

</style>
</head>
<body>

<div class="main-content">

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">모달</button>

<!-- Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align: center;">달콤스쿨 회원 로그인</h4>
      </div>
      <div class="modal-body">

        <div class="login-container animated fadeInDown bootstrap snippets bootdeys">
            <div class="loginbox bg-white">
           		<br>
<!--                 <div class="loginbox-title">로그인</div> -->
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
                <!-- 로그인 폼 -->
                <form name="login" method="post" action="${pageContext.request.contextPath}/main/login/login">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                <div class="loginbox-textbox"> 
	                    아이디<br><input type="text" name="id" class="form-control">
	                </div>
	                <div class="loginbox-textbox">
	                    비밀번호<br><input type="password" name="pwd" class="form-control">
	                </div>
	                <div class="loginbox-forgot">
	                    <a href="">아이디</a>&ensp;/&ensp;
	                    <a href="">비밀번호 찾기</a>
	                </div>
	                <div class="loginbox-submit">
	                    <input type="submit" class="btn btn-primary btn-block" value="로그인">
	                </div>
	                <div class="loginbox-signup">
	                    <a href="${pageContext.request.contextPath}/main/login/joinStudent">일반 회원가입</a>&ensp;or&ensp;
	                    <a href="${pageContext.request.contextPath}/main/login/joinTeacher">강사 회원가입</a>
	                </div>
                </form>
            </div>
        </div>

      </div>
    </div>
  </div>
</div>

</div>
</body>
</html>