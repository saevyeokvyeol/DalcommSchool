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
		
		<h3>예약 목록</h3>
		
		<div id='calendar'></div>
		
	</body>
</html>