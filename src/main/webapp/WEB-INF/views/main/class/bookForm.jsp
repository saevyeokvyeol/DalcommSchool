<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<style type="text/css">
		</style>
		<script>
			$(function() {
				function calTotalPrice() {
					classPrice = $("#classPrice").val();
					bookSeat = $("#bookSeat").val();
					
					$("#totalPrice").val(classPrice * bookSeat);
		    	}
				calTotalPrice();
				
				function requestPay() {
					IMP.request_pay({ // param
						pg: "html5_inicis",
						pay_method: "card",
						merchant_uid: `${student.studentId}`+new Date().getTime(),
						name: ${classes.classPrice},
						amount: ${classes.classPrice},
						buyer_email: "",
						buyer_name: `${student.studentName}`,
						buyer_tel: `${student.studentPhone}`,
						buyer_addr: "1600 Amphitheatre Pkwy, Mountain View, CA 94043 미국",
						buyer_postcode: "36963"
					}, function (rsp) { // callback
						if (rsp.success) {
							$("#bookForm").submit();
						} else {
							alert("결제를 실패했습니다.\n잠시 뒤 다시 시도해주세요.")
						}
					});
				}
				
				$("#order").on("click", function() {
					IMP.init("imp86665517");
					requestPay();
					$("#bookForm").submit();
				})
			});
		</script>
	</head>
	<body>
		<div class="main-content">
			<h2 class="title">클래스 예약</h2>
			<form action="${pageContext.request.contextPath}/main/book/bookComplete" id="bookForm" method="post">
				<div id="bookForm">
					<div class="bookInfoBox">
						<div>
							<table class="table option-table table-borderless classBox">
								<tbody>
									<tr>
										<th colspan="2">
											<h4 class="book-title">클래스 정보</h4>
										</th>
									</tr>
									<tr>
										<td colspan="2">
											<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${classes.classImage}" class="d-block w-100 h-100 rounded-3">
											<div class="classBoxContent">
												<h5 class="classBoxName">
													<span>${classes.className}</span>
												</h5>
												<div class="classBoxInfo">
													<h6>${classes.teacher.teacherNickname} 선생님</h6>
												<div class="classBoxLocation"><i class="fa-solid fa-cookie-bite"></i><span>${classes.classCategory.categoryName}</span><i class="fa-solid fa-location-dot"></i>${classes.teacher.place.placeRegion.regionName}</div>
												</div>
												<h5 class="classBoxPrice"><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</h5>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											일정
										</td>
										<td>
											${schedule.scheduleDate.toString().substring(0, 10)} ${schedule.startTime} ~ ${schedule.endTime}
										</td>
									</tr>
									<tr>
										<td>
											주소
										</td>
										<td>
											${classes.teacher.place.placeAddr} ${classes.teacher.place.detailAddr}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="bookInfoBox">
						<div>
							<sec:authorize access="isAuthenticated()">
							<sec:authentication var="student" property="principal" />
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="classId" value="${classes.classId}">
							<input type="hidden" name="scheduleId" value="${schedule.scheduleId}">
							<input type="hidden" name="studentId" value="kim1234">
							<table class="table option-table table-borderless">
								<tbody>
									<tr>
										<th colspan="2">
											<h4 class="book-title">결제 정보</h4>
										</th>
									</tr>
									<tr>
										<td>
											수강자명
										</td>
										<td>
											<input type="text" class="form-control" name="bookName" id="bookName" value="${student.studentName}" required="required">
											
										</td>
									</tr>
									<tr>
										<td>
											수강자 연락처
										</td>
										<td>
											<input type="text" class="form-control" name="bookPhone" id="bookPhone" value="${student.studentPhone}" required="required">
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>
											사용 쿠폰
										</td>
										<td>
											<select name="issueNo" class="form-select">
												<option value="0">쿠폰 목록</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											금액 
										</td>
										<td>
											<input type="number" readonly class="form-control-plaintext" id="classPrice" value="${classes.classPrice}">
										</td>
									</tr>
									<tr>
										<td>
											인원 
										</td>
										<td>
											<input type="number" readonly class="form-control-plaintext" id="bookSeat" name="bookSeat" value="${book.bookSeat}">
										</td>
									</tr>
									<tr>
										<td>
											쿠폰 할인 금액
										</td>
										<td>
											<input type="number" readonly class="form-control-plaintext" id="couponPrice" value="${classes.classPrice}">
										</td>
									</tr>
									<tr>
										<td>
											<h5>총 주문 금액</h5>
										</td>
										<td>
											<h5><input type="number" readonly class="form-control-plaintext" name="totalPrice" id="totalPrice" value=""></h5>
										</td>
									</tr>
								</tfoot>
							</table>
							<button type="button" class="form-control btn btn-primary shadow-none btn-lg" id="order">결제</button>
							</sec:authorize> 
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>