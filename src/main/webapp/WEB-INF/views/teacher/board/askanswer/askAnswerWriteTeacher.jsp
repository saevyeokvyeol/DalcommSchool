<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>


    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
	#askCategory{
		width: 150px;
		height: 40px;
	}
	.mainImgCon,#input-image {
			display: none;
		}
		
	#preview-image{
		width: 350px;
		height: 350px;
		/* object-fit:cover; */
		background-size: contain;
	
	}

</style>

<script type="text/javascript">

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			focus:true,
			lang: "ko-KR",
			placeholder: '최대 2048자까지 쓸 수 있습니다.'
		
		});
	});
	
	
	$(function(){
		
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
	})


</script>
	
</head>
<body>

	



	<div class="main-content">
		<table align="center" class="table">
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/teacher/board/askanswer/insertTeacher?${_csrf.parameterName}=${_csrf.token}" 
				enctype="multipart/form-data">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
				 <div align=right><span style="font-size:9pt;"><a class="btn btn-primary"  href="${pageContext.request.contextPath}/teacher/board/askanswer/askAnswerSelectById" role="button">목록으로</a></span></div>
		   
				<tr>
					<td>
						카테고리
					</td>
					<td>
						 <select name="askCategoryId" id="askCategory" class="form-select" aria-label="Default select example">
							  <option value="">카테고리 종류</option>
							  <option value="1">클래스</option>
							  <option value="2">결제</option>
							  <option value="3">환불</option>
							  <option value="4">후기</option>
							  <option value="5">탈퇴</option>
						</select>
					</td>
				</tr> 	
			<!-- <table> -->
			    <tr>
			    	<td>
			    		문의 ID
			    	</td>
			        <td>
			            <input type="text" name="teacherId">
			        </td>
			    </tr>
			    <tr>
			    	<td>
			    		문의 제목
			    	</td>
			        <td>
			             <input type="text" name="askTitle">
			        </td>
			    </tr>
			    <tr>
			    	<td>
			    		문의 내용
			    	</td>
			    	<td>
			    		 <textarea name="askContent" id="summernote"></textarea>
			    	</td>
			    </tr>
			  	
				<tr>
					<td>
						첨부 파일
					</td>
					<td>
						<div class="mb-3">
							<div class="image-container mainImgCon">
							    <a><img id="preview-image" src=""></a>
							</div>
							<button type="button" class="fileBtn mainFileBtn">
								<i class="fa-regular fa-image fa-2xl"></i>
								첨부 이미지 추가
							</button>
							<input type="file" id="input-image" name="file">
						</div>
					</td>
				</tr>
			  	
			  	
			</form>
		</table>
		<div class="row">
			<div class="col text-center">
				<input type=submit class="btn btn-primary" value=글쓰기>
				<input type=reset class="btn btn-primary" value=다시쓰기>
			</div>
		</div>
	</div>






</body>
</html>