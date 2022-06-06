<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생(자신)이 보유한 쿠폰 조회</title>
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
							<th>쿠폰번호</th>
							<th>쿠폰아이디</th>
							<th>쿠폰명</th>
							<th>쿠폰사용여부</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.list}">
		                        <tr>
		                            <th colspan="6">
		                                <span> 보유한 쿠폰이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.list}" var="issueCoupon">
		                            <tr>
		                                <td>${issueCoupon.issueNo}</td>
		                                <td>${issueCoupon.coupon.couponId}</td>
		                                <td>${issueCoupon.coupon.couponName}</td>
		                                <td>${issueCoupon.issueUsable}</td>
		                                <td>${issueCoupon.issueStartDate}</td>
		                                <td>${issueCoupon.issueEndDate}</td>
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