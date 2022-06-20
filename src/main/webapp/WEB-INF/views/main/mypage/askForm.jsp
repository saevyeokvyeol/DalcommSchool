<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	.mainImgCon,#input-image {
			display: none;
		}
	#preview-image, .mainFileBtn, .mainImgCon, .mb-3 {
		max-width: 350px;
		max-height: 350px;
		margin: auto;
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
<div id="sidebarHeader"><h3>1대1 문의 작성</h3></div>
	<sec:authentication property="principal" var="student"/>
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/askanswer/insertStudent?${_csrf.parameterName}=${_csrf.token}" 
				enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
			<div align=right><a class="btn btn-primary"  href="${pageContext.request.contextPath}/main/mypage/askAnswerSelectById" role="button">목록으로</a></div>
		 <input type="hidden" name="studentId" value="${student.studentId}" readonly/>
		<table align="center" class="table">
				
			  	
				<tr>
					<td>
						 <select name="askCategoryId" id="askCategory" class="form-select" aria-label="Default select example">
							  <option value="">카테고리 종류</option>
							  <option value="1">로그인/회원정보</option>
							  <option value="2">클래스</option>
							  <option value="3">결제/환불</option>
							  <option value="4">이벤트/쿠폰</option>
							  <option value="5">오류</option>
						</select>
					</td>
				</tr> 	
			           
			    <tr>
			        <td>
			        	<input type="text" name="askTitle" class="form-control" >
			        </td>
			    </tr>
			    <tr>
			    	<td>
			    		 <textarea name="askContent" id="summernote"></textarea>
			    	</td>
			    </tr>
			 
			  	
				<tr> 
					<td>
				 		<div class="mb-3">
							<div class="image-container mainImgCon">
							    <a><img id="preview-image" src=""></a>
							</div>
							<button type="button" class="fileBtn mainFileBtn">
								<i class="fa-regular fa-image fa-2xl"></i>
								첨부 이미지 추가
							</button>
							<input  type="file" id="input-image" name="file">
						</div>
					</td>
				</tr>
				
			  	
		</table>
		 <div class="row">
			     	<div class="col text-center">
						<input type=submit class="btn btn-primary" value=글쓰기>
						<input type=reset class="btn btn-primary" value=다시쓰기>
					</div>	
				</div>
			</form>
		
	 
</body>
</html>