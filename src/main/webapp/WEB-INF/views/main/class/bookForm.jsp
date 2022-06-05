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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
		<style type="text/css">
			.bootstrap-timepicker-widget.dropdown-menu {
			    z-index: 1050!important;
			}
			#bookForm {display: none;}
		</style>
		<script>
			$(function() {
				
			});

		</script>
	</head>
	<body>
		
		${classes.classId}
		 | ${classes.className}
		 | ${classes.classInfo}
		 | ${classes.classOpenDate}
		 | ${classes.classCategory.categoryName}
		 | ${classes.teacher.teacherNickname}
		 | ${classes.classState.stateName}
		<p>
		<c:if test="${classes.classImages != null}">
			<c:forEach items="${classes.classImages}" var="classImage">
				<img alt="" src="${pageContext.request.contextPath}/img/class/${classImage.imageName}">
			</c:forEach>
		</c:if>
		<p>
		${classes.teacher.teacherNickname} | 
		${classes.teacher.teacherTel} | 
		${classes.teacher.teacherImg} | 
		${classes.teacher.teacherInfo}
		<p>
		${classes.teacher.place.placeId}
		<p>
		
		<form action="" method="post"></form>
		
		<div id='calendar'></div>
		
		<form action="${pageContext.request.contextPath}/selectScheduleByClassId" id="bookForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="classId" value="${classes.classId}">
			<input type="hidden" name="scheduleId">
			<table class="table option-table table-borderless">
				<tbody>
					<tr>
						<td>
							수강일
						</td>
						<td>
							<input type="text" class="form-control-plaintext" id="scheduleDate" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>
							수강 시간
						</td>
						<td>
							<input type="text" class="form-control-plaintext" id="scheduleTime" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>
							수강 가능 인원
						</td>
						<td>
							<input type="text" class="form-control-plaintext" id="leftSeat" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>
							예약 인원
						</td>
						<td>
							<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="minus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16"><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>
							<input type="number" class="form-control-plaintext num" name="bookSeat" id="bookSeat" min="1" max="9999" step="1" value="1" readonly="readonly">
							<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="plus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16"><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>
						</td>
					</tr>
				</tbody>
				<tfoot>
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
							<h5>총 주문 금액</h5>
						</td>
						<td>
							<h5><input type="number" readonly class="form-control-plaintext" name="totalPrice" id="totalPrice" value=""></h5>
						</td>
					</tr>
				</tfoot>
			</table>
			<button type="submit" class="form-control btn btn-dark shadow-none btn-lg" id="order">결제</button>
		</form>
	</body>
</html>