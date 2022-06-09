<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>강사 소개 페이지</h2>

<table>

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

</body>
</html>