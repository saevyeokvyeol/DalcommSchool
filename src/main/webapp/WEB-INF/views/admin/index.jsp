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
				let categoryName = [];
				let regionName = [];
				let category = [];
				let region = [];
				
				$.ajax({
					url : "${pageContext.request.contextPath}/teacher/categoryStatistics",
					type : "post",
					data : {"${_csrf.parameterName}" : "${_csrf.token}"},
					dataType: "json",
					success : function(result) {
						$.each(result, function(index, item) {
							categoryName.push(item.name);
							category.push(item.classTotalProfit);
						})
						
						new Chart($("#categoryProfit"), {
							type: 'doughnut',
							options: {
								responsive: false,
								title: {
									display: true,
									text: '카테고리별 매출'
								}
							},
							data: {
								labels: categoryName,
								datasets: [{
									data: category,
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
				
				$.ajax({
					url : "${pageContext.request.contextPath}/teacher/regionStatistics",
					type : "post",
					data : {"${_csrf.parameterName}" : "${_csrf.token}"},
					dataType: "json",
					success : function(result) {
						$.each(result, function(index, item) {
							regionName.push(item.name);
							region.push(item.classTotalProfit);
						})
						
						new Chart($("#placeProfit"), {
							type: 'doughnut',
							options: {
								responsive: false,
								title: {
									display: true,
									text: '지역별 매출'
								}
							},
							data: {
								labels: regionName,
								datasets: [{
									data: region,
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
					<i class="fa-solid fa-users-between-lines fa-xl text-success"></i>
				</div>
				<div>
					<h6>신규 학생</h6>
					<h3><fmt:formatNumber value="${studentNum}" pattern="#,###"/>명</h3>
				</div>
			</div>
			<div id="todayPrice">
				<div class="p-3 mb-2 bg-warning bg-opacity-25 icon">
					<i class="fa-solid fa-chalkboard-user fa-xl text-warning"></i>
				</div>
				<div>
					<h6>신규 선생님</h6>
					<h3><fmt:formatNumber value="${teacherNum}" pattern="#,###"/>명</h3>
				</div>
			</div>
			<div id="adjustablePrice">
				<div class="p-3 mb-2 bg-danger bg-opacity-25 icon">
					<i class="fa-solid fa-person-arrow-up-from-line fa-xl text-danger"></i>
				</div>
				<div>
					<h6>총 회원 수</h6>
					<h3><fmt:formatNumber value="${userNum}" pattern="#,###"/>명</h3>
				</div>
			</div>
			<div id="totalPrice">
				<div class="p-3 mb-2 bg-info bg-opacity-25 icon">
					<i class="fa-solid fa-money-bill-trend-up fa-xl text-info"></i>
				</div>
				<div>
					<h6>총 수익</h6>
					<h3><fmt:formatNumber value="${totalProfit}" pattern="#,###"/>원</h3>
				</div>
			</div>
		</div>
		<div class="indexBox">
			<h4>매출 통계</h4>
			<div id="chartBox">
				<canvas id="placeProfit"></canvas>
				<canvas id="categoryProfit"></canvas>
			</div>
		</div>
	</body>
</html>