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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.4/jquery.timepicker.min.js"></script>
		<style type="text/css">
			.bootstrap-timepicker-widget.dropdown-menu {
			    z-index: 1050!important;
			}
			
			#bookForm {display: none;}

			#classOrder {
				width: 430px; position: fixed;
			}
			
			#bookSeat {
				width: 100px; display: inline; text-align: center;
			}
			
			/* 클래스 후기 CSS */
			fieldset input[type=radio]{display: none;}
			fieldset input[type=radio]:checked~label{text-shadow: 0 0 0 #EB5353;}
			fieldset{display: inline-block; direction: rtl; border: 0;}
			
			.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
			.star:hover{text-shadow: 0 0 0 #EB5353;}
			.star:hover~label{text-shadow: 0 0 0 #EB5353;}
			
			textarea{width:100%; height:6.25em; resize:none;}
		</style>
		<script>
			// 풀캘린더 API 사용
			$(function() {
				// calendar element 취득
				var calendarEl = $('#calendar')[0];
				// full-calendar 생성하기
				var calendar = new FullCalendar.Calendar(calendarEl, {
					height: '460px', // calendar 높이 설정
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
							dataType : "json",
							success : function(result) {
								var date = new Date(`\${result.scheduleDate}`)
								$("#scheduleId").val(`\${result.scheduleId}`)
								$("#scheduleDate").val(date.toLocaleDateString())
								$("#scheduleTime").val(`\${result.startTime} ~ \${result.endTime}`)
								$("#leftSeat").val(`\${result.leftSeat}명`)
								
								if(parseInt($("#leftSeat").val()) == 0){
									$("#bookSeat").val(`0`);
								}
								
								$("#bookSeat").attr("max", `\${result.leftSeat}`)
								calTotalPrice()
								$("#bookForm").css("display", "block");
								$("#calendar").css("display", "none");
							}
						})
					}, // 이벤트 클릭 종료
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
					},
					eventTimeFormat: {
						hour: 'numeric',
						meridiem: false,
					    hour12: false
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
					
					if(1 > parseInt($("#leftSeat").val())){
						updateNum = 0;
					} else if (updateNum <= 0){
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
				
				$("#calendarShow").click(function() {
					$("#bookForm").css("display", "none");
					$("#calendar").css("display", "");
				})
				
				$(document).on("click", "button[name=none-like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/insert",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-solid fa-heart fa-lg"></i>');
							$(this).attr("name", "like");
							$(this).attr("value", `\${result.likeId}`);
						},
						error: function(err){
						}
					})
				})

				$(document).on("click", "button[name=like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/deleteByLikeId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "likeId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-regular fa-heart fa-lg"></i>');
							$(this).attr("name", "none-like")
							$(this).attr("value", `\${result}`);
						},
						error: function(err){
							alert(123)
						}
					})
				})
			})
		</script>
	</head>
	<body>
		<div class="main-content">
			<div id="classDetail">
				<div id="classInfomation">
					<div class="classImageBox">
						<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${classes.classImage}">
					</div>
					
					<div id="classBox">
						<h4 class="className">
							<span>${classes.className}</span>
							<c:choose>
								<c:when test="${classes.likeId != null}">
									<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="like" value="${classes.likeId}">
										<i class="fa-solid fa-heart fa-lg"></i>
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-outline-primary shadow-none btn-sm likeBtn" name="none-like" value="${classes.classId}">
										<i class="fa-regular fa-heart fa-lg"></i>
									</button>
								</c:otherwise>
							</c:choose>
						</h4>
					</div>
					
					<div id="classBoxInfo">
							<h5>${classes.teacher.teacherNickname} 선생님</h5>
							<h6><i class="fa-solid fa-cookie-bite"></i><span>${classes.classCategory.categoryName}</h5>
							<h6><i class="fa-solid fa-location-dot"></i>${classes.teacher.place.placeRegion.regionName}서울</h6>
					</div>
					<h4 class="classBoxPrice"><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</h4>

					<hr>
					<h6>${classes.classInfo}</h6>
					
					<div class="classInfoBox" id="teacher">
						<h4 class="classBoxName">강사 소개</h4>
					<hr>
					</div>
					<div class="classInfoBox" id="review">
						<h4 class="classBoxName">클래스 후기</h4>
					<hr>
					</div>
					<div class="classInfoBox" id="QnA">
						<h4 class="classBoxName">클래스 Q&A</h4>
					<hr>
					</div>
				</div>
				<div id="classOrderCalendar">
				
					<div id="classOrder">
						<div id='calendar'>
						</div>
						
						
						<form action="${pageContext.request.contextPath}/main/book/bookForm" id="bookForm" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="classId" value="${classes.classId}">
							<input type="hidden" name="scheduleId" id="scheduleId">
							<table class="table option-table table-borderless orderTable">
								<tbody>
									<tr>
										<td colspan="2">
											<button type="button" class="btn btn-outline-primary" id="calendarShow"><i class="fa-solid fa-angles-left"></i> 일정 다시 고르기</button>
										</td>
									</tr>
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
							<button type="submit" class="form-control btn btn-primary btn-lg" id="order">주문하기</button>
						</form>
					</div>
				</div>
			</div>
			
			
	<%-- 		 <table>
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
			 --%>
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
			<%-- 
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
			 --%>
		</div>
	</body>
</html>
			 