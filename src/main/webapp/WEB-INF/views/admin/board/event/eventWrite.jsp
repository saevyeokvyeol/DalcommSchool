<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- include plugin -->
    <script src="[folder where script is located]/[plugin script].js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,
				minHeight: null,
				maxHeight: null,
				focus:true,
				lang: "ko-KR",
				placeholder: '최대 2048자까지 쓸 수 있습니다.',
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {     
						for (var i = 0; i < files.length; i++) {
							sendFile(files[i], this);
						}
					}
				}
			
			});
		});

    	function sendFile(file, editor) { //썸머노트 파일 첨부
    		var form_data = new FormData();
    		form_data.append('file', file);
    		$.ajax({
    			data : form_data,
    			type : "POST",
    			url : '${pageContext.request.contextPath}/resources/static/img/event',
    			cache : false,
    			contentType : false,
    			enctype : 'multipart/form-data',
    			processData : false,
    			success : function(url) {
    				$(editor).summernote('insertImage', url, function($image) {
    					$image.css('width', "25%");
    				});
    			}
    		});
    	}
    	
    </script>
    

</head>
<body>

<div class="main-content">

	<h4> 관리자 > 이벤트 작성 </h4><br>
	
<form name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/board/event/eventInsert?${_csrf.parameterName}=${_csrf.token}"
enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table class="table">

    <tr>
        <td>
            제목
        </td>
        <td>
			<input type=text name="eventTitle" >
		</td>
    </tr>
    <tr>
        <td>
           내용
        </td>
        <td>
			<textarea name="eventContent" id="summernote"></textarea>
		</td>
    </tr>
   <tr>
        <td>
          파일 첨부
        </td>
        <td>
			<input type="file" name="file" size="30">
		</td>
    </tr>
   
    <tr>
        <td>
	        <input type=submit value=글쓰기> 
	        <input type=reset value=다시쓰기>
        </td>
    </tr>
</table>
</form>
</div>
</body>
</html>