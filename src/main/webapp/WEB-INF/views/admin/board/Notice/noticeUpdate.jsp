<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				placeholder: '최대 2048자까지 쓸 수 있습니다.'
			
			});
		});

    </script>
    
    <script type="text/javascript">
    
	$(function() {
		$("#updateForm").submit(function(event){
				alert("게시글이 수정되었습니다.");
			}
		)
	});
	
    </script>

<head>
</head>
<body>


	<div class="main-content">

	<h4> 관리자 > 이벤트 작성 </h4><br>
	
	<form name=updateForm method=post action="${pageContext.request.contextPath}/admin/board/Notice/noticeUpdate?${_csrf.parameterName}=${_csrf.token}"
	enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type='hidden' name='noticeNo' value="${notice.noticeNo}">
	<table class="table">
    <tr>
        <td>
           ${notice.noticeNo} 게시물 수정하기
        </td>
    </tr>
    <tr>
        <td>
            제목
        </td>
        <td>
			<input type=text name="noticeTitle" value="${notice.noticeTitle}">
		</td>
    </tr>
    <tr>
   	    <td>
       		파일 첨부
        </td>
        <td>
			<input type="file" name="file" size="30" value="${notice.noticeImg}">
		</td>
    </tr>
    <tr>
        <td>
            글 내용
        </td>
        <td>
			<textarea name="noticeContent" id="summernote">${notice.noticeContent}</textarea>
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
<%-- 
<form name=updateForm method=post action="${pageContext.request.contextPath}/admin/board/Notice/noticeUpdate?${_csrf.parameterName}=${_csrf.token}"
	enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type='hidden' name='noticeNo' value="${notice.noticeNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> ${notice.noticeNo} 게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="noticeTitle" size="30"
		 value="${requestScope.notice.noticeTitle}"></span></b></td>
    </tr>
    <tr>
   	    <td width="150" height="20" >
        <p align="right"><b><span style="font-size:9pt;">파일 첨부</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="file" name="file" size="30" value="${notice.noticeImg}"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">내 용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="noticeContent" cols="50" rows="10">${requestScope.notice.noticeContent}</textarea></span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="submit" value="수정하기" name="update"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</form> --%>

</body>

</html>