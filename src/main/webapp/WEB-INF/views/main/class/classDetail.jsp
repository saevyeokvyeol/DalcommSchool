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
				<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>
		<style type="text/css">
			.bootstrap-timepicker-widget.dropdown-menu {
			    z-index: 1050!important;
			}
			#bookForm {display: none;}
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
						left: 'prev',
						center: 'title',
						right: 'next'
					},
					initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
					navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					editable: false, // 수정 가능?
					selectable: false, // 달력 일자 드래그 설정가능
					nowIndicator: true, // 현재 시간 마크
					dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
					navLinks: false,
					locale: 'ko', // 한국어 설정
					eventClick: function(obj) {
						$.ajax({
							url : "${pageContext.request.contextPath}/selectScheduleByScheduleId",
							type : "post",
							data: {"scheduleId" : obj.event.id, "${_csrf.parameterName}":"${_csrf.token}",},
							dataType : "json",
							success : function(result) {
								var date = new Date(`\${result.scheduleDate}`)
								$("#scheduleId").val(`\${result.scheduleId}`)
								$("#scheduleDate").val(date.toLocaleDateString())
								$("#scheduleTime").val(`\${result.startTime} ~ \${result.endTime}`)
								$("#leftSeat").val(`\${result.leftSeat}명`)
								$("#bookSeat").attr("max", `\${result.leftSeat}`)
								calTotalPrice()
								$("#bookForm").css("display", "block");
							}
						})
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
				
				// 캘린더 랜더링
				calendar.render();
				
				function calTotalPrice() {
					classPrice = $("#classPrice").val();
					bookSeat = $("#bookSeat").val();
					
					$("#totalPrice").val(classPrice * bookSeat);
		    	}
				
				// 수량 감소
				$(document).on("click", "button[name=minus]", function() {
					let updateNum = parseInt($(this).next().val()) - 1;
					if(updateNum <= 0){
						updateNum = 1;
					}
					$(this).next().val(updateNum);
					calTotalPrice();
				}); // 수량 감소 종료
				
				// 수량 증가
				$(document).on("click", "button[name=plus]", function() {
					let updateNum = parseInt($(this).prev().val()) + 1;
					if(updateNum > parseInt($("#leftSeat").val())){
						updateNum = parseInt($("#leftSeat").val());
					}
					$(this).prev().val(updateNum);
					calTotalPrice();
				}); // 수량 증가 종료
			});

			$(function(){
				//페이징처리 아작스
				function reviewPaging(){
					$.ajax({
						url: "${pageContext.request.contextPath}/main/board/review/reviewList/{classId}",
						type: "post",
						dataType: "json",
						data: {
							"${_csrf.parameterName}":"${_csrf.token}",
							"nowPage" : ${nowPage}
						},
						success : function(result){
							alert("성공");
							let str="";
							$.each(result.content, function(index, item){
								str+="<tr>";
								str+=`<td>${item.studentId}</td>`;
								str+=`<td>${item.reviewRate}</td>`;
								str+=`<td>${item.reviewContent}</td>`;
								str+=`<td>${item.reviewInsertDate}</td>`;
								str+="</tr>";
							})
							$("#review").after(str);
						},
						error : function(error){
							alert("페이징처리 실패했습니다.")
						}
					})
				}
				reviewPaging();
			})
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
		
		<form action="${pageContext.request.contextPath}/main/book/bookForm" id="bookForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="classId" value="${classes.classId}">
			<input type="hidden" name="scheduleId" id="scheduleId">
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
							<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="minus"><i class="fa-solid fa-minus"></i></button>
							<input type="number" class="form-control-plaintext num" name="bookSeat" id="bookSeat" min="1" max="9999" step="1" value="1" readonly="readonly">
							<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="plus"><i class="fa-solid fa-plus"></i></button>
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
			<button type="submit" class="form-control btn btn-dark shadow-none btn-lg" id="order">주문하기</button>
		</form>
		
		 <table>
		  <thead>
		    <tr>
		      <th>아이디</th>
		      <th>별점</th>
		      <th>내용</th>
		      <th>작성 날짜</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:choose>
		      <c:when test="${requestScope.classReviews.content==null}">
		        <tr>
		          <th colspan="4">
		            <span>등록된 후기가 없습니다.</span>
		          </th>
		        </tr>
		      </c:when>
		      <c:otherwise>
		        <c:forEach items="${classReviews.content}" var="review">
		          <div id="review">
		          <tr>
		            <td><span>${review.student.studentId}</span></td>
		            <td><span>${review.reviewRate}</span></td>
		            <td><span>${review.reviewContent}</span></td>
		            <td><span>${review.reviewInsertDate}</span></td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		  <tfoot>
		    <input type="button" value="후기 남기기" onclick="location.href='${pageContext.request.contextPath}/main/board/review/insertForm'">
		  </tfoot>
		</table>
		
		<!-- 페이징 처리 -->
<!-- 		<div> -->
<!-- 		  <nav class="pagination-container"> -->
<!-- 		    <div class="pagination"> -->
<%-- 		      <c:set var="doneLoop" value="false"/> --%>
<%-- 		      		<c:if test="${(startPage-blockCount)>0 }"> --%>
<%-- 		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/review/reviewList/{classId}?nowPage=${startPage-1}">이전</a>	      		 --%>
<%-- 		      		</c:if> --%>
		      		
<!-- 		      		<span class="pagination-inner"> -->
<%-- 		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}"> --%>
		      		    
<%-- 		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}"> --%>
<%-- 		      		      <c:set var="doneLoop" value="true"/> --%>
<%-- 		      		    </c:if> --%>
<%-- 		      		    <c:if test="${not doneLoop}"> --%>
<%-- 		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/review/reviewList/${classId}?nowPage=${i}">${i}</a> --%>
<%-- 		      		    </c:if> --%>
		      		    
<%-- 		      		  </c:forEach> --%>
<!-- 		      		</span> -->
		      		
<%-- 		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}"> --%>
<%-- 		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/review/reviewList/${classId}?nowPage=${startPage+blockCount}">다음</a> --%>
<%-- 		      		</c:if> --%>
<!-- 		    </div> -->
		  
<!-- 		  </nav> -->
<!-- 		</div> -->
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			후기 등록하기
		</button>
		
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">클래스 후기 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="reviewInsertForm" method="post" action="${pageContext.request.contextPath}/main/board/review/insert">
					<fieldset>
					  <label for="recipient-name" class="col-form-label">별점</label>
				        <input type="radio" name="reviewRate" value="5" id="rate1"><label for="rate1" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
				        <input type="radio" name="reviewRate" value="4" id="rate2"><label for="rate2" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
				        <input type="radio" name="reviewRate" value="3" id="rate3"><label for="rate3" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
				        <input type="radio" name="reviewRate" value="2" id="rate4"><label for="rate4" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
				        <input type="radio" name="reviewRate" value="1" id="rate5"><label for="rate5" class="star"><i class="fa-solid fa-star fa-sm"></i></label>
					</fieldset>
					<div class="mb-3">
                        <label for="formFileMultiple" class="form-label">이미지 첨부</label>
                        <input class="form-control" type="file" id="formFileMultiple" name="reviewImg" multiple>
                    </div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label>
						<textarea name="reviewContent" placeholder="후기를 자유롭게 입력해주세요."></textarea>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" id="insertReview" value="후기 등록">
					</div>
				</form>
			</div>
		</div>
	</div>
  </div>
		
	</body>
</html>