<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>선생님 : 클래스 쿠폰 등록하기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
		
		
		
	});
</script>
</head>
<body>
    
    
    <!--쿠폰수정하기-->
    <div class="card">
        <div class="card-body">
         	<form name="coupon-teacher-update" method="post" id="coupon-teacher-update" action="${pageContext.request.contextPath}/teacher/coupon/couponUpdate">
         	<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
         	<input type=hidden name="couponId" value="${coupon.couponId}">
         		<h2> 쿠폰 수정하기 </h2>
         		<table>
	         			<tr>
	         				<th>선생님ID</th>
	         				<td><input type=hidden name="teacherId" value="Tkim1234" id="teacherId"></td>
	         				<%-- <td><input type=hidden name="teacherId" value="${teacher.teacherId} id="teacherId"></td> --%>
	         			</tr>
	         			<tr>
         					<th>쿠폰ID</th>
         					<td>${coupon.couponId}</td>
         				</tr>
	         			<tr>
	         				<th>쿠폰명</th>
	         				<td><input class="form-control" type=text name="couponName" id="couponName" value="${coupon.couponName}"></td>
	         			</tr>
	         			<tr>
	         				<th>할인금액</th>
	         				<td><input class="form-control" type=text name="couponDc" id="couponDc" value="${coupon.couponDc}"></td>
	         			</tr>
	         			<tr>
	         				<th>사용기간</th>
	         				<td><input class="form-control" type=number name="couponEndDate" id="couponEndDate" value="${coupon.couponEndDate}"></td>
	         			</tr>
         				
         		</table>
                
                <input type="submit" class="btn btn-dark" id="coupon-insert-btn" value="수정하기">
         	 </form>
         </div>
     </div>
     <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/teacher/coupon/couponAllList">뒤로 돌아가기</a>&gt;</span></div>


</body>
</html>