<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
/* 
$(function() {
	function selectfaqCategory() {
		$.ajax({
			url: "/admin/board/FAQ/faqCategory",
			type: "post",
			dataType: "json",
			success: function(result) {
				alert(result);
				text = ""
				$.each(result , function(index, item) {
					text += `<option value='\${item.faqCategoryId}'>\${item.faqCategoryName}</option>`;
				})
					text += ""
					$("select[name = placeRegion]").append(text);
				},
				error: function(err) {
					alert("카테고리를 가져올 수 없습니다.")
			}
		})
	}
	selectfaqCategory();
})
 */

</script>
<head>
</head>

<body>


<form name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/board/FAQ/faqWrite"  >

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
         <p>
        <input type="button" value="Fill SELECT Dropdown List with JSON" id="bt" />
   		 </p>
        <span style="font-size:9pt;">
          <select>
          	<option>예약</option>
          	<option>결제</option>
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
		<input type="file" name="faqImg" size="30"></span></b></td>
    </tr>
   
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=글쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>
</body>


</html>