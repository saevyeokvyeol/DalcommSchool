<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		<h3>예약 목록</h3>
		<div id="bookListBox">
				
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>
								예약일
							</th>
							<th>
								클래스명
							</th>
							<th>
								수강일
							</th>
							<th>
								인원
							</th>
							<th>
								결제금액
							</th>
							<th>
								예약상태
							</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${list.content.size() == 0}">
								<tr>
									<td id="none" colspan="6">
										<h4>예약한 클래스가 없어요</h4>
										<a href="${pageContext.request.contextPath}/main/class/classList" class="btn btn-primary">클래스 예약하러 가기</a>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list.content}" var="book">
									<tr>
										<td>
											${book.bookInsertDate.toString().substring(0, 10)}
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/main/mypage/book/${book.bookId}">${book.classes.className}</a>
										</td>
										<td>
											${book.classSchedule.scheduleDate.toString().substring(0, 10)}
										</td>
										<td>
											${book.bookSeat}명
										</td>
										<td>
											<fmt:formatNumber value="${book.totalPrice}" pattern="#,###" />원
										</td>
										<td>
											${book.bookState.bookStateName}
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
			</div>
		</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:set var="doneLoop" value="false" />
					<c:if test="${(startPage-blockCount) > 0 and list.content.size() != 0}">
						<li class="page-item">
							<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
						</li>
					</c:if>
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
							<c:if test="${(i-1)>=list.getTotalPages()}">
								<c:set var="doneLoop" value="true" />
							</c:if>
							<c:if test="${not doneLoop}">
								<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
					<c:if test="${(startPage+blockCount) <= list.getTotalPages()}">
						<li class="page-item">
							<a class="page-link" href="${URL}?${location.search}page=${startPage+blockCount}">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
	</body>
</html>