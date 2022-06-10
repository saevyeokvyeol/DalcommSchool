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

<style type="text/css">
	#askCategory{width: 150px;}
</style>
</head>
<body>

	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/askanswer/insertStudent?${_csrf.parameterName}=${_csrf.token}" 
	enctype="multipart/form-data">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	
	 <select name="askCategoryId" id="askCategory" class="form-select" aria-label="Default select example">
		  <option value="">카테고리 종류</option>
		  <option value="1">클래스</option>
		  <option value="2">결제</option>
		  <option value="3">환불</option>
		  <option value="4">후기</option>
		  <option value="5">탈퇴</option>
	</select> 	
<table>
    <tr>
        <td>
            ID : <input type="text" name="studentId"><p>
        </td>
    </tr>
    <tr>
        <td>
           	문의 제목 : <input type="text" name="askTitle"><p>
        </td>
    </tr>
    <tr>
    	<td>
    		문의 내용 : <textarea rows="" cols="" name="askContent"></textarea><p>
    	</td>
    </tr>
    <tr>
    	<td>
    		첨부 이미지 :<input type="file" name="file" multiple="multiple"><p>
    	</td>
  	</tr> 
  	
   	<!-- <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">*파일첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		 <input type="file" name="file" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>  -->
    
</table>
	<tr>
        <span><input type=submit value=글쓰기></span> 
        <span><input type=reset value=다시쓰기></span>
    </tr>
</form>

</body>
</html>