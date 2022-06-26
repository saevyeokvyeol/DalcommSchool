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
		<style type="text/css">
			.mainImgCon {
				display: none;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				function selectAllCategory() {
					$.ajax({
						url : "${pageContext.request.contextPath}/class/selectAllCategory",
						type : "post",
						data : {"${_csrf.parameterName}" : "${_csrf.token}"},
		    			dataType: "json",
						success : function(result) {
							text = ""
							$.each(result, function(index, item) {
								text += `<option value='\${item.categoryId}'>\${item.categoryName}</option>`;
							})
							$("#categoryId").append(text);
						},
						error : function(error) {
							swal("카테고리 정보를 가져올 수 없습니다.");
						}
					}); // 아작스 종료
				} // 카테고리 가져오기 종료
				
				$(".mainFileBtn").click(function() {
					$("#input-image").click()
				})
				
				$("img").click(function() {
				    $(".mainImgCon").css("display", "none")
				    $("#preview-image").attr("src", "")
				    $(".mainFileBtn").css("display", "block")
				    $("#input-image").val("")
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
				    $(".mainImgCon").css("display", "block")
				    $(".mainFileBtn").css("display", "none")
				})
				
				$("form").submit(function() {
					if($("#input-image").val() == ""){
						swal({text: "클래스 이미지를 등록해주세요", icon: "error"})
						return false
					}
					if($("#categoryId").val() == '0'){
						swal({text: "클래스 카테고리를 선택해주세요", icon: "error"})
						return false
					}
					if($("#className").val() == ""){
						swal({text: "클래스명을 입력해주세요", icon: "error"})
						return false
					}
					if($("#classInfo").val() == ""){
						swal({text: "클래스 소개글을 작성해주세요", icon: "error"})
						return false
					}
					if($("#classPrice").val() == ""){
						swal({text: "클래스 금액을 입력해주세요", icon: "error"})
						return false
					}
				})
				
				
				
				selectAllCategory();
			})
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/teacher/class/insert?${_csrf.parameterName}=${_csrf.token}"
			enctype="multipart/form-data" method="post">
			<table id="classTable">
				<tr>
					<td>
						<div class="mb-3">
							<div class="image-container mainImgCon">
							    <a><img id="preview-image" src=""></a>
							</div>
							<button type="button" class="fileBtn mainFileBtn">
								<i class="fa-regular fa-image fa-2xl"></i>
								클래스 이미지 등록
							</button>
							<input type="file" id="input-image" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="mb-3">
							<select name='categoryId' id="categoryId" class="form-select" aria-label="Default select example">
								<option value='0'>클래스 카테고리 선택</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="className" placeholder="클래스명" name="className">
							<label for="className">클래스명</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
							<textarea class="form-control" placeholder="클래스 소개글" id="classInfo" name="classInfo" style="height: 100px"></textarea>
							<label for="classInfo">클래스 소개글</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="classPrice" placeholder="클래스 금액" name="classPrice">
							<label for="classPrice">클래스 금액</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="d-grid gap-2">
							<input class="btn btn-primary" type="submit" value="클래스 등록">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>