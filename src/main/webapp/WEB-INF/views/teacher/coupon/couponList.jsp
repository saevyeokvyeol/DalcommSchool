<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스별 쿠폰 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style type="text/css">
	
	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}
	table{
		width: 1500px;
	}
	

</style>



</head>
<body>

<div class="main-content">
	<section>
		<form>

			<h1>쿠폰조회 </h1>
			
			<table class="table" id="couponTable">
				<thead>
					<tr>
						<th>쿠폰아이디</th>
						<th>쿠폰명</th>
						<th>할인금액</th>
						<th>등록일자</th>
						<th>수정일자</th>
						<th>사용기간</th>
						<th>쿠폰상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
	                    <c:when test ="${empty requestScope.list}">
	                        <tr>
	                            <th colspan="7">
	                                <span> 클래스 내 발급 가능한 쿠폰이 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.list}" var="coupon">
	                            <tr>
	                                <td>${coupon.couponId}</td>
	                                <td>${coupon.couponName}</td>
	                                <td>${coupon.couponDc}</td>
	                                <td>
			                        	<span><fmt:parseDate value="${coupon.couponInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
			                        <td>
			                        	<span><fmt:parseDate value="${coupon.couponUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
			                        	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
	                                <td>${coupon.couponEndDate}</td>
	                                <td>${coupon.couponState.couponStateName}</td>
	                            </tr>
	                        </c:forEach>
	                    </c:otherwise>
	                </c:choose>
					
				</tbody>
				<tfoot>
					<tr>
						
					</tr>
				</tfoot>
				
			</table>
			
		</form>
	</section>

</div>
		
</body>
</html>