<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<h2>쿠폰발급 뷰</h2>
<form method="post" id="insertIssueCoupon" action="${pageContext.request.contextPath}/main/class/insertIssueCoupon">
	<%-- <input type="hidden" name="couponId" value="${coupon.couponId}">
	<input type="hidden" name="studentId" value="${student.studentId}"> --%>
	<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
	<input class="btn btn-primary" type="submit" value="쿠폰발급받기">
	<input type="hidden" name="couponId" value="5">
	<input type="hidden" name="studentId" value="kim1234">
</form>

</body>
</html>