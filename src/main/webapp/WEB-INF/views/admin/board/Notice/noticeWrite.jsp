<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
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

    </script>
    <script type="text/javascript">
    
	$(function() {
  		$("#writeForm").submit(function(event){
  				swal("게시글이 등록되었습니다.")
  			
  		})
	});
    
    </script>

</head>

<body>

<div class="main-content">

	<h4> 고객센터 > 공지사항 </h4><br>
	
<form name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/board/Notice/noticeWrite?${_csrf.parameterName}=${_csrf.token}"
enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table class="table">

    <tr>
        <td>
            제목
        </td>
        <td>
			<input type=text name="noticeTitle" >
		</td>
    </tr>
    <tr>
        <td>
           내용
        </td>
        <td>
			<textarea name="noticeContent" id="summernote"></textarea>
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