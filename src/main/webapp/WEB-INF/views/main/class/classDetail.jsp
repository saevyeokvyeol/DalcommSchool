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
		<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmfiqODEsD_SffBbyZp3twBsE-p_brpTE&callback=initialize&v=weekly&region=KR" defer></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
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
					eventDisplay: 'block',
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
					eventRender: function(event, element) {
					    var limit = 20;
					    if (event.title.length > limit) {
					        element.find('.fc-event-title').text(event.title.substr(0,limit)+'...').parent().attr('title', event.title);
					    }
					},
					eventTimeFormat: {
						hour: 'numeric',
						meridiem: false,
					    hour12: false
					}
				});
				
				$("#insertImgBtn").click(function() {
					$("#insertImgInput").click()
				})
				
				$("#insertImgCon img").click(function() {
				    $("#insertImgCon").css("display", "none")
				    $("#insertPreviewImage").attr("src", "")
				    $("#insertImgBtn").css("display", "block")
				    $("#insertImgInput").val("")
				})
				
				function readInsertImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var insertPreview = document.getElementById("insertPreviewImage")
				            insertPreview.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var insertImage = document.getElementById("insertImgInput")
				insertImage.addEventListener("change", e => {
					readInsertImage(e.target)
				    $("#insertImgCon").css("display", "block")
				    $("#insertImgBtn").css("display", "none")
				})
				
				$("#updateImgBtn").click(function() {
					$("#updateImgInput").click()
				})
				
				$("#updateImgCon img").click(function() {
				    $("#updateImgCon").css("display", "none")
				    $("#updatePreviewImage").attr("src", "")
				    $("#updateImgBtn").css("display", "block")
				    $("#updateImgInput").val("")
				})
				
				function readUpdateImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var previewImage = document.getElementById("updatePreviewImage")
				            previewImage.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var inputImage = document.getElementById("updateImgInput")
				inputImage.addEventListener("change", e => {
					readUpdateImage(e.target)
				    $("#updateImgCon").css("display", "block")
				    $("#updateImgBtn").css("display", "none")
				})
				
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
				
				
				// 좋아요 버튼
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

				// 좋아요 버튼
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
				
				// 클래스 후기 아작스
				function classReview(num) {
					$.ajax({
						url: "${pageContext.request.contextPath}/review/selectByClassId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : ${classes.classId}, "page": num},
						dataType : "json",
						success: function(result){
							text = "<tbody>"
							
							if(result.list.length == 0){
								text = "<tr><td><h5 class='no-record'>아직 후기가 없어요!</h5></td></tr>"
							} else {
								$.each(result.list, function(index, item){
									if(item.reviewBlindState == 'T'){
										text += "<tr>"
										text += "<td colspan='6'>"
										text += "블라인드된 글입니다"
										text += "</td>"
										text += "</tr>"
									} else {
										text += "<tr>"
										text += "<td>"
										for(var i = 1; i <= item.reviewRate; i++){
											text += `<i class="fa-solid fa-star text-warning"></i>`
										}
										for(var i = 5; i > item.reviewRate; i--){
											text += `<i class="fa-solid fa-star text-black text-opacity-25"></i>`
										}
										text += "</td>"
										text += "<td>"
										text += `<button class="btn btn-light reviewDetail" value="\${item.reviewId}">`
										text += `\${item.reviewContent.length >= 23 ? item.reviewContent.substring(0, 23).concat("...") : item.reviewContent}`
										if(item.reviewImg != null){
											text += `<i class="fa-solid fa-image"></i>`
										}
										text += "</button>"
										text += "</td>"
										text += "<td>"
										text += `\${item.studentId.replace(/(?<=.{3})./gi, "*")}`
										text += "</td>"
										text += "<td>"
										text += `\${item.reviewInsertDate.toString().substring(0, 10)}`
										text += "</td>"
										text += "<td>"
										text += `<button class="btn btn-light reviewUpdateBtn" value="\${item.reviewId}"><i class="fa-solid fa-pen fa-xs"></i></button>`
										text += "</td>"
										text += "<td>"
										text += `<button class="btn btn-light reviewDeleteBtn" value="\${item.reviewId}"><i class="fa-solid fa-xmark fa-xs"></i></button>`
										text += "</td>"
										text += "</tr>"
										
									}
								})
							}
							text += "</tbody>"
							$("#reviewTable").html(text);
							
							pageText = ""
							
							let doneLoop = false;
							let startPage = result.startPage;
							let blockCount = result.blockCount;
							let endPage = startPage + blockCount - 1
							if(endPage > result.totalPage){
								endPage = result.totalPage
							}
							
							if((startPage - blockCount) > 0 && result.list.length != 0){
								pageText += '<li class="page-item">'
								pageText += `<button class="page-link" value="\${startPage - 1}">이전</button>`
								pageText += '</li>'
							}
							for(i = startPage; i <= endPage; i++){
								if((i - 1) >= endPage){
									doneLoop = true
								}
								if(!doneLoop){
									if(i == num){
										pageText += '<li class="page-item">'
										pageText += `<button class="page-link reviewPage nowReview" value="\${i}">\${i}</button>`
										pageText += '</li>'
									} else{
										pageText += '<li class="page-item">'
										pageText += `<button class="page-link reviewPage" value="\${i}">\${i}</button>`
										pageText += '</li>'
									}
								}
							}
							if((startPage + blockCount) <= result.totalPage){
								pageText += '<li class="page-item">'
								pageText += `<button class="page-link" value="\${startPage + blockCount}">이후</button>`
								pageText += '</li>'
							}
							$(".reviewPaging").html(pageText)
						},
						error: function(err){
							alert("Q&A를 조회할 수 없습니다.")
						}
					})
				} // 클래스 후기 아작스 함수 종료
				
				// 클래스 후기글 특정 페이지로 이동
				$(document).on("click", ".reviewPage", function() {
					classReview($(this).val())
				})
				
				// 클래스 후기글 조회
				$(document).on("click", ".reviewDetail", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/review/read",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "reviewId" : $(this).val()},
						success: function(result){
							$(".reviewDetailRecode").remove();
							
							text = "<tr class='reviewDetailRecode'>"
							text += "<th>"
							text += "</th>"
							text += "<th colspan='3'>"
							if(result.reviewImg != null){
								text += `<img alt="" src="${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}">`
							}
							text += `<div>\${result.reviewContent}</div>`
							text += "</th>"
							text += "<th colspan='2'>"
							text += "</th>"
							text += "</tr>"
							$(this).parent().parent().after(text);
						},
						error: function(err){
							alert("후기를 조회할 수 없습니다.");
						}
					})
				})
				
				// 클래스 후기 등록폼
				$("#reviewInsertModalBtn").click(function() {
					$("#reviewInsertForm .mainImgCon").css("display", "none")
					$("#reviewInsertForm .mainFileBtn").css("display", "block")
					$("#reviewInsertForm [name=reviewContent]").val("")
					$("#reviewInsertForm [name=reviewRate]:checked").prop("checked", false);
				})
				
				// 클래스 후기 등록
				$("#reviewInsertBtn").click(function(){
					$("#reviewInsertForm").ajaxForm({
						url: "${pageContext.request.contextPath}/review/insert?${_csrf.parameterName}=${_csrf.token}",
						type: "post",
						enctype: "multipart/form-data",
						contentType: false,
						processData: false,
						success: function(){
							$('#reviewInsertModal').modal("hide");
							$('body').removeClass('modal-open');
							$('.modal-backdrop').remove();
							classReview(1);
						},
						error:function(xhr, status, error){
							alert(eval("(" + xhr.responseText + ")").message);
						}
					}).submit();
				})
				
				// 클래스 후기 삭제
				$(document).on("click", ".reviewDeleteBtn", function() {
					if(!confirm("정말 후기를 삭제하시겠습니까?")){
						return false
					}
					
					$.ajax({
						url: "${pageContext.request.contextPath}/review/delete",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "reviewId" : $(this).val()},
						success: function(result){
							classReview($(".nowReview").val())
						},
						error: function(err){
							alert("후기를 삭제할 수 없습니다");
						}
					})
				})
				
				// 클래스 후기 수정폼
				$(document).on("click", ".reviewUpdateBtn", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/review/read",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "reviewId" : $(this).val()},
						success: function(result){
							if(result.reviewImg != null){
								$("#updatePreviewImage").attr("src", `${pageContext.request.contextPath}/img/classReview/\${result.reviewImg}`)
								$("#updateImgCon").css("display", "blobk")
								$("#updateImgBtn").css("display", "none")
							} else {
								$("#updatePreviewImage").attr("src", "")
								$("#updateImgCon").css("display", "none")
								$("#updateImgBtn").css("display", "block")
							}
							
							$("#reviewUpdateForm [name=reviewContent]").val(result.reviewContent)
							$("#" + result.reviewRate + "-update").prop("checked", true);
							$("#reviewId").val($(this).val());
							
							$("#reviewUpdateModal").modal("show")
						},
						error: function(err){
							alert("Q&A를 삭제할 수 없습니다");
						}
					})
				})
				
				// 클래스 후기 수정
				$("#reviewUpdateBtn").click(function(){
					$("#reviewUpdateForm").ajaxForm({
						url: "${pageContext.request.contextPath}/review/update?${_csrf.parameterName}=${_csrf.token}",
						type: "post",
						enctype: "multipart/form-data",
						contentType: false,
						processData: false,
						success: function(){
							$('#reviewUpdateModal').modal("hide");
							$('body').removeClass('modal-open');
							$('.modal-backdrop').remove();
							classReview($(".nowReview").val())
						},
						error:function(xhr, status, error){
							alert(eval("(" + xhr.responseText + ")").message);
						}
					}).submit();
				})
				
				// 클래스 문의글 아작스
				function classQna(num) {
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/selectByClassId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : ${classes.classId}, "page": num},
						dataType : "json",
						success: function(result){
							text = "<tbody>"
							
							if(result.list.length == 0){
								text = "<tr><td><h5 class='no-record'>아직 질문이 없어요!</h5></td></tr>"
							} else {
								$.each(result.list, function(index, item){
									if(item.blindState == 'T'){
										text += "<tr>"
										text += "<td colspan='6'>"
										text += "블라인드된 글입니다"
										text += "</td>"
										text += "</tr>"
										
									} else {
										text += "<tr>"
										text += "<td>"
										if(item.qnaComplete == 'F'){
											text += `<span class="badge bg-secondary">미답변</span>`
										} else {
											text += `<span class="badge bg-primary">답변 완료</span>`
										}
										text += "</td>"
										text += "<td>"
										text += `<button class="btn btn-light qnaDetail" value="\${item.qnaId}">`
										text += `\${item.qnaTitle}`
										if(item.secretState == "T"){
											text += '<i class="fa-solid fa-lock"></i>'
										}
										text += "</button>"
										text += "</td>"
										text += "<td>"
										text += `\${item.studentId.replace(/(?<=.{3})./gi, "*")}`
										text += "</td>"
										text += "<td>"
										text += `\${item.qnaInsertDate.toString().substring(0, 10)}`
										text += "</td>"
										text += "<td>"
										if(item.qnaComplete == 'F'){
											text += `<button class="btn btn-light qnaUpdateBtn" value="\${item.qnaId}"><i class="fa-solid fa-pen fa-xs"></i></button>`
										}
										text += "</td>"
										text += "<td>"
										text += `<button class="btn btn-light qnaDeleteBtn" value="\${item.qnaId}"><i class="fa-solid fa-xmark fa-xs"></i></button>`
										text += "</td>"
										text += "</tr>"
										
									}
								})
							}
							text += "</tbody>"
							$("#qnaTable").html(text);
							
							pageText = ""
							
							let doneLoop = false;
							let startPage = result.startPage;
							let blockCount = result.blockCount;
							let endPage = startPage + blockCount - 1
							if(endPage > result.totalPage){
								endPage = result.totalPage
							}
							
							if((startPage - blockCount) > 0 && result.list.length != 0){
								pageText += '<li class="page-item">'
								pageText += `<button class="page-link" value="\${startPage - 1}">이전</button>`
								pageText += '</li>'
							}
							for(i = startPage; i <= endPage; i++){
								if((i - 1) >= endPage){
									doneLoop = true
								}
								if(!doneLoop){
									if(i == num){
										pageText += '<li class="page-item">'
										pageText += `<button class="page-link qnaPage nowQna" value="\${i}">\${i}</button>`
										pageText += '</li>'
									} else{
										pageText += '<li class="page-item">'
										pageText += `<button class="page-link qnaPage" value="\${i}">\${i}</button>`
										pageText += '</li>'
									}
								}
							}
							if((startPage + blockCount) <= result.totalPage){
								pageText += '<li class="page-item">'
								pageText += `<button class="page-link" value="\${startPage + blockCount}">이후</button>`
								pageText += '</li>'
							}
							$(".qnaPaging").html(pageText)
						},
						error: function(err){
							alert("Q&A를 조회할 수 없습니다.")
						}
					})
				} // 클래스 문의글 아작스 함수 종료
				
				// 클래스 문의글 특정 페이지로 이동
				$(document).on("click", ".qnaPage", function() {
					classQna($(this).val())
				})
				
				// 클래스 문의글 등록폼
				$("#qnaInsertFormBtn").click(function() {
					$("#qnaInsertTitle").val("")
					$("#qnaInsertContent").val("")
					$("[name=qnaInsertSecretState]:checked").prop("checked", false);
				})
				
				// 클래스 문의글 등록
				$("#qnaInsertBtn").click(function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/qnaInsert",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : ${classes.classId},
							"qnaTitle": $("#qnaInsertTitle").val(), "qnaContent": $("#qnaInsertContent").val(), "secretState": $("[name=qnaInsertSecretState]:checked").val()},
						success: function(){							
							classQna(1)
							$('#qnaInsertForm').modal("hide");
							$('body').removeClass('modal-open');
							$('.modal-backdrop').remove();
						},
						error: function(err){
							alert("Q&A를 등록할 수 없습니다.")
						}
					})
				})
				
				// 클래스 문의글 조회
				$(document).on("click", ".qnaDetail", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/selectByQnaId",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "qnaId" : $(this).val()},
						success: function(result){
							$(".qnaDetailRecode").remove();
							
							text = "<tr class='qnaDetailRecode'>"
							text += "<th>"
							text += "</th>"
							text += "<td>"
							text += `\${result.qnaContent}`
							text += "</td>"
							text += "<td colspan='4'>"
							text += "</td>"
							text += "</tr>"
							text += "<tr class='qnaDetailRecode'>"
							text += "<td>"
							text += "</td>"
							if(result.replyContent == null){
								text += "<td colspan=5'>"
								text += `아직 답변이 등록되지 않았습니다.`
							} else {
								text += "<td>"
								text += `\${result.replyContent}`
								text += "</td>"
								text += "<td>"
								text += `\${result.teacherNickname}`
								text += "</td>"
								text += "<td>"
								text += `\${result.replyInsertDate.toString().substring(0, 10)}`
								text += "</td>"
								text += "<td colspan='2'>"
							}
							text += "</td>"
							text += "</tr>"
							$(this).parent().parent().after(text);
						},
						error: function(err){
							alert("Q&A를 조회할 수 없습니다.");
						}
					})
				})
				
				$(document).on("click", ".qnaDeleteBtn", function() {
					if(!confirm("정말 Q&A를 삭제하시겠습니까?")){
						return false
					}
					
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/qnaDelete",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "qnaId" : $(this).val()},
						success: function(result){
							classQna($(".nowQna").val())
						},
						error: function(err){
							alert("Q&A를 삭제할 수 없습니다");
						}
					})
				})
				
				$(document).on("click", ".qnaUpdateBtn", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/qnaUpdateForm",
						type: "post",
						context: this,
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "qnaId" : $(this).val()},
						success: function(result){
							$("#qnaIdInput").val(result.qnaId)
							$("#qnaUpdateTitle").val(result.qnaTitle)
							$("#qnaUpdateContent").val(result.qnaContent)
							
							if(result.secretState == "F"){
								$("[name=qnaSecretState]").prop("checked", false);
							} else {
								$("[name=qnaSecretState]").prop("checked", true);
							}
							
							$("#qnaUpdateForm").modal("show")
						},
						error: function(err){
							alert("Q&A를 삭제할 수 없습니다");
						}
					})
				})
				
				$("#qnaUpdateBtn").click(function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/board/qna/qnaUpdate",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : ${classes.classId}, "qnaId" : $("#qnaIdInput").val(),
							"qnaTitle": $("#qnaUpdateTitle").val(), "qnaContent": $("#qnaUpdateContent").val(), "secretState": $("[name=qnaUpdateSecretState]:checked").val()},
						success: function(){
							
							classQna($(".nowQna").val())
							$('#qnaUpdateForm').modal("hide");
							$('body').removeClass('modal-open');
							$('.modal-backdrop').remove();
						},
						error: function(err){
							alert("Q&A를 수정할 수 없습니다.")
						}
					})
				})
				
				classQna(1)
				classReview(1)
			})
			
		var geocoder;
		var map;
		
		function initialize() {
		  geocoder = new google.maps.Geocoder();
		  var latlng = new google.maps.LatLng(37.534089572097, 127.1450466624);
		  var mapOptions = {
		    zoom: 16,
		    center: latlng
		  }
		  map = new google.maps.Map(document.getElementById('map'), mapOptions);
		}
			  
		function codeAddress() {
		    var address = document.getElementById('placeAddr').value;
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == 'OK') {
		    	  
		    	  var lat = results[0].geometry.location.lat();
		 	      var lng = results[0].geometry.location.lng(); 
		    	  
		        map.setCenter(results[0].geometry.location);
		        var marker = new google.maps.Marker({
		            map: map,
		            position: results[0].geometry.location
		        });
		        
		      } else {
		        alert('Geocode was not successful for the following reason: ' + status);
		      }
		    });
		}
			  
		$(function(){	
			codeAddress();
		})
		</script>
	</head>
	<body>
		<!-- 클래스 후기 조회 모달 -->
		<div class="modal fade" id="reviewSelectForm" tabindex="-1" aria-labelledby="reviewSelectFormLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="reviewSelectFormLabel">클래스 후기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 클래스 후기 등록 모달 -->
		<div class="modal fade" id="reviewInsertModal" tabindex="-1" aria-labelledby="reviewInsertModalFormLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="reviewInsertForm">
						<div class="modal-header">
							<h5 class="modal-title" id="reviewInsertModalLabel">클래스 후기 등록</h5>
							<input type="hidden" name="classId" value="${classes.classId}"/>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="starRate mb-3">
								<input type="radio" id="5-insert" name="reviewRate" value="5"/>
								<label for="5-insert"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="4-insert" name="reviewRate" value="4"/>
								<label for="4-insert"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="3-insert" name="reviewRate" value="3"/>
								<label for="3-insert"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="2-insert" name="reviewRate" value="2"/>
								<label for="2-insert"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="1-insert" name="reviewRate" value="1"/>
								<label for="1-insert"><i class="fa-solid fa-star fa-2xl"></i></label>
							</div>
							<div class="modalImageBox mb-3">
								<div class="image-container" id="insertImgCon">
								    <a><img id="insertPreviewImage" src=""></a>
								</div>
								<button type="button" class="fileBtn" id="insertImgBtn">
									<i class="fa-regular fa-image fa-2xl"></i>
									후기 이미지 등록
								</button>
								<input type="file" id="insertImgInput" name="file">
							</div>
							<div class="form-floating">
								<textarea class="form-control" name="reviewContent" placeholder="내용" style="height: 150px"></textarea>
								<label for="reviewContent">내용</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="reviewInsertBtn">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 클래스 후기 수정 모달 -->
		<div class="modal fade" id="reviewUpdateModal" tabindex="-1" aria-labelledby="reviewUpdateModalFormLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="reviewUpdateForm" method="post" enctype="multipart/form-data">
						<div class="modal-header">
							<h5 class="modal-title" id="reviewUpdateModalLabel">클래스 후기 수정</h5>
							<input type="hidden" name="reviewId" id="reviewId">
							<input type="hidden" name="classId" value="${classes.classId}"/>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="starRate mb-3">
								<input type="radio" id="5-update" name="reviewRate" value="5"/>
								<label for="5-update"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="4-update" name="reviewRate" value="4"/>
								<label for="4-update"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="3-update" name="reviewRate" value="3"/>
								<label for="3-update"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="2-update" name="reviewRate" value="2"/>
								<label for="2-update"><i class="fa-solid fa-star fa-2xl"></i></label>
								<input type="radio" id="1-update" name="reviewRate" value="1"/>
								<label for="1-update"><i class="fa-solid fa-star fa-2xl"></i></label>
							</div>
							<div class="modalImageBox mb-3">
								<div class="image-container" id="updateImgCon">
								    <a><img id="updatePreviewImage" src=""></a>
								</div>
								<button type="button" class="fileBtn" id="updateImgBtn">
									<i class="fa-regular fa-image fa-2xl"></i>
									후기 이미지 등록
								</button>
								<input type="file" id="updateImgInput" name="file">
							</div>
							<div class="form-floating">
								<textarea class="form-control" name="reviewContent" placeholder="내용" style="height: 150px"></textarea>
								<label for="qnaContent">내용</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="reviewUpdateBtn">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 클래스 Q&A 등록 모달 -->
		<div class="modal fade" id="qnaInsertForm" tabindex="-1" aria-labelledby="qnaInsertFormLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="qnaInsertFormLabel">클래스 Q&A 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="qnaInsertTitle" placeholder="제목">
							<label for="qnaTitle">제목</label>
						</div>
						<div class="form-floating mb-3">
							<textarea class="form-control" placeholder="내용" id="qnaInsertContent" style="height: 100px"></textarea>
							<label for="qnaContent">내용</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="T" name="qnaInsertSecretState" id="qnaInsertSecretState">
							<label class="form-check-label" for="secretState">비밀글</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="qnaInsertBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 클래스 Q&A 수정 모달 -->
		<div class="modal fade" id="qnaUpdateForm" tabindex="-1" aria-labelledby="qnaUpdateFormLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<input type="hidden" id="qnaIdInput">
						<h5 class="modal-title" id="qnaUpdateFormLabel">클래스 Q&A 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="qnaUpdateTitle" placeholder="제목">
							<label for="qnaUpdateTitle">제목</label>
						</div>
						<div class="form-floating mb-3">
							<textarea class="form-control" placeholder="내용" id="qnaUpdateContent" style="height: 100px"></textarea>
							<label for="qnaUpdateContent">내용</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="T" name="qnaUpdateSecretState" id="qnaUpdateSecretState">
							<label class="form-check-label" for="qnaUpdateSecretState">비밀글</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="qnaUpdateBtn">수정</button>
					</div>
				</div>
			</div>
		</div>
	
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
							<h6><i class="fa-solid fa-location-dot"></i>${classes.teacher.place.placeRegion.regionName}</h6>
					</div>
					<h4 class="classBoxPrice"><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</h4>

					<hr>
					<h6>${classes.classInfo}</h6>
					
					<div class="classInfoBox" id="teacher">
						<h4 class="classBoxName">강사 소개</h4>
					<hr>
					<!-- 여기부터 지도 -->
					<div class="classInfoBox" id="review">
						<h4 class="classBoxName">공방 정보</h4>
						<hr>
						
						<h5>${classes.teacher.place.placeName}</h5>
					    ${classes.teacher.place.placeAddr} ${classes.teacher.place.detailAddr}
					    <div id="route">${classes.teacher.place.placeRoute}</div>
					    <input type="hidden" id="placeAddr" value="${classes.teacher.place.placeAddr}">
		    			<div id="map"></div>
					    <ul class="infraList">
					    	<c:if test="${classes.teacher.place.placeInfra != null}">
					    		<c:forEach items="${classes.teacher.place.placeInfra}" var="placeInfra">
					    			<li>
						    			<c:choose>
						    				<c:when test="${placeInfra.infra.infraId == 1}">
						    					<i class="fa-solid fa-square-parking fa-xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 2}">
						    					<i class="fa-solid fa-wifi fa-xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 3}">
						    					<i class="fa-solid fa-elevator fa-xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 4}">
						    					<i class="fa-solid fa-restroom fa-xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 5}">
						    					<i class="fa-solid fa-baby-carriage fa-xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 6}">
						    					<i class="fa-solid fa-paw fa-2xl"></i>
						    				</c:when>
						    				<c:when test="${placeInfra.infra.infraId == 7}">
						    					<i class="fa-brands fa-accessible-icon fa-xl"></i>
						    				</c:when>
						    			</c:choose>
						    			<div>${placeInfra.infra.infraName}</div>
					    			</li>
					    		</c:forEach>
					    	</c:if>
					    </ul>
					</div>
						
						
					</div>
					<div class="classInfoBox" id="review">
						<h4 class="classBoxName">
							클래스 후기
							<button type="button" class="btn btn-outline-primary" id="reviewInsertModalBtn" data-bs-toggle="modal" data-bs-target="#reviewInsertModal">후기 등록</button>
						</h4>
						<hr>
						<div class="boardTable">
							<table class="table" id="reviewTable">
							</table>
						</div>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center reviewPaging">
							</ul>
						</nav>
					</div>
					<div class="classInfoBox" id="QnA">
						<h4 class="classBoxName">
							클래스 Q&A
							<button type="button" class="btn btn-outline-primary" id="qnaInsertFormBtn" data-bs-toggle="modal" data-bs-target="#qnaInsertForm">Q&A 등록</button>
						</h4>
						<hr>
						<div class="boardTable">
							<table class="table" id="qnaTable">
							</table>
						</div>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center qnaPaging">
							</ul>
						</nav>
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
		</div>
	</body>
</html>
			 