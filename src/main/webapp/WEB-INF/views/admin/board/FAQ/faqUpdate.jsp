<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  				alert("게시글이 등록되었습니다.")
  			}
  		})
	});
    
    </script>


<script type="text/javascript">
$(function() {
	function selectfaqCategory() {
		$.ajax({
            url: "/admin/board/FAQ/faqCategory",
			type: "post",
			data: {"${_csrf.parameterName}": "${_csrf.token}"},
			dataType: "json",
			success: function(result) {
				text = ""
				$.each(result , function(index, item) {
					text += `<option value='\${item.faqCategoryId}'>\${item.faqCategoryName}</option>`;
				})
					text += ""
					$("select[name = faqCategoryId]").append(text);
				},
				error: function(err) {
					alert("카테고리를 가져올 수 없습니다.")
			}
		})
	}
	selectfaqCategory();
})
</script>

<title>Insert title here</title>

</head>
<body>
<div class="main-content">

	<h4> 고객센터 > 자주 묻는 질문 </h4><br>
	
	<form name=updateForm method=post action="${pageContext.request.contextPath}/admin/board/FAQ/faqUpdate?${_csrf.parameterName}=${_csrf.token}"
	enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type='hidden' name='faqNo' value="${faq.faqNo}">
	<table class="table">
    <tr>
        <td>
           ${faq.faqNo} 게시물 수정하기
        </td>
    </tr>
    <tr>
        <td>
            제목
        </td>
        <td>
			<input type=text name="faqTitle" value="${faq.faqTitle}">
		</td>
    </tr>
    <tr>
    	<td>
    		카테고리
    	</td>
    	<td>
    		<select name="faqCategoryId">
          </select>
    	</td>
    </tr>
    <tr>
   	    <td>
       		파일 첨부
        </td>
        <td>
			<input type="file" name="file" size="30" value="${faq.faqImg}">
		</td>
    </tr>
    <tr>
        <td>
            글 내용
        </td>
        <td>
			<textarea name="faqContent" id="summernote">${faq.faqContent}</textarea>
		</td>
    </tr>
    <tr>
        <td>
			<input type="submit" value="수정하기" name="update">
			<input type="reset" value="다시쓰기">
		</td>
    </tr>
</table>
</form>
</div>


</body>

</html>