<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			$(function() {
				
				// 클래스 삭제
				$(".delete").on("click", function() {
					swal($(this).val());
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/delete",
						type : "post",
						data : {"classId" : $(this).attr("name"), "${_csrf.parameterName}" : "${_csrf.token}"},
						success : function() {
							location.reload();
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							swal({text: err.message, icon: "error"})
						}
					}); // 아작스 종료
				}) // delete 버튼 클릭
				
				// 클래스 상태 변경
				$(".state_update").on("click", function() {
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/updateState",
						type : "post",
						data : {"classId" : $(this).attr("name"), "stateId" : $(this).val(), "${_csrf.parameterName}" : "${_csrf.token}"},
						success : function() {
							location.reload()
						},
						error: function(xhr, status, error) {
							var err = eval("(" + xhr.responseText + ")");
							swal({text: err.message, icon: "error"})
						}
					}); // 아작스 종료
				}) // update 버튼 클릭
			})
		</script>
	</head>
	<body>
		<c:choose>
			<c:when test="${empty list}">
				클래스가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
				<div class="classList">
					<c:forEach items="${list.content}" var="classes">
						<div class="teacherClassBox">
							<div class="classBoxImg">
								<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
									<img alt="${classes.className} 이미지" src="${pageContext.request.contextPath}/img/class/${classes.classImage}">
								</a>
							</div>
							<div class="classBoxContent">
								<h6 class="classBoxName">
									<a href="${pageContext.request.contextPath}/main/class/${classes.classId}">
										<span>${classes.className}</span>
									</a>
									<form action="${pageContext.request.contextPath}/teacher/class/classSchedule" method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="classId" value="${classes.classId}">
										<button href="submit" class="btn btn-outline-primary btn-sm"><i class="fa-regular fa-calendar-plus"></i></button>
									</form>
								</h6>
								<div class="classBoxInfo">
									<c:choose>
										<c:when test="${classes.classState.stateId == 1}">
											<form action="${pageContext.request.contextPath}/teacher/class/updateClass" method="post">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
												<input type="hidden" name="classId" value="${classes.classId}">
												<button href="submit" class="btn btn-outline-primary btn-sm">클래스 수정</button>
											</form>
											<button href="button" name="${classes.classId}" value="2" class="btn btn-outline-primary btn-sm state_update">공개 신청</button>
										</c:when>
										<c:when test="${classes.classState.stateId == 2}">
											<button href="button" name="${classes.classId}" value="1" class="btn btn-outline-primary btn-sm state_update">공개 신청 취소</button>
										</c:when>
										<c:when test="${classes.classState.stateId == 3}">
											<button href="button" name="${classes.classId}" value="4" class="btn btn-outline-primary btn-sm state_update">클래스 비공개</button>
										</c:when>
										<c:when test="${classes.classState.stateId == 4}">
											<button href="button" name="${classes.classId}" value="3" class="btn btn-outline-primary btn-sm state_update">클래스 공개</button>
										</c:when>
									</c:choose>
									<c:if test="${classes.classState.stateId != 3}">
										<button href="button" name="${classes.classId}" class="btn btn-outline-primary btn-sm delete">클래스 삭제</button>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
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