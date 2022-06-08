<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스별 사용가능한 쿠폰 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<style type="text/css">
	section {width: 1200px; margin: auto;}
	table {width: 1200px;}
	th, td {border: 1px solid black;}
</style>



</head>
<body>
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
							<th>쿠폰상태아이디</th>
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
		                                <td>${coupon.couponInsertDate}</td>
		                                <td>${coupon.couponUpdateDate}</td>
		                                <td>${coupon.couponEndDate}</td>
		                                <td>${coupon.couponState.couponStateId}</td>
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
		
</body>
</html>