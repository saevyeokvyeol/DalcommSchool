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
		<style type="text/css">
			.mainFileBtn {
				display: none;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$("img").click(function() {
					$("#input-image").click()
				})
				
				function readImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var previewImage = document.getElementById("preview-image")
				            previewImage.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var inputImage = document.getElementById("input-image")
				inputImage.addEventListener("change", e => {
				    readImage(e.target)
				})
			})
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/teacher/mypage/updateTeacherProfile?${_csrf.parameterName}=${_csrf.token}"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="teacherId" value="${teacher.teacherId}">
			<table id="classTable">
				<tr>
					<td>
						<div class="mb-3">
							<div class="profileImgCon">
								<c:choose>
									<c:when test="${teacher.teacherImg == null}">
										<a><img id="preview-image" src="${pageContext.request.contextPath}/img/teacher/Profile.png"></a>
									</c:when>
									<c:otherwise>
										<a><img id="preview-image" src="${pageContext.request.contextPath}/img/teacher/${teacher.teacherImg}"></a>
									</c:otherwise>
								</c:choose>
							</div>
							<input type="file" id="input-image" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="teacherNickname" placeholder="닉네임" name="teacherNickname" value="${teacher.teacherNickname}">
							<label for="className">닉네임</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="teacherTel" placeholder="공개 연락처" value="${teacher.teacherTel}" name="teacherTel">
							<label for="teacherTel">공개 연락처</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h5>SNS</h5>
					</td>
				</tr>
				<tr>
					<td>
						<c:forEach items="${teacher.teacherSns}" var="sns">
							<c:if test="${sns.sns.snsId == 1}"><c:set var="youtube" value="${sns.teacherSnsId}"/></c:if>
							<c:if test="${sns.sns.snsId == 2}"><c:set var="instagram" value="${sns.teacherSnsId}"/></c:if>
							<c:if test="${sns.sns.snsId == 3}"><c:set var="twitter" value="${sns.teacherSnsId}"/></c:if>
							<c:if test="${sns.sns.snsId == 4}"><c:set var="facebook" value="${sns.teacherSnsId}"/></c:if>
						</c:forEach>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="youtube" placeholder="유튜브" value="${youtube}" name="youtube">
							<label for="youtube">유튜브</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="instagram" placeholder="인스타그램" value="${instagram}" name="instagram">
							<label for="instagram">인스타그램</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="twitter" placeholder="트위터" value="${twitter}" name="twitter">
							<label for="twitter">트위터</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="facebook" placeholder="페이스북" value="${facebook}" name="facebook">
							<label for="pacebook">페이스북</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="d-grid gap-2">
							<input type="submit" class="btn btn-primary" value="프로필 수정">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>