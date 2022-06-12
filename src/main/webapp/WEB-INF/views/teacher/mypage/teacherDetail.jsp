<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<h2>강사 소개 페이지</h2>

<div class="main-content">
<div id="teacher-main-content">

<table class="table">
  <img src="">
  <tr>
    <th>강사 이름</th>
    <td>${teacher.teacherName}</td>
  </tr>
  <tr>
    <th>강사 닉네임</th>
    <td>${teacher.teacherNickname}</td>
  </tr>
  <tr>
    <th>강사 공개 연락처</th>
    <c:choose>
      <c:when test="${empty teacher.teacherTel}">
        <td>
          <span>등록된 공개 연락처가 없습니다.</span>
        </td>
      </c:when>
      <c:otherwise>
        <td>
          <span>${teacher.teacherTel}</span>
        </td>
      </c:otherwise>
    </c:choose>
  </tr>
  <tr>
    <th>강사 이메일</th>
    <td>${teacher.teacherEmail}</td>
  </tr>
 
</table>
</div>
</div>
</body>
</html>