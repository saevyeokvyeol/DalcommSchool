<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 리뷰 페이지입니다.</title>
</head>
<body>

클래스 리뷰 페이지입니다.

<table>
  <thead>
    <tr>
      <th>아이디</th>
      <th>별점</th>
      <th>내용</th>
      <th>작성 날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
      <c:when test="${empty requestScope.list}">
        <tr>
          <th colspan="4">
            <span>등록된 후기가 없습니다.</span>
          </th>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach items="${requestScope.list}" var="review">
          <tr>
            <td><span>${review.studentId}</span></td>
            <td><span>${review.reviewRate}</span></td>
            <td><span>${review.reviewContent}</span></td>
            <td><span>${review.reviewInsertDate}</span></td>
          </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </tbody>
  <tfoot>
    <input type="button" value="후기 남기기" onclick="location.href='${pageContext.request.contextPath}/main/board/review/insertForm'">
  </tfoot>
</table>

</body>
</html>