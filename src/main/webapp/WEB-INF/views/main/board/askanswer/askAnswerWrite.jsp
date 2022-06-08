<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/askanswer/insert?${_csrf.parameterName}=${_csrf.token}" 
	enctype="multipart/form-data">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
	
	 <select name="askCategoryId">
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