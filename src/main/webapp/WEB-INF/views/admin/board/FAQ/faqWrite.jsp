<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<head>
</head>

<body>


<form name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/board/FAQ/faqWrite?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" >

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
    
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="faqTitle" size="30"></span></b></td>
    </tr>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">카테고리</span></b></p>
        </td>
        
        <td width="450" height="20"><b>
        <span style="font-size:9pt;">
          <select name="faqCategoryId">
          	
          </select>
		</span>
		
		</b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">내용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="faqContent"  rows="20" cols="20"></textarea></span></b></td>
    </tr>
   <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">파일 첨부</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="file" name="file" size="30"></span></b></td>
    </tr>
   
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=글쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>
</body>


</html>