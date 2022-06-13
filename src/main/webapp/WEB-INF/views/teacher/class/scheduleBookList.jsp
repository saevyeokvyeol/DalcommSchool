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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			.bootstrap-timepicker-widget.dropdown-menu {
    z-index: 1050!important;
}
			#scheduleUpdateForm h6 {display: none;}
		</style>
		<script>
			// 풀캘린더 API 사용
			$(function() {
				var insertModal = document.getElementById('insertModal')
				
				// calendar element 취득
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성하기
				var calendar = new FullCalendar.Calendar(calendarEl, {
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
					displayEventTime: 'true',
					eventClick: function(obj) {
						$.ajax({
							url : "${pageContext.request.contextPath}/book/selectByScheduleId",
							type : "post",
							data : {"scheduleId" : obj.event.id, "${_csrf.parameterName}":"${_csrf.token}"},
							dataType : "json",
							success : function(result) {
								text = '<table class="table"><thead><tr><th>수강 클래스</th><th>수강일</th><th>학생 아이디</th><th>체험자 아이디</th><th>체험자 전화번호</th><th>수강 인원</th><th>결제 금액</th><th>수강 상태</th></tr></thead><tbody>'
								if(result.length == 0){
									text += "<tr>"
									text += "<td colspan='8'>"
									text += "<h3>수강 신청 내역이 없습니다</h3>"
									text += "<td>"
									text += "<tr>"
								} else {
									$.each(result, function(index, item){
										text += "<tr>"
										text += `<td>\${item.className}</td>`
										text += `<td>\${item.classSchedule}</td>`
										text += `<td>\${item.studentId}</td>`
										text += `<td>\${item.bookName}</td>`
										text += `<td>\${item.bookPhone}</td>`
										text += `<td>\${item.bookSeat}명</td>`
										text += `<td>\${item.totalPrice}</td>`
										text += `<td>\${item.bookState}</td>`
										text += "<tr>"
									})
								}
								text += "</tbody></table>"
								$("#teacherBookList").html(text);
							}
						})
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
							url : "${pageContext.request.contextPath}/selectScheduleByTeacherId",
							type : "post",
							data : {"${_csrf.parameterName}":"${_csrf.token}"},
							dataType : "json",
							success : function(result) {
								successCallback(result);
							}
						})
					}
				});
				// 캘린더 렌더링
				calendar.render();
			})
		</script>
	</head>
	<body>
		<div id='calendar'></div>
		 
		<div id="teacherBookList">

		</div>
		 
	</body>
</html>