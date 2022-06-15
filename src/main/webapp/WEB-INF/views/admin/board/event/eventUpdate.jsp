<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">

<title>Insert title here</title>


    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">

	#input-image {
		display: none;
	}
	
</style>

    <script type="text/javascript">
			$(function() {
				$("#preview-image").click(function() {
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

    </script>
    <script type="text/javascript">
    
	$(function() {
		
		$("#updateForm").submit(function(event){
			console.log('수정');	
			alert("이벤트 게시글이 수정되었습니다.");
			
		})
	});
	
    </script>
</head>
<body>

	
	<form id="updateForm" name="updateForm" method=post action="${pageContext.request.contextPath}/admin/board/event/eventUpdateForm?${_csrf.parameterName}=${_csrf.token}"
	enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type='hidden' name='eventNo' value="${event.eventNo}">
	<table class="table">
    <tr>
        <td>
           ${event.eventNo} 게시물 수정하기
        </td>
    </tr>
    <tr>
        <td>
            제목
        </td>
        <td>
			<input type=text name="eventTitle" value="${event.eventTitle}">
		</td>
    </tr>
    <tr>
   	    <td>
       		첨부 파일
        </td>
        <td>
	       	<div class="mb-3">
	   			<div class="image-container mainImgCon">
				    <a><img id="preview-image" src="${pageContext.request.contextPath}/img/event/${event.eventImg}"></a>
				</div>
				<input type="file" name="file" id="input-image">
			</div>
		</td>
    </tr>
    <tr>
        <td>
            글 내용
        </td>
        <td>
			<textarea name="eventContent" id="summernote">${event.eventContent}</textarea>
		</td>
    </tr>
</table>
	 	<div class="row">
	     	<div class="col text-center">
		        <input type=submit class="btn btn-primary" value=글쓰기> 
		        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/board/event/eventList" role="button" >목록으로</a>
	        </div>
	    </div>
</form>
</body>
</html>