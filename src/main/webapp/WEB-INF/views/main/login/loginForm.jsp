<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

a{
	text-decoration: none;
}

body{margin-top:20px;}

.login-container {
    position: relative;
    margin: 10% auto;
    max-width: 340px;
}

.login-container .loginbox {
    position: relative;
    width: 380px !important;
    height: auto !important;
    padding: 0 0 20px 0;
    -webkit-box-shadow: 0 0 14px rgba(0,0,0,.1);
    -moz-box-shadow: 0 0 14px rgba(0,0,0,.1);
    box-shadow: 0 0 14px rgba(0,0,0,.1);
}

.bg-white {
    background-color: #fff !important;
}

.login-container .loginbox .loginbox-title {
    position: relative;
    text-align: center;
    width: 100%;
    height: 35px;
    padding-top: 10px;
    font-family: 'Lucida Sans','trebuchet MS',Arial,Helvetica;
    font-size: 20px;
    font-weight: normal;
    color: #444;
}

.login-container .loginbox .loginbox-social {
    padding: 0 10px 10px;
    text-align: center;
}

.login-container .loginbox .loginbox-social .social-title {
    font-size: 14px;
    font-weight: 500;
    color: #a9a9a9;
    margin-top: 10px;
}

.login-container .loginbox .loginbox-social .social-buttons {
    height: 80px;
    padding: 15px 35px;
    text-align: center;
}

.login-container .loginbox .loginbox-social .social-buttons .button-facebook {
    float: left;
    border: 2px solid #3b5998;
    color: #3b5998;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    margin-right: 30px;
    background-color: #fff;
}

.login-container .loginbox .loginbox-social .social-buttons .button-twitter {
    float: left;
    border: 2px solid #29c1f6;
    color: #29c1f6;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    margin-right: 30px;
    background-color: #fff;
}

.login-container .loginbox .loginbox-social .social-buttons .button-google  {
    float: left;
    border: 2px solid #ef4f1d;
    color: #ef4f1d;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    margin-right: 30px;
    background-color: #fff;
}

.login-container .loginbox .loginbox-social .social-buttons .button-facebook i {
    font-size: 26px;
    line-height: 50px;
}

.login-container .loginbox .loginbox-social .social-buttons .button-twitter i {
    font-size: 26px;
    line-height: 50px;
}

.login-container .loginbox .loginbox-social .social-buttons .button-google i {
    font-size: 26px;
    line-height: 50px;
}

.login-container .loginbox .loginbox-or {
    position: relative;
    text-align: center;
    height: 20px;
}

.login-container .loginbox .loginbox-or .or-line {
    position: absolute;
    height: 1px;
    top: 10px;
    left: 40px;
    right: 40px;
    background-color: #ccc;
}

.login-container .loginbox .loginbox-or .or {
    position: absolute;
    top: 0;
    -lh-property: 0;
    left: -webkit-calc(50% - 25px);
    left: -moz-calc(50% - 25px);
    left: calc(50% - 25px);
    width: 50px;
    height: 20px;
    background-color: #fff;
    color: #999;
    margin: 0 auto;
}

.login-container .loginbox .loginbox-textbox {
    padding: 10px 40px;
    text-align: center;
}

.login-container .loginbox .loginbox-textbox .form-control {
    -webkit-border-radius: 3px !important;
    -webkit-background-clip: padding-box !important;
    -moz-border-radius: 3px !important;
    -moz-background-clip: padding !important;
    border-radius: 3px !important;
    background-clip: padding-box !important;
}

.login-container .loginbox .loginbox-forgot {
    padding-left: 40px;
    text-align: center;
}

.login-container .loginbox .loginbox-forgot a {
    font-size: 11px;
    color: #666;
}

.login-container .loginbox .loginbox-submit {
    padding: 10px 40px;
    text-align: center;
}

.login-container .loginbox .loginbox-signup {
    text-align: center;
    padding-top: 10px;
}

.login-container .loginbox .loginbox-signup a {
    font-size: 13px;
    color: #666;
}

.login-container .logobox {
    width: 340px !important;
    height: 50px !important;
    padding: 5px;
    margin-top: 15px;
    -webkit-box-shadow: 0 0 14px rgba(0,0,0,.1);
    -moz-box-shadow: 0 0 14px rgba(0,0,0,.1);
    box-shadow: 0 0 14px rgba(0,0,0,.1);
    background-color: #fff;
    text-align: left;
}
</style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">달콤스쿨 회원 로그인</h4>
      </div>
      <div class="modal-body">

        <div class="login-container animated fadeInDown bootstrap snippets bootdeys">
            <div class="loginbox bg-white">
           		<br>
                <div class="loginbox-title">로그인</div>
                <div class="loginbox-social">
                    <div class="social-title ">SNS계정으로 10초만에 로그인</div>
                    <div class="social-buttons">
                        <a href="/oauth2/authorization/google" class="button-facebook">
                            <i class="social-icon fa fa-facebook"></i>
                        </a>
                        <a href="/oauth2/authorization/kakao" class="button-twitter">
                            <i class="social-icon fa fa-twitter"></i>
                        </a>
                        <a href="/oauth2/authorization/naver" class="button-google">
                            <i class="social-icon fa fa-google-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="loginbox-or">
                    <div class="or-line"></div>
                    <div class="or">OR</div>
                </div>
                <!-- 로그인 폼 -->
                <form name="login" method="post" action="${pageContext.request.contextPath}/main/login/login">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                <div class="loginbox-textbox"> 
	                    아이디<br><input type="text" name="username" class="form-control">
	                </div>
	                <div class="loginbox-textbox">
	                    비밀번호<br><input type="password" name="password" class="form-control">
	                </div>
	                <div class="loginbox-forgot">
	                    <a href="">아이디</a>&nbsp;/&nbsp;
	                    <a href="">비밀번호 찾기</a>
	                </div>
	                <div class="loginbox-submit">
	                    <input type="button" class="btn btn-primary btn-block" value="로그인">
	                </div>
	                <div class="loginbox-signup">
	                    <a href="${pageContext.request.contextPath}/joinStudent">일반 회원가입</a>&nbsp;or&nbsp;
	                    <a href="${pageContext.request.contextPath}/joinTeacher">강사 회원가입</a>
	                </div>
                </form>
            </div>
        </div>

      </div>
    </div>
  </div>
</div>


</body>
</html>