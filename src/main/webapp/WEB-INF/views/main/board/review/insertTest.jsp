<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 후기 등록 폼입니다.</title>
<style type="text/css">
	fieldset input[type=radio]{display: none;}
	fieldset input[type=radio]:checked~label{text-shadow: 0 0 0 #EB5353;}
	fieldset{display: inline-block; direction: rtl; border: 0;}
	
	.star{font-size: 2em; color: transparent; text-shadow: 0 0 0 #b3b3b3;}
	.star:hover{text-shadow: 0 0 0 #EB5353;}
	.star:hover~label{text-shadow: 0 0 0 #EB5353;}
	
	textarea{width:100%; height:6.25em; resize:none;}
</style>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>

<script type="text/javascript">
function getImage(input){
	if(input.files && input.files[0]){
		var reader = new FileReader()
		
		reader.readAsDataURL(input.files[0])
		}
	}
}
	
	
</script>
</head>
<body>
클래스 후기 등록 폼입니다.
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">클래스 후기 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="reviewInsertForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/main/board/review/insert?${_csrf.parameterName}=${_csrf.token}">
				<input type="hidden" name="classId" value="1">
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
                        <input class="form-control" type="file" id="formFileMultiple" name="file" accept="image/*" multiple>
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