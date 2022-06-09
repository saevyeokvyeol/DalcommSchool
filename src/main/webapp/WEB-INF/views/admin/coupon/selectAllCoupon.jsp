<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 전체 쿠폰 조회(클래스 쿠폰+이벤트쿠폰)</title>
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

<script type="text/javascript">
			$(function() {
				
				$(document).on("change", "#select_couponStateName", function() {
					//var idValue = $(this).parent().siblings().eq(1).text(); //couponId
					//var idValue = $(this).val(); //couponStateId
					//alert(idValue);
					
					$.ajax({
						url: "${pageContext.request.contextPath}/admin/coupon/changeEventCouponState",
						type: "post",
						dataType : "text",
						data: {"${_csrf.parameterName}": "${_csrf.token}", couponId: $(this).parent().siblings().eq(1).text(), couponStateId: $(this).val()},
						success: function(result) {
							alert("수정되었습니다.");
						},
						error: function(err) {
							alert(err + "\n에러발생");
						}
					}) // ajax 종료	
					
				})//onchang 끝	
				
				
			}); //ready 끝	
			
</script>


</head>
<body>
		<section>

				<h1>전체쿠폰조회 </h1>
				
				<table class="table" id="couponTable">
					<thead>
						<tr>
							<th>클래스아이디</th>
							<th>쿠폰아이디</th>
							<th>쿠폰명</th>
							<th>할인금액</th>
							<th>등록일자</th>
							<th>수정일자</th>
							<th>사용기간</th>
							<th>쿠폰상태</th>
							<th>수정하기</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.list}">
		                        <tr>
		                            <th colspan="10">
		                                <span> 등록된 쿠폰이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.list}" var="coupon">
		                            <tr>
		                            	<td>${coupon.classes.classId}</td>
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
		                                <td>${coupon.couponEndDate}일</td>
		                                <td>
											<select name="select_couponStateName" id="select_couponStateName" class="form-select">
												<c:choose>
												<c:when test="${coupon.couponState.couponStateId == '1'}">
													<option name="couponStateId" value="1">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="2">발급중지</option>
													<option name="couponStateId" value="3">삭제</option>
												</c:when>
												<c:when test="${coupon.couponState.couponStateId == '2'}">
													<option name="couponStateId" value="2">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="1">발급</option>
													<option name="couponStateId" value="3">삭제</option>
												</c:when>
												<c:when test="${coupon.couponState.couponStateId == '3'}">
													<option name="couponStateId" value="3">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="1">발급</option>
													<option name="couponStateId" value="2">발급중지</option> 
												</c:when>
												</c:choose>	
		        							</select>
		        						</td>
		        						<td>
		        							<form method="post" id="updateForm" action="${pageContext.request.contextPath}/admin/coupon/eventCouponUpdateForm">
												<input type="hidden" name="couponId" value="${coupon.couponId}">
												<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
												<c:choose>
													<c:when test="${empty coupon.classes.classId }">
														<input class="btn btn-primary" type="submit" value="수정하기">
													</c:when>
												</c:choose>
												
											</form>
										</td>
										<td>
											<form method="post" id="delete" action="${pageContext.request.contextPath}/admin/coupon/eventCouponDelete">
												<input type="hidden" name="couponId" value="${coupon.couponId}">
												<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
												<c:choose>
													<c:when test="${empty coupon.classes.classId }">
														<input class="btn btn-danger" type="submit" value="삭제하기">
													</c:when>
												</c:choose>
											</form>
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
				<hr>
				<a class="btn btn-dark" href="${pageContext.request.contextPath}/admin/coupon/eventCouponForm">쿠폰등록하기</a>
			
		</section>
		
</body>
</html>