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
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.js"></script>
		<style type="text/css">
			#scheduleUpdateForm h6 {display: none;}
		</style>
		<script>
			// 풀캘린더 API 사용
			$(function() {				
				// calendar element 취득
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성하기
				function calendarLoad() {
					calendar = new FullCalendar.Calendar(calendarEl, {
						height: '700px', // calendar 높이 설정
						slotMinTime: '09:00', // Day 캘린더에서 시작 시간
						slotMaxTime: '22:00', // Day 캘린더에서 종료 시간
						// 해더에 표시할 툴바
						headerToolbar: {
							left: 'prevYear,prev,today,next,nextYear',
							center: 'title',
							right: 'dayGridMonth,timeGridWeek'
						},
						initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
						navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
						editable: false, // 수정 가능?
						selectable: true, // 달력 일자 드래그 설정가능
						nowIndicator: true, // 현재 시간 마크
						dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
						navLinks: false,
						locale: 'ko', // 한국어 설정
						bootstrapFontAwesome: {
							close: 'fa-times',
							prev: 'fa-chevron-left',
							next: 'fa-chevron-right',
							prevYear: 'fa-angle-double-left',
							nextYear: 'fa-angle-double-right'
						},
						themeSystem: 'bootstrap',
						eventColor: '#EB5353',
						eventDisplay: 'block',
						displayEventTime: 'true',
						eventClick: function(obj) {
							
							$.ajax({
								url : "${pageContext.request.contextPath}/selectScheduleByScheduleId",
								type : "post",
								data: {"scheduleId" : obj.event.id, "${_csrf.parameterName}":"${_csrf.token}",},
								dateType: "text",
								success : function(result) {
									$("#scheduleUpdateForm .scheduleId").val(obj.event.id)
									var date = new Date(`\${result.scheduleDate}`)
									$("#scheduleUpdateForm .scheduleDate").val(date.toLocaleDateString())
									$("#scheduleUpdateForm .startTime").val(`\${result.startTime}`)
									$("#scheduleUpdateForm .endTime").val(`\${result.endTime}`)
									$("#scheduleUpdateForm .totalSeat").val(`\${result.totalSeat}`)
									$("#scheduleUpdateForm .leftSeat").val(`\${result.leftSeat}`)
									$("#scheduleUpdateForm #updateSchedule").val(obj.event.id)
									$("#scheduleUpdateForm #deleteSchedule").val(obj.event.id)
									
									difference = $("#scheduleUpdateForm .totalSeat").val() - $("#scheduleUpdateForm .leftSeat").val()
									if(difference > 0){
										$("#scheduleUpdateForm h6").css("display", "block");
										$("#scheduleUpdateForm .updateTime").attr("disabled", "disabled");
									} else {
										$("#scheduleUpdateForm h6").css("display", "none");
										$("#scheduleUpdateForm .updateTime").removeAttr("disabled");
									}
								},
								error : function(error) {
									swal("일정을 가져올 수 없습니다.");
								}
							}); // 아작스 종료
							
							$("#updateModal").modal("show");
						},
						select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
							var now = new Date();
							var constraint = new Date(now.setDate(now.getDate() + 7));
							
							if(constraint >= arg.start){
								swal("오늘로부터 일주일 이내에는 일정을 등록할 수 없습니다.")
								return false;
							}
							
							$(".startTime").val("");
							$(".endTime").val("");
							$(".totalSeat").val("");
							$(".leftSeat").val("");
							
							$(".scheduleDate").val(arg.start.toLocaleDateString());
							
						    $("#insertModal").modal("show");
				        },
						events: function(info, successCallback, failureCallback){
							$.ajax({
								url : "${pageContext.request.contextPath}/selectScheduleByClassId",
								type : "post",
								data : {"${_csrf.parameterName}":"${_csrf.token}", "classId": ${classes.classId}},
								dataType : "json",
								success : function(result) {
									successCallback(result);
								}
							})
						}
					});
				}
				
				// 캘린더 렌더링
				calendarLoad();
				calendar.render();
				
				$(document).ready(function(){
					$('.timepicker').timepicker({
					    timeFormat: 'HH:mm p',
					    interval: 30,
					    minTime: '9',
					    maxTime: '22:00',
					    startTime: '9:00',
					    dynamic: false,
					    dropdown: true,
					    zindex: 2000
					});
				});
				
				$("#scheduleInsertForm .totalSeat").on("change", function() {
					if($(this).val() <= 0){
						$(this).val(1)
					}
					$("#scheduleInsertForm .leftSeat").val($(this).val())
				})
				.on("#scheduleInsertForm keyup", function() {
					if($(this).val() <= 0){
						$(this).val(1)
					}
					$("#scheduleInsertForm .leftSeat").val($(this).val())
				})
			})	

			// 일정 등록, 수정, 삭제
		
			$(function() {
				// 일정 등록
				$("#insertSchedule").click(function() {
					
					if($("#scheduleInsertForm .startTime").val() == "" || $("#scheduleInsertForm .endTime").val() == ""){
						swal("수강 체험 가능 시간을 입력해주세요.");
						return false;
					}
					
					if($("#scheduleInsertForm .startTime").val() >= $("#scheduleInsertForm .endTime").val()){
						swal("종료 시간은 시작 시간보다 작거나 같을 수 없습니다.");
						return false;
					}
					
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/insertSchedule",
						type : "post",
						data: {
							"${_csrf.parameterName}":"${_csrf.token}",
							"classId" : ${classes.classId},
							"scheduleId" : $("#scheduleInsertForm .scheduleId").val(),
							"scheduleDate" : $("#scheduleInsertForm .scheduleDate").val(),
							"startTime" : $("#scheduleInsertForm .startTime").val(),
							"endTime" : $("#scheduleInsertForm .endTime").val(),
							"totalSeat" : $("#scheduleInsertForm .totalSeat").val(),
							"leftSeat" : $("#scheduleInsertForm .leftSeat").val()
						},
						success : function() {
							calendar.refetchEvents()
							calendar.render();
							$("#insertModal").modal("hide");
						},
						error : function(error) {
							swal("일정을 등록할 수 없습니다.");
						}
					}); // 아작스 종료
				})

				$("#scheduleUpdateForm .totalSeat").on("change", function() {
					if($(this).val() - difference <= 0){
						$(this).val(difference)
					}
					$("#scheduleUpdateForm .leftSeat").val($(this).val() - difference)
				})
				.on("#scheduleUpdateForm keyup", function() {
					if($(this).val() - difference <= 0){
						$(this).val(difference)
					}
					$("#scheduleUpdateForm .leftSeat").val($(this).val() - difference)
				})
				
				// 일정 수정
				$("#updateSchedule").click(function() {
					
					if($("#scheduleUpdateForm .startTime").val() >= $("#scheduleUpdateForm .endTime").val()){
						swal("종료 시간은 시작 시간보다 작거나 같을 수 없습니다.");
						return false;
					}
					
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/updateSchedule",
						type : "post",
						data: {
							"${_csrf.parameterName}":"${_csrf.token}",
							"scheduleId" : $("#scheduleUpdateForm .scheduleId").val(),
							"scheduleDate" : $("#scheduleUpdateForm .scheduleDate").val(),
							"startTime" : $("#scheduleUpdateForm .startTime").val(),
							"endTime" : $("#scheduleUpdateForm .endTime").val(),
							"totalSeat" : $("#scheduleUpdateForm .totalSeat").val(),
							"leftSeat" : $("#scheduleUpdateForm .leftSeat").val()
						},
						success : function() {
							calendar.refetchEvents()
							calendar.render();
							$("#updateModal").modal("hide");
						},
						error : function(error) {
							swal("일정을 수정할 수 없습니다.");
						}
					}); // 아작스 종료
				})
				
				// 일정 삭제
				$("#deleteSchedule").click(function() {
					if(!confirm("삭제한 일정은 복구할 수 없습니다.\n정말 삭제하시겠습니까?")){
						return
					}
					if(difference > 0){
						swal("수강 신청자가 있을 경우 일정을 삭제할 수 없습니다.")
						return false
					}
					
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/deleteSchedule",
						type : "post",
						data: {
							"${_csrf.parameterName}":"${_csrf.token}",
							"scheduleId" : $(this).val()
						},
						success : function() {
							calendar.refetchEvents()
							calendar.render();
							$("#updateModal").modal("hide");
						},
						error : function(error) {
							swal("일정을 삭제할 수 없습니다.");
						}
					})
				})
				
				
			})
		</script>
	</head>
	<body>
		<!-- 모달창 -->
		<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">클래스 일정 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="scheduleInsertForm" method="post" action="">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">클래스 일정</label>
								<input type="text" class="form-control scheduleDate" name="scheduleDate" required readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">시작 시간</label>
								<input type="text" class="timepicker form-control startTime" name="startTime" required readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">종료 시간</label>
								<input type="text" class="timepicker form-control endTime" name="endTime" required readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">수강 가능 인원</label>
								<input type="number" class="form-control totalSeat" name="totalSeat" required>
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">남은 수강 인원</label>
								<input type="number" class="form-control leftSeat" name="leftSeat" required readonly="readonly">
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-primary" id="insertSchedule" value="일정 등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">클래스 일정 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="scheduleUpdateForm" method="post" action="">
							<input type="hidden" class="scheduleId" value="">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">클래스 일정</label>
								<input type="text" class="form-control scheduleDate" name="scheduleDate" required readonly="readonly">
							</div>
							<div class="mb-3 time">
								<label for="recipient-name" class="col-form-label">시작 시간</label>
								<input type="text" class="timepicker form-control startTime updateTime" name="startTime" required readonly="readonly">
								<h6>수강 신청자가 있을 경우 시간을 변경할 수 없습니다.</h6>
							</div>
							<div class="mb-3 time">
								<label for="recipient-name" class="col-form-label">종료 시간</label>
								<input type="text" class="timepicker form-control endTime updateTime" name="endTime" required readonly="readonly">
								<h6>수강 신청자가 있을 경우 시간을 변경할 수 없습니다.</h6>
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">수강 가능 인원</label>
								<input type="number" class="form-control totalSeat" name="totalSeat" required>
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">남은 수강 인원</label>
								<input type="number" class="form-control leftSeat" name="leftSeat" required readonly="readonly">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="deleteSchedule" value="">일정 삭제</button>
								<button type="button" class="btn btn-primary" id="updateSchedule" value="">일정 수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		 <div id='calendar'></div>
		 
		 <%-- <div id="scheduleBox">
		 	<table class="table">
		 		<thead>
		 			<tr>
		 				<th>
		 					클래스 체험일
		 				</th>
		 				<th>
		 					클래스 시작 시간
		 				</th>
		 				<th>
		 					클래스 종료 시간
		 				</th>
		 				<th>
		 					총 수강 가능 인원
		 				</th>
		 				<th>
		 					남은 수강 가능 인원
		 				</th>
		 			</tr>
		 		</thead>
		 		<tbody>
					<c:forEach items="${classes.classSchedules}" var="schedule">
						<tr>
							<td>
								${schedule.scheduleDate.toString().substring(0, 10)}
							</td>
							<td>
								${schedule.startTime}
							</td>
							<td>
								${schedule.endTime}
							</td>
							<td>
								${schedule.totalSeat}명
							</td>
							<td>
								${schedule.leftSeat}명
							</td>
						</tr>
					</c:forEach>
		 		</tbody>
		 	</table>
		 </div> --%>
		 
		 
		
	</body>
</html>