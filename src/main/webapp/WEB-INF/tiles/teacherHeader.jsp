<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/perfect-scrollbar.css" />


    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
	<script type="text/javascript">
	
		function logout() {
			document.getElementById('logout').submit();
		}
	
	</script>
  
  
  </head>

  <body>
    <!-- Layout wrapper -->
        <!-- Menu -->
  <sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal" var="teacher"/>
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" data-bg-class="bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <span class="app-brand-logo demo">
                <img src="${pageContext.request.contextPath}/img/main/mainLogoblack.png" style="height: 50px;">
              </span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1 ps ps--active-y">
            <!-- Dashboard -->

            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">클래스 관리</span>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/class/createClass" class="menu-link">
              	<i class="fa-solid fa-circle-plus menu-icon"></i>
                <div data-i18n="Account Settings">새 클래스 만들기</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/class/classList" class="menu-link">
                <i class="fa-solid fa-list menu-icon"></i>
                <div data-i18n="Authentications">내 클래스 조회</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/class/bookList" class="menu-link">
                <i class="fa-solid fa-people-line menu-icon"></i>
                <div data-i18n="Misc">클래스 수강 조회</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/class/bookList" class="menu-link">
                <i class="fa-solid fa-pen menu-icon"></i>
                <div data-i18n="Misc">클래스 리뷰 조회</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/class/bookList" class="menu-link">
                <i class="fa-solid fa-circle-question menu-icon"></i>
                <div data-i18n="Misc">클래스 Q&A 조회</div>
              </a>
            </li>
            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">수익 관리</span></li>
            <!-- Cards -->
            <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link">
                <i class="fa-solid fa-coins menu-icon"></i>
                <div data-i18n="User interface">내 수익 조회</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/adjust/adjustForm" class="menu-link">
                <i class="fa-solid fa-hand-holding-dollar menu-icon"></i>
                <div data-i18n="Basic">정산 신청하기</div>
              </a>
            </li>
            <!-- User interface -->
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/adjust/adjustList" class="menu-link">
                <i class="fa-solid fa-file-invoice-dollar menu-icon"></i>
                <div data-i18n="User interface">정산 신청 내역</div>
              </a>
            </li>
            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">쿠폰 관리</span></li>
            <!-- Cards -->
            <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link">
                <i class="fa-solid fa-ticket menu-icon"></i>
                <div data-i18n="User interface">새 쿠폰 만들기</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="cards-basic.html" class="menu-link">
                <i class="fa-solid fa-table-list menu-icon"></i>
                <div data-i18n="Basic">내 쿠폰 조회</div>
              </a>
            </li>
            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">회원 관리</span></li>
            <!-- Forms -->
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/teacherMypage/updateForm" class="menu-link">
                <i class="fa-solid fa-user menu-icon"></i>
                <div data-i18n="Form Elements">내 정보 수정</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath}/teacher/teacherMypage/modifyPwd" class="menu-link">
                <i class="fa-solid fa-key menu-icon"></i>
                <div data-i18n="Form Elements">비밀번호 수정</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link">
                <i class="fa-solid fa-address-card menu-icon"></i>
                <div data-i18n="Form Elements">선생님 프로필 수정</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link">
                <i class="fa-solid fa-location-dot menu-icon"></i>
                <div data-i18n="Form Elements">공방 정보 수정</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link">
                <i class="fa-solid fa-arrow-right-from-bracket menu-icon"></i>
                <div data-i18n="Form Elements">회원 탈퇴</div>
              </a>
            </li>
            <div class="ps__rail-y" style="top: 0px; height: 429px; right: 4px;">
<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 206px;">
</div>
</div>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
            
              
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
			  <h4>${title}</h4>
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <li class="nav-item lh-1 me-3">
                  <a
                    class="github-button"
                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                    data-icon="octicon-star"
                    data-size="large"
                    data-show-count="true"
                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                    >${teacher.teacherNickname}</a
                  >
                </li>

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${pageContext.request.contextPath}/img/class/class_4.jpg" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">${teacher.teacherId}</span>
                            <small class="text-muted">선생님</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
<!--                     <li> -->
<!--                       <a class="dropdown-item" href="#"> -->
<!--                         <i class="bx bx-user me-2"></i> -->
<!--                         <span class="align-middle">My Profile</span> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                       <a class="dropdown-item" href="#"> -->
<!--                         <i class="bx bx-cog me-2"></i> -->
<!--                         <span class="align-middle">Settings</span> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                       <a class="dropdown-item" href="#"> -->
<!--                         <span class="d-flex align-items-center align-middle"> -->
<!--                           <i class="flex-shrink-0 bx bx-credit-card me-2"></i> -->
<!--                           <span class="flex-grow-1 align-middle">Billing</span> -->
<!--                           <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span> -->
<!--                         </span> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                       <div class="dropdown-divider"></div> -->
<!--                     </li> -->
                    <li>
                      <a class="dropdown-item" href="#" onclick="logout()">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">로그아웃</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/css/bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/js/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/js/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
    <div class="form">	<!-- 로그아웃 폼 -->
	 <form action="${pageContext.request.contextPath}/logout" method="post" id="logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
	</form>
	</div>
    
 </sec:authorize>
  </body>
</html>
