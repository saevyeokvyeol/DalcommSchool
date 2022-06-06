<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
				
				$.ajax({
					url: "${pageContext.request.contextPath}/place/selectPlaceRegion",
					type: "post",
					data: {"${_csrf.parameterName}": "${_csrf.token}"},
					dataType: "json",
					success: function(result){
						text = ""
						$.each(result, function(index, item){
							text += `<input type="radio" class="btn-check" name="placeRegion" id="\${item.regionName}" value="\${item.regionId}"><label class="btn btn-outline-primary" for="\${item.regionName}">\${item.regionName}</label>`;
						})
						$("#placeRegion").append(text);
					},
					error: function(err){
						alert("지역정보를 가져올 수 없습니다.")
					}
				})
				
				function requestPay() {
					// IMP.request_pay(param, callback) 결제창 호출
					IMP.request_pay({ // param
						pg: "html5_inicis",
						pay_method: "card",
						merchant_uid: 'kim1234_'+new Date().getTime(),
						name: ${classes.classPrice},
						amount: ${classes.classPrice},
						buyer_email: "",
						buyer_name: "김사장",
						buyer_tel: "010-3693-6936",
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
					/* IMP.init("imp86665517");
					requestPay(); */
					$("#bookForm").submit();
				})
			});
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/main/class/bookComplete" id="bookForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="classId" value="${classes.classId}">
			<input type="hidden" name="scheduleId" value="${schedule.scheduleId}">
			<input type="hidden" name="studentId" value="kim1234">
			<table class="table option-table table-borderless">
				<tbody>
					<tr>
						<td colspan="2">
							${classes.classId}
							 | ${classes.className}
							 | ${classes.classInfo}
							 | ${classes.classOpenDate}
						</td>
					</tr>
					<tr>
						<td>
							수강자명
						</td>
						<td>
							<input type="text" class="form-control" name="bookName" id="bookName" value="김유다">
						</td>
					</tr>
					<tr>
						<td>
							수강자 연락처
						</td>
						<td>
							<input type="text" class="form-control" name="bookPhone" id="bookPhone" value="01033339999">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							사용 쿠폰
						</td>
						<td>
							<select name="issueNo">
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
							<h5>총 주문 금액</h5>
						</td>
						<td>
							<h5><input type="number" readonly class="form-control-plaintext" name="totalPrice" id="totalPrice" value=""></h5>
						</td>
					</tr>
				</tfoot>
			</table>
			<button type="button" class="form-control btn btn-dark shadow-none btn-lg" id="order">결제</button>
		</form>
	</body>
</html>