<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생(자신)이 보유한 쿠폰 조회</title>
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
	.pagination{
		display: block;
		text-align: center;
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
	                                <td>
			                        	<span><fmt:parseDate value="${issueCoupon.issueStartDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
			                        <td>
			                        	<span><fmt:parseDate value="${issueCoupon.issueStartDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
			                        	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
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