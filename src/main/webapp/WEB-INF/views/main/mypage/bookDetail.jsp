<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(function() {
				$(".updateSchedule").on("click", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/selectAvailableSchedule",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: ${book.bookId}},
						dataType: "json",
						success: function(result){
							text = ""
							if(result.length == 0){
								text += "<option value='0'>변경 가능한 일정이 없습니다</option>"
							} else {
								$.each(result, function(index, item){
									text += `<option value="\${item.id}">\${item.start.substring(0, 16)}</option>`
								})
							}
							
							$("#scheduleSelect").html(text)
							$("#updateSchedule").modal("show");
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
				
				$("#updateScheduleSubmit").on("click", function() {
					if($("#scheduleSelect").val() == 0) {
						$("#updateSchedule").modal("hide");
						return false;
					}
					$.ajax({
						url: "${pageContext.request.contextPath}/book/updateSchedule",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: ${book.bookId}, scheduleId: $("#scheduleSelect").val()},
						success: function(result){
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
				
				$("#bookFinish").on("click", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/book/updateFinish",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: ${book.bookId}},
						success: function(){
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
				
				$("#bookCancel").on("click", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/book/bookCancel",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: ${book.bookId}},
						success: function(){
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
			})
		</script>
	</head>
	<body>
		<!-- 모달창 -->
		<div class="modal fade" id="updateSchedule" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약 일정 변경</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="updateScheduleForm" method="post" action="">
							<div class="mb-3">
								<select class="form-select" id="scheduleSelect" aria-label="Default select example">
								</select>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-primary" id="updateScheduleSubmit" value="일정 변경">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<h3>예약 상세 보기</h3>
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
									<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${book.classes.classImage}" class="d-block w-100 h-100 rounded-3">
									<div class="classBoxContent">
										<h5 class="classBoxName">
											<span>${book.classes.className}</span>
										</h5>
										<div class="classBoxInfo">
											<h6>${book.classes.teacher.teacherNickname} 선생님</h6>
										<div class="classBoxLocation"><i class="fa-solid fa-cookie-bite"></i><span>${book.classes.classCategory.categoryName}</span><i class="fa-solid fa-location-dot"></i>${book.classes.teacher.place.placeRegion.regionName}</div>
										</div>
										<h5 class="classBoxPrice"><fmt:formatNumber value="${book.classes.classPrice}" pattern="#,###"/>원</h5>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									일정
								</td>
								<td>
									${book.classSchedule.scheduleDate.toString().substring(0, 10)} ${book.classSchedule.startTime} ~ ${book.classSchedule.endTime}
								</td>
							</tr>
							<tr>
								<td>
									주소
								</td>
								<td>
									${book.classes.teacher.place.placeAddr} ${book.classes.teacher.place.detailAddr}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="bookInfoBox">
				<div>
					<table class="table option-table table-borderless bookerInfo">
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
									${book.bookName}
								</td>
							</tr>
							<tr>
								<td>
									수강자 연락처
								</td>
								<td>
									${book.bookPhone}
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>
									사용 쿠폰
								</td>
								<td>
									${book.issueCoupon.coupon.couponName != null ? book.issueCoupon.coupon.couponName : "-"}
								</td>
							</tr>
							<tr>
								<td>
									금액 
								</td>
								<td>
									${book.classes.classPrice}
								</td>
							</tr>
							<tr>
								<td>
									인원 
								</td>
								<td>
									${book.bookSeat}명
								</td>
							</tr>
							<tr>
								<td>
									쿠폰 할인 금액
								</td>
								<td>
									<fmt:formatNumber value="${book.issueCoupon.coupon.couponPrice != null?book.issueCoupon.coupon.couponPrice:0}" pattern="#,###"/>원
								</td>
							</tr>
							<tr>
								<th>
									<h5>총 주문 금액</h5>
								</th>
								<td>
									<h5><fmt:formatNumber value="${book.totalPrice}" pattern="#,###"/>원</h5>
								</td>
							</tr>
						</tfoot>
					</table>
					<hr>
					<table class="table option-table table-borderless bookerInfo">
						<tbody>
							<tr>
								<td>
									수강 상태
								</td>
								<td>
									${book.bookState.bookStateName}
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="flex">
										<c:choose>
											<c:when test="${book.bookState.bookStateId == 1}">
												<button type="button" class="btn btn-primary shadow-none updateSchedule">일정 변경</button>
												<button type="button" class="btn btn-primary shadow-none" id="bookCancel">예약 취소</button>
												<button type="button" class="btn btn-primary shadow-none" id="bookFinish">수강 완료</button>
											</c:when>
											<c:when test="${book.bookState.bookStateId == 2}">
												<button type="button" class="btn btn-primary shadow-none" id="order">후기 쓰러 가기</button>
											</c:when>
											<c:when test="${book.bookState.bookStateId == 3}">
												취소된 예약입니다.
											</c:when>
											<c:otherwise>
												자동 수강 완료 신청되었습니다.
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</body>
</html>