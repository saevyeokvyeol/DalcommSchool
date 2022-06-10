<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
		<script type="text/javascript">
			$(function() {
				// calendar element 취득
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성하기
				function calendarLoad() {
					calendar = new FullCalendar.Calendar(calendarEl, {
						height: '680px', // calendar 높이 설정
						slotMinTime: '09:00', // Day 캘린더에서 시작 시간
						slotMaxTime: '22:00', // Day 캘린더에서 종료 시간
						// 해더에 표시할 툴바
						headerToolbar: {
							left: 'prevYear,prev',
							center: 'title',
							right: 'next,nextYear'
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
									alert("일정을 가져올 수 없습니다.");
								}
							}); // 아작스 종료
							
							$("#updateModal").modal("show");
						},
						select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
							var now = new Date();
							var constraint = new Date(now.setDate(now.getDate() + 7));
							
							/* if(constraint >= arg.start){
								alert("오늘로부터 일주일 이내에는 일정을 등록할 수 없습니다.")
								return;
							} */
							
							$(".startTime").val("");
							$(".endTime").val("");
							$(".totalSeat").val("");
							$(".leftSeat").val("");
							
							$(".scheduleDate").val(arg.start.toLocaleDateString());
							
						    $("#insertModal").modal("show");
				        },
						events: function(info, successCallback, failureCallback){
							$.ajax({
								url : "${pageContext.request.contextPath}/book/selectCalendarByStudentId",
								type : "post",
								data : {"${_csrf.parameterName}":"${_csrf.token}"},
								dataType : "json",
								success : function(result) {
									successCallback(result);
								},
								error: function(error) {
									alert();
								}
							})
						}
					});
				}
			
				// 캘린더 렌더링
				calendarLoad();
				calendar.render();
				
				$(".updateSchedule").on("click", function() {
					$("#bookIdBox").val($(this).val())
					$.ajax({
						url: "${pageContext.request.contextPath}/selectAvailableSchedule",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: $(this).val()},
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
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
					$("#updateSchedule").modal("show");
				})
				
				$("#updateScheduleSubmit").on("click", function() {
					if($("#scheduleSelect").val() == 0) {
						$("#updateSchedule").modal("hide");
						return false;
					}
					$.ajax({
						url: "${pageContext.request.contextPath}/book/updateSchedule",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: $("#bookIdBox").val(), scheduleId: $("#scheduleSelect").val()},
						success: function(result){
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
				
				$(".bookFinish").on("click", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/book/updateFinish",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: $(this).val()},
						success: function(){
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							alert(err.message);
						}
					})
				})
				
				$(".bookCancel").on("click", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/book/bookCancel",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}", bookId: $(this).val()},
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
								<input type="hidden" id="bookIdBox" value="">
								<label for="recipient-name" class="col-form-label">남은 수강 인원</label>
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
		
		<h3>예약 캘린더</h3>
		
		<div id='calendar'></div>
		
	</body>
</html>