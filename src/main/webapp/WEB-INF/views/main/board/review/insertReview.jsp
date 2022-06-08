<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 후기 등록 폼입니다.</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

</head>
<body>
클래스 후기 등록 폼입니다.


  <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">클래스 후기 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="scheduleInsertForm" method="post" action="">
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="recipient-name" class="col-form-label">작성자</label> -->
<!-- 						<b><sec:authentication property="principal.userId"></b> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">별점</label>
						<div class="starpoint_wrap">
						  <div class="starpoint_box">
						    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						  </div>
						</div>
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">내용</label>
						<textarea rows="" cols="" name="reviewContent"></textarea>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-primary" id="insertSchedule" value="일정 등록">
					</div>
				</form>
			</div>
		</div>
	</div>
  </div>


</body>
</html>