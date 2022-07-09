<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert index-title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		<style type="text/css">
		</style>
		<script type="text/javascript">
			$(function() {
				let labels = [];
				let bookData = [];
				let profitData = [];
				
				$.ajax({
					url : "${pageContext.request.contextPath}/teacher/classStatistics",
					type : "post",
					data : {"${_csrf.parameterName}" : "${_csrf.token}"},
					dataType: "json",
					success : function(result) {
						$.each(result, function(index, item) {
							labels.push(item.name);
							bookData.push(item.bookCount);
							profitData.push(item.classTotalProfit);
						})
						
						new Chart($("#classBooker"), {
							type: 'doughnut',
							options: {
								responsive: false,
								title: {
									display: true,
									text: '클래스 예약'
								}
							},
							data: {
								labels: labels,
								datasets: [{
									data: bookData,
									backgroundColor: [
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)',
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)',
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)'
									],
								}]
							},
						})
						
						new Chart($("#classProfit"), {
							type: 'doughnut',
							options: {
								responsive: false,
								title: {
									display: true,
									text: '클래스 매출'
								}
							},
							data: {
								labels: labels,
								datasets: [{
									data: profitData,
									backgroundColor: [
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)',
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)',
										'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)',
										'rgb(184, 83, 238)'
									],
								}]
							},
						})
					},
					error: function(xhr, status, error) {
						var err = eval("(" + xhr.responseText + ")");
						alert(err.message);
					}
				}); // 아작스 종료
				
				
			})
		</script>
	</head>
	<body>
		<div id="summary">
			<div id="todayBook">
				<div class="p-3 mb-2 bg-success bg-opacity-25 icon">
					<i class="fa-regular fa-calendar-check fa-xl text-success"></i>
				</div>
				<div>
					<h6>오늘 예약</h6>
					<h3>${bookList != null? bookList.size() : '0'}건</h3>
				</div>
			</div>
			<div id="todayPrice">
				<div class="p-3 mb-2 bg-warning bg-opacity-25 icon">
					<i class="fa-regular fa-money-bill-1 fa-xl text-warning"></i>
				</div>
				<div>
					<h6>오늘 수익</h6>
					<h3><fmt:formatNumber value="${todayProfit}" pattern="#,###"/>원</h3>
				</div>
			</div>
			<div id="adjustablePrice">
				<div class="p-3 mb-2 bg-danger bg-opacity-25 icon">
					<i class="fa-solid fa-hand-holding-dollar fa-xl text-danger"></i>
				</div>
				<div>
					<h6>정산 가능 금액</h6>
					<h3><fmt:formatNumber value="${teacher.adjustable}" pattern="#,###"/>원</h3>
				</div>
			</div>
			<div id="totalPrice">
				<div class="p-3 mb-2 bg-info bg-opacity-25 icon">
					<i class="fa-solid fa-money-bill-trend-up fa-xl text-info"></i>
				</div>
				<div>
					<h6>총 수익</h6>
					<h3><fmt:formatNumber value="${teacher.totalProfit}" pattern="#,###"/>원</h3>
				</div>
			</div>
		</div>
		
		<div class="indexBox">
			<h4>오늘 예약 목록</h4>
			<table class="table">
		 		<thead>
		 			<tr>
		 				<th>
		 					수강 클래스
		 				</th>
		 				<th>
		 					수강일
		 				</th>
		 				<th>
		 					학생 아이디
		 				</th>
		 				<th>
		 					체험자 아이디
		 				</th>
		 				<th>
		 					체험자 전화번호
		 				</th>
		 				<th>
		 					수강 인원
		 				</th>
		 				<th>
		 					결제 금액
		 				</th>
		 				<th>
		 					수강 상태
		 				</th>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			<c:choose>
		 				<c:when test="${bookList.size() == 0}">
			 				<tr>
			 					<td colspan="8"><h5>오늘 수강 예약 내역이 없습니다.</h5></td>
			 				</tr>
		 				</c:when>
		 			</c:choose>
		 			<c:forEach items="${bookList}" var="book">
		 				<tr>
		 					<td>${book.classes.className}</td>
		 					<td>${book.classSchedule.scheduleDate.toString().substring(0, 10)} ${book.classSchedule.startTime} ~ ${book.classSchedule.endTime}</td>
		 					<td>${book.student.studentId}</td>
		 					<td>${book.bookName}</td>
		 					<td>${book.bookPhone}</td>
		 					<td>${book.bookSeat}명</td>
		 					<td><fmt:formatNumber value="${book.totalPrice}" pattern="#,###" />원</td>
		 					<td>${book.bookState.bookStateName}</td>
		 				</tr>
		 			</c:forEach>
		 		</tbody>
		 	</table>
		</div>
		<div class="indexBox">
			<h4>내 예약 통계</h4>
			<div id="chartBox">
				<canvas id="classBooker"></canvas>
				<canvas id="classProfit"></canvas>
			</div>
		</div>
	</body>
</html>